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
                Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: LoginPage()));
                //Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: LoginPage()));
                //Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTopJoined, child: LoginPage(),childCurrent: MenuPage()));
                //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
              },
              icon: Icon(Icons.logout)),
        ],
        title: Text('¡Bienvenido: '+ id!,
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
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/CoverSalle.jpg"),
                colorFilter: ColorFilter.mode(
                    Color.fromRGBO(0, 0, 0, 0.682), BlendMode.darken),
                fit: BoxFit.fitHeight,
                opacity: 0.6,
              ),
            ),
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
                        child: Image.asset("assets/images/schoolguideLogo.png",
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
              child: Container(
                decoration: const BoxDecoration(
                    color: GlobalColors.cakeBlue,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 250,
                width: 400,
                margin: const EdgeInsets.only(top: 30.0, bottom: 20.0),
              ),
            ),
            Center(
              child: Container(
                  decoration: const BoxDecoration(
                      color: GlobalColors.blockBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  height: 100,
                  width: 450,
                  margin: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("A",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Anfiteatro",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 250.0, top: 20.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text("Detalle",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20)),
                            ),
                          )
                        ],
                      )
                    ]),
                  )),
            ),
            Center(
              child: Container(
                  decoration: const BoxDecoration(
                      color: GlobalColors.blockBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  height: 100,
                  width: 450,
                  margin: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("B",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Anfiteatro",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 250.0, top: 20.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text("Detalle",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20)),
                            ),
                          )
                        ],
                      )
                    ]),
                  )),
            ),
          ]),
        ],
      )),
      drawer: NavigationDrawer(),
    );
  }
}
