import 'package:appsguide/my_icons_icons.dart';
import 'package:appsguide/pages/RegisterPage.dart';
import 'package:appsguide/widgets/NumberFieldWidget.dart';
import 'package:flutter/material.dart';

import 'package:appsguide/pages/MenuPage.dart';

import 'package:appsguide/utilerias/colors.dart';
import 'package:appsguide/widgets/TextFieldWidget.dart';
import 'package:appsguide/widgets/ButtonWidgetGradient.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

String? name;
String? id;
String? email;
String? pss;

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerUser = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: GlobalColors.colorDarkGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/sglogo.png",
              width: 600,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: NumberFieldWidget(
                  isPrefixIcon: true,
                  prefixIconData: Icons.apps_sharp,
                  isSuffixIcon: false,
                  isMyControllerActivate: true,
                  controller: _controllerUser,
                  hintText: 'Matricula',
                  onChange: (String value) => {value}),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFieldWidget(
                  obscureText: true,
                  isPrefixIcon: true,
                  prefixIconData: My_icons.key,
                  isSuffixIcon: false,
                  isMyControllerActivate: true,
                  //controller: _controllerUser,
                  hintText: 'Contraseña',
                  onChange: (String value) => {value}),
            ),
            Padding(
              padding: const EdgeInsets.all(0.3),
              child: Container(
                width: 300,
                height: 50,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 100, 0),
                          child: Text(
                            "¿Olvidó contraseña?",
                            style: GoogleFonts.nunito(
                                fontSize: 12,
                                color: GlobalColors.colorBlueCapri,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: new GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: RegisterPage()));
                            },
                            child: new Text(
                              "Registro",
                              style: GoogleFonts.nunito(
                                  fontSize: 12,
                                  color: GlobalColors.colorBlueCapri,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ButtonWidget(
                tittle: 'Acceder',
                width: 200.0,
                height: 50.0,
                hasColor: false,
                gradient: LinearGradient(
                  colors: <Color>[
                    GlobalColors.colorBlue,
                    GlobalColors.colorGreenEmerald,
                    GlobalColors.colorGreenTurquoise
                  ],
                ),
                onPressed: () {
                  //captura de datos
                  id = _controllerUser.text;
                  if (_controllerUser.text.isEmpty) {
                    id = "70624";
                    int.parse(id!);
                    name = "Diana Bojorquez Soto";
                    email = "dbs70624@udelasalle.edu.mx";
                  } else {
                    int.parse(id!);
                    name = "Marvin Flores";
                    email = "mf@udelasalle.edu.mx";
                  }

                  //condición de que existe el usuario

                  //cambiamos vista
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: MenuPage()));
                  //Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftJoined, child: MenuPage(), childCurrent: LoginPage()));
                  //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MenuPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
