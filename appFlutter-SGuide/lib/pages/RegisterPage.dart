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
                    Result alumno = new Result();
                    alumno.matricula = int.parse(_controllerEnrolled.text);
                    alumno.nombre = _controllerName.text;
                    alumno.correo = _controllerEmail.text;
                    alumno.contrasena = _controllerPassword.text;
                    alumno.rol = "STD";
                    studentsService.addStudent(alumno);
                    //Captura de datos
                    /* if (_controllerUser.text.isEmpty ||
                                          _controllerPassword.text.isEmpty) {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                  "Datos vacíos",
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
                                                            "Por favor, ingrese los datos solicitados")
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
                                      } else {
                                        flag = false;
                                        id = int.parse(_controllerUser.text);
                                        pss = _controllerPassword.text;
                                        for (var i = 0;
                                            i <= snapshot.requireData.length;
                                            i++) {
                                          if (id ==
                                                  snapshot.requireData[i]
                                                      .matricula &&
                                              pss ==
                                                  snapshot.requireData[i]
                                                      .contrasena) {
                                            name =
                                                snapshot.requireData[i].nombre;
                                            email =
                                                snapshot.requireData[i].correo;
                                            pss = snapshot
                                                .requireData[i].contrasena;
                                            flag = true;
                                            Navigator.of(context).pop();
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type: PageTransitionType
                                                        .rightToLeft,
                                                    child: MenuPage()));
                                            break;
                                          }
                                          if (flag == false &&
                                              i ==
                                                  snapshot.requireData.length -
                                                      1) {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                      "Datos incorrectos",
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    content:
                                                        SingleChildScrollView(
                                                      child: ListBody(
                                                          children: const <
                                                              Widget>[
                                                            Divider(
                                                              thickness: 1.0,
                                                              color: GlobalColors
                                                                  .colorGreenLight,
                                                            ),
                                                            Text(
                                                                "No existe la matrícula o la contraseña es incorrecta, por favor, verifique sus datos.")
                                                          ]),
                                                    ),
                                                    backgroundColor:
                                                        GlobalColors.colorGrey,
                                                    titleTextStyle: const TextStyle(
                                                        color: GlobalColors
                                                            .colorGreenTurquoise,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 25.0),
                                                    contentTextStyle:
                                                        const TextStyle(
                                                            color: GlobalColors
                                                                .colorGreenTurquoise),
                                                  );
                                                });
                                            break;
                                          }
                                        }
                                      }*/

                    /*
                    //captura de datos
                    id = controller.text;
                    if (_controllerUser.text.isEmpty) {
                      id = "70624";
                      int.parse(id!);
                    } else {
                      int.parse(id!);
                    }*/

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
      ),
    );
  }
}
