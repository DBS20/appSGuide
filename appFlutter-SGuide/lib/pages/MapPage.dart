import 'package:accordion/accordion.dart';
import 'package:appsguide/pages/MenuPage.dart';
import 'package:appsguide/widgets/NavigationDrawer.dart';
import 'package:flutter/material.dart';
import 'package:appsguide/utilerias/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appsguide/pages/LoginPage.dart';
import 'package:appsguide/widgets/TextFieldWidget.dart';
import 'package:appsguide/widgets/ButtonWidget.dart';

import 'package:page_transition/page_transition.dart';

class MapPage extends StatefulWidget {
  MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
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
                        type: PageTransitionType.fade, child: MenuPage()));
                //Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: LoginPage()));
                //Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTopJoined, child: LoginPage(),childCurrent: MenuPage()));
                //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
              },
              icon: Icon(Icons.close)),
        ],
        title: Text('Guía para: [Lugar]',
            style: GoogleFonts.raleway(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        backgroundColor: GlobalColors.colorGrey,
        shadowColor: GlobalColors.colorGreenLight,
        elevation: 20,
      ),
      body: SingleChildScrollView(
          child: Stack(
        children: <Widget>[
          Container(
            height: 600,
            width: 700,
            color: GlobalColors.colorDarkGrey,
          ),
          Column(children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Container(
                    height: 300,
                    width: 470,
                    margin: const EdgeInsets.only(top: 40.0, bottom: 20.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: GestureDetector(
                          /*onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        BullishPatterns()));
                          },*/
                          child: Image.asset(
                              "assets/images/schoolguideLogo.png",
                              height: 200,
                              width: 400,
                              fit: BoxFit.fill),
                        ))),
              ),
            ),
            Center(
              child: const Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '[Lugar destino]',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: GlobalColors.colorBlueCapri,
                            fontSize: 20.0)),
                  ],
                ),
              ),
            )
          ]),
        ],
      )),
      drawer: NavigationDrawer(),
    );
  }
}
