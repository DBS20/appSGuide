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

String? googleMapLink;

class MenuPage extends StatefulWidget {
  MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
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
        title: Text('¡Bienvenido: ' + id!,
            style: GoogleFonts.raleway(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        backgroundColor: GlobalColors.colorGrey,
        shadowColor: GlobalColors.colorGreenLight,
        elevation: 20,
      ),
      body: Container(
        color:  GlobalColors.colorDarkGrey,
        height: 4000,
        child:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
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
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    elevation: 10,
                    margin: EdgeInsets.all(8),

                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            //contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                            title: Text('Rutas:', style: GoogleFonts.nunito(fontSize: 18,color: GlobalColors.colorLightGrey,fontWeight: FontWeight.bold)),
                            subtitle: Text('Busca tu ruta más cercana para llegar al lugar que deseas', style: GoogleFonts.nunito(fontSize: 15,color: GlobalColors.colorLightGrey)),
                            leading: Icon(Icons.map_outlined, size: 50,color: GlobalColors.colorLightGrey),
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

                  Center(
                      child: Accordion(
                        maxOpenSections: 2,
                        children: [
                          AccordionSection(
                            headerBackgroundColor: GlobalColors.colorLightGrey,
                            headerBackgroundColorOpened: GlobalColors.colorGrey,
                            isOpen: false,
                            header: Text(
                              'Rectoría',
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: GlobalColors.colorGreenEmerald,
                              ),
                            ),
                            content: Column(children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                      "En la entrada principal de la calle Universidad",
                                      style: GoogleFonts.nunito(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic)),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.0, left: 10.0),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: ButtonWidget(
                                          tittle: "360°",
                                          color: GlobalColors.colorWhite,
                                          height: 40.0,
                                          width: 80.0,
                                          hasColor: false,
                                          colorButton: GlobalColors.colorBlack,
                                          fontSize: 10.0,

                                          onPressed: () {

                                            googleMapLink = "https://www.google.com/maps/@21.1537915,-101.7109448,3a,75y,340h,80t/data=!3m4!1e1!3m2!1sAF1QipP97A1IpldVO_S-lnOht0IK6ONkOgH8MVazR38y!2e10";

                                            Navigator.of(context).pop();
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type: PageTransitionType
                                                        .rightToLeftWithFade,
                                                    child: GoogleMapPage()));
                                          },
                                        )),
                                  ),
                                ],
                              )
                            ]),
                          ),

                          AccordionSection(
                            headerBackgroundColor: GlobalColors.colorLightGrey,
                            headerBackgroundColorOpened: GlobalColors.colorGrey,
                            isOpen: false,
                            header: Text(
                              'SAI',
                              style: TextStyle(
                                  color: GlobalColors.colorGreenEmerald,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            content: Column(children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("Enfermería al lado mantenimiento",
                                      style: TextStyle(fontSize: 20)),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.0, left: 10.0),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: ButtonWidget(
                                          tittle: "360°",
                                          color: GlobalColors.colorWhite,
                                          height: 40.0,
                                          width: 80.0,
                                          hasColor: false,
                                          colorButton: GlobalColors.colorBlack,
                                          fontSize: 10.0,
                                          onPressed: () {},
                                        )),
                                  ),
                                ],
                              )
                            ]),
                          ),

                          AccordionSection(
                            headerBackgroundColor: GlobalColors.colorLightGrey,
                            headerBackgroundColorOpened: GlobalColors.colorGrey,
                            isOpen: false,
                            header: Text(
                              'Cristales',
                              style: TextStyle(
                                  color: GlobalColors.colorGreenEmerald,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            content: Column(children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                      "Quien fuera servilleta para tocar esos labios",
                                      style: TextStyle(fontSize: 20)),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.0, left: 10.0),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: ButtonWidget(
                                          tittle: "360°",
                                          color: GlobalColors.colorWhite,
                                          height: 40.0,
                                          width: 80.0,
                                          hasColor: false,
                                          colorButton: GlobalColors.colorBlack,
                                          fontSize: 10.0,
                                          onPressed: () {},
                                        )),
                                  ),
                                ],
                              )
                            ]),
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: NavigationDrawer(),
    );
  }
}
