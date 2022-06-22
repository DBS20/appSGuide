import 'package:appsguide/my_icons_icons.dart';
import 'package:appsguide/pages/LoginPage.dart';
import 'package:appsguide/data/Students.dart';
import 'package:appsguide/widgets/NumberFieldWidget.dart';
import 'package:flutter/material.dart';

import 'package:appsguide/pages/MenuPage.dart';
import 'package:appsguide/utilerias/colors.dart';
import 'package:appsguide/widgets/TextFieldWidget.dart';
import 'package:appsguide/widgets/ButtonWidgetGradient.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'package:appsguide/services/StudentServices.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEnrolled = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerPassword2 = TextEditingController();

  StudentsService studentsService = new StudentsService();
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
      body: SingleChildScrollView(
        child: Container(
          height: 900,
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
                padding: const EdgeInsets.all(12.0),
                child: TextFieldWidget(
                    isPrefixIcon: true,
                    prefixIconData: Icons.person,
                    isSuffixIcon: false,
                    isMyControllerActivate: true,
                    controller: _controllerName,
                    hintText: 'Nombre completo',
                    onChange: (String value) => {value}),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: NumberFieldWidget(
                    isPrefixIcon: true,
                    //Cambiar a ícono de números
                    prefixIconData: Icons.apps_sharp,
                    isSuffixIcon: false,
                    isMyControllerActivate: true,
                    controller: _controllerEnrolled,
                    hintText: 'Matrícula',
                    onChange: (String value) => {value}),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFieldWidget(
                    isPrefixIcon: true,
                    //Cambiar a ícono de números
                    prefixIconData: My_icons.email,
                    isSuffixIcon: false,
                    isMyControllerActivate: true,
                    controller: _controllerEmail,
                    hintText: 'Correo',
                    onChange: (String value) => {value}),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFieldWidget(
                    isPrefixIcon: true,
                    obscureText: true,
                    //Cambiar a ícono de Llave
                    prefixIconData: My_icons.key,
                    isSuffixIcon: false,
                    isMyControllerActivate: true,
                    controller: _controllerPassword,
                    hintText: 'Contraseña',
                    onChange: (String value) => {value}),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFieldWidget(
                    isPrefixIcon: true,
                    obscureText: true,
                    //Cambiar a ícono de Llave
                    prefixIconData: My_icons.key,
                    isSuffixIcon: false,
                    isMyControllerActivate: true,
                    controller: _controllerPassword2,
                    hintText: 'Confirmar contraseña',
                    onChange: (String value) => {value}),
              ),
              FutureBuilder(
                  future: studentsService.getStudents(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    //Crear FOR para iterar entre matrícula e Index
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasData && snapshot.data.isEmpty) {
                      return Center(
                        child: Text('Cargando...',
                            style: GoogleFonts.nunito(
                                fontSize: 30,
                                color: GlobalColors.colorGreenTurquoise,
                                fontWeight: FontWeight.bold)),
                      );
                    }
                    return Padding(
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
                          //Captura de datos
                          if (_controllerName.text.isEmpty ||
                              _controllerEmail.text.isEmpty ||
                              _controllerEnrolled.text.isEmpty ||
                              _controllerPassword.text.isEmpty ||
                              _controllerPassword2.text.isEmpty) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text(
                                      "Datos vacíos",
                                      textAlign: TextAlign.center,
                                    ),
                                    content: SingleChildScrollView(
                                      child: ListBody(children: const <Widget>[
                                        Divider(
                                          thickness: 1.0,
                                          color: GlobalColors.colorGreenLight,
                                        ),
                                        Text(
                                            "Por favor, ingrese los datos solicitados")
                                      ]),
                                    ),
                                    backgroundColor: GlobalColors.colorGrey,
                                    titleTextStyle: const TextStyle(
                                        color: GlobalColors.colorGreenTurquoise,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0),
                                    contentTextStyle: const TextStyle(
                                        color:
                                            GlobalColors.colorGreenTurquoise),
                                  );
                                });
                          } else if (_controllerPassword.text !=
                              _controllerPassword2.text) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text(
                                      "Contraseñas incorrectas",
                                      textAlign: TextAlign.center,
                                    ),
                                    content: SingleChildScrollView(
                                      child: ListBody(children: const <Widget>[
                                        Divider(
                                          thickness: 1.0,
                                          color: GlobalColors.colorGreenLight,
                                        ),
                                        Text(
                                            "Lo sentimos. Las contraseñas no coinciden")
                                      ]),
                                    ),
                                    backgroundColor: GlobalColors.colorGrey,
                                    titleTextStyle: const TextStyle(
                                        color: GlobalColors.colorGreenTurquoise,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0),
                                    contentTextStyle: const TextStyle(
                                        color:
                                            GlobalColors.colorGreenTurquoise),
                                  );
                                });
                          } else {
                            id = int.parse(_controllerEnrolled.text);
                            email = _controllerEmail.text;
                            for (var i = 0;
                                i <= snapshot.requireData.length;
                                i++) {
                              if (id == snapshot.requireData[i].matricula) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                          "Matrícula incorrecta",
                                          textAlign: TextAlign.center,
                                        ),
                                        content: SingleChildScrollView(
                                          child:
                                              ListBody(children: const <Widget>[
                                            Divider(
                                              thickness: 1.0,
                                              color:
                                                  GlobalColors.colorGreenLight,
                                            ),
                                            Text(
                                                "Lo sentimos. Esta matrícula ya está registrada.")
                                          ]),
                                        ),
                                        backgroundColor: GlobalColors.colorGrey,
                                        titleTextStyle: const TextStyle(
                                            color: GlobalColors
                                                .colorGreenTurquoise,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25.0),
                                        contentTextStyle: const TextStyle(
                                            color: GlobalColors
                                                .colorGreenTurquoise),
                                      );
                                    });
                                break;
                              } else if (email ==
                                  snapshot.requireData[i].correo) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                          "Correo incorrecto",
                                          textAlign: TextAlign.center,
                                        ),
                                        content: SingleChildScrollView(
                                          child:
                                              ListBody(children: const <Widget>[
                                            Divider(
                                              thickness: 1.0,
                                              color:
                                                  GlobalColors.colorGreenLight,
                                            ),
                                            Text(
                                                "Lo sentimos. Este correo ya está registrado.")
                                          ]),
                                        ),
                                        backgroundColor: GlobalColors.colorGrey,
                                        titleTextStyle: const TextStyle(
                                            color: GlobalColors
                                                .colorGreenTurquoise,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25.0),
                                        contentTextStyle: const TextStyle(
                                            color: GlobalColors
                                                .colorGreenTurquoise),
                                      );
                                    });
                                break;
                              } else {
                                if (i == snapshot.requireData.length - 1) {
                                  Result alumno = new Result();
                                  alumno.matricula =
                                      int.parse(_controllerEnrolled.text);
                                  alumno.nombre = _controllerName.text;
                                  alumno.correo = _controllerEmail.text;
                                  alumno.contrasena = _controllerPassword.text;
                                  alumno.rol = "STD";
                                  studentsService.addStudent(alumno);
                                  id = alumno.matricula;
                                  name = alumno.nombre;
                                  email = alumno.correo;
                                  pss = alumno.contrasena;
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                            "Usuario creado",
                                            textAlign: TextAlign.center,
                                          ),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                                children: const <Widget>[
                                                  Divider(
                                                    thickness: 1.0,
                                                    color: GlobalColors
                                                        .colorGreenLight,
                                                  ),
                                                  Text(
                                                      "Registro completo. ¡Muchas gracias!")
                                                ]),
                                          ),
                                          backgroundColor:
                                              GlobalColors.colorGrey,
                                          titleTextStyle: const TextStyle(
                                              color: GlobalColors
                                                  .colorGreenTurquoise,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25.0),
                                          contentTextStyle: const TextStyle(
                                              color: GlobalColors
                                                  .colorGreenTurquoise),
                                        );
                                      });

                                  Navigator.of(context).pop();
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child: MenuPage()));
                                  break;
                                }
                              }
                            }
                          }
                        },
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
