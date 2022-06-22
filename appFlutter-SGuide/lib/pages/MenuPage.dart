import 'package:accordion/controllers.dart';
import 'package:appsguide/my_icons_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:accordion/accordion.dart';
import 'package:appsguide/widgets/NavigationDrawer.dart';
import 'package:appsguide/utilerias/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appsguide/widgets/ButtonWidget.dart';
import 'package:page_transition/page_transition.dart';

import 'package:appsguide/pages/LoginPage.dart';
import 'package:appsguide/pages/MapPage.dart';
import 'package:appsguide/pages/GoogleMapPage.dart';
import 'package:appsguide/services/PlacesServices.dart';
import 'package:appsguide/services/StudentServices.dart';

String? googleMapLink;

class MenuPage extends StatefulWidget {
  MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  PlacesService placesServices = new PlacesService();
  StudentsService studentServices = new StudentsService();
  bool cargando = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: LoginPage()));
              },
              icon: Icon(Icons.logout)),
        ],
        title: Text('Bienvenido $name',
            style: GoogleFonts.comfortaa(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        backgroundColor: GlobalColors.colorGrey,
        shadowColor: GlobalColors.colorGreenLight,
        elevation: 20,
      ),
      body: Container(
        color: GlobalColors.colorDarkGrey,
        height: 4000,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: GestureDetector(
                        child: Image.asset("assets/images/CoverSalle.jpg",
                            height: 200, width: 400, fit: BoxFit.fill),
                      )),
                ),
                Card(
                  color: GlobalColors.cakeBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  elevation: 10,
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          title: Text('Rutas:',
                              style: GoogleFonts.nunito(
                                  fontSize: 18,
                                  color: GlobalColors.colorLightGrey,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(
                              'Busca tu ruta más cercana para llegar al lugar que deseas',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 15,
                                  color: GlobalColors.colorLightGrey)),
                          leading: Icon(Icons.map_outlined,
                              size: 50, color: GlobalColors.colorLightGrey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: ButtonWidget(
                            tittle: "¡Vamos!",
                            color: GlobalColors.colorWhite,
                            height: 30.0,
                            width: 80.0,
                            hasColor: true,
                            fontSize: 10.0,
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      child: MapPage()));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 4.0,
                  color: GlobalColors.colorGreenLight,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    FutureBuilder(
                      future: placesServices.getPlaces(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: Text('Cargando...',
                                style: GoogleFonts.nunito(
                                    fontSize: 30,
                                    color: GlobalColors.colorGreenTurquoise,
                                    fontWeight: FontWeight.bold)),
                          );
                        }
                        return Center(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.requireData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  Card(
                                    color: GlobalColors.colorGrey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    elevation: 10,
                                    margin: EdgeInsets.all(8),
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: ListTile(
                                            title: Text(
                                                snapshot
                                                    .requireData[index].nombre,
                                                style: GoogleFonts.nunito(
                                                    fontSize: 18,
                                                    color: GlobalColors
                                                        .colorGreenTurquoise,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            subtitle: Text(
                                                snapshot.requireData[index]
                                                    .descripcion,
                                                style: GoogleFonts.nunitoSans(
                                                    fontSize: 15,
                                                    color: GlobalColors
                                                        .colorGreenTurquoise)),
                                            leading: Icon(My_icons.building,
                                                size: 50,
                                                color: GlobalColors
                                                    .colorGreenTurquoise),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: ButtonWidget(
                                              tittle: "360°",
                                              color: GlobalColors
                                                  .colorGreenEmerald,
                                              height: 30.0,
                                              width: 80.0,
                                              hasColor: true,
                                              fontSize: 10.0,
                                              onPressed: () {
                                                googleMapLink = snapshot
                                                    .requireData[index]
                                                    .linkMapa;
                                                Navigator.of(context).pop();
                                                Navigator.push(
                                                    context,
                                                    PageTransition(
                                                        type: PageTransitionType
                                                            .rightToLeftWithFade,
                                                        child:
                                                            GoogleMapPage()));
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ]),
                ),
              ],
            ),
          ]),
        ),
      ),
      drawer: NavigationDrawer(),
    );
  }
}
