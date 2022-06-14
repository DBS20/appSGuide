import 'package:accordion/accordion.dart';
import 'package:appsguide/widgets/NavigationDrawer.dart';
import 'package:flutter/material.dart';
import 'package:appsguide/utilerias/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appsguide/pages/LoginPage.dart';
import 'package:appsguide/widgets/TextFieldWidget.dart';
import 'package:appsguide/widgets/ButtonWidget.dart';

import 'package:page_transition/page_transition.dart';

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
                //Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: LoginPage()));
                //Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTopJoined, child: LoginPage(),childCurrent: MenuPage()));
                //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
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
      body: SingleChildScrollView(
          child: Stack(
        children: <Widget>[
          Container(
            height: 1100,
            width: 700,
            color: GlobalColors.colorDarkGrey,
          ),
          Column(children: [
            Center(
              child: Container(
                  height: 250,
                  width: 470,
                  margin: const EdgeInsets.only(top: 30.0, bottom: 20.0),
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
                        child: Image.asset("assets/images/CoverSalle.jpg",
                            height: 200, width: 400, fit: BoxFit.fill),
                      ))),
            ),
            const Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'Prueba de texto',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: GlobalColors.colorBlueCapri,
                          fontSize: 20.0)),
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
                            "En la entrada principal de la calle Universidad",
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
                                tittle: "Ruta",
                                color: GlobalColors.colorWhite,
                                height: 40.0,
                                width: 80.0,
                                hasColor: false,
                                colorButton: GlobalColors.colorBlack,
                                fontSize: 10.0,
                                onPressed: () {},
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0, left: 280.0),
                          child: Align(
                              alignment: Alignment.centerRight,
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
                                tittle: "Ruta",
                                color: GlobalColors.colorWhite,
                                height: 40.0,
                                width: 80.0,
                                hasColor: false,
                                colorButton: GlobalColors.colorBlack,
                                fontSize: 10.0,
                                onPressed: () {},
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0, left: 280.0),
                          child: Align(
                              alignment: Alignment.centerRight,
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
                                tittle: "Ruta",
                                color: GlobalColors.colorWhite,
                                height: 40.0,
                                width: 80.0,
                                hasColor: false,
                                colorButton: GlobalColors.colorBlack,
                                fontSize: 10.0,
                                onPressed: () {},
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0, left: 280.0),
                          child: Align(
                              alignment: Alignment.centerRight,
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
          ]),
        ],
      )),
      drawer: NavigationDrawer(),
    );
  }
}
