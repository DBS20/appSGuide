import 'package:appsguide/pages/LoginPage.dart';
import 'package:flutter/material.dart';

import 'package:appsguide/pages/MenuPage.dart';

import 'package:appsguide/utilerias/colors.dart';
import 'package:appsguide/widgets/TextFieldWidget.dart';
import 'package:appsguide/widgets/ButtonWidgetGradient.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

String? name;
String? id;
String? email;
String? pss;

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _controllerUser = TextEditingController();
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
              icon: Icon(Icons.close)),
        ],
        backgroundColor: GlobalColors.colorDarkGrey,
        shadowColor: GlobalColors.colorGreenLight,
        elevation: 20,
      ),
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
              child: TextFieldWidget(
                  isPrefixIcon: true,
                  prefixIconData: Icons.person,
                  isSuffixIcon: false,
                  isMyControllerActivate: true,
                  controller: _controllerUser,
                  hintText: 'Nombre completo',
                  onChange: (String value) => {value}),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFieldWidget(
                  isPrefixIcon: true,
                  //Cambiar a ícono de números
                  prefixIconData: Icons.person,
                  isSuffixIcon: false,
                  isMyControllerActivate: true,
                  //controller: _controllerUser,
                  hintText: 'Matrícula',
                  onChange: (String value) => {value}),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFieldWidget(
                  isPrefixIcon: true,
                  //Cambiar a ícono de Llave
                  prefixIconData: Icons.person,
                  isSuffixIcon: false,
                  isMyControllerActivate: true,
                  controller: _controllerUser,
                  hintText: 'Contraseña',
                  onChange: (String value) => {value}),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ButtonWidget(
                tittle: 'Guardar',
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
                  } else {
                    int.parse(id!);
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
