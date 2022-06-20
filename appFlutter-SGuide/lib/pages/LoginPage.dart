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
import 'package:appsguide/services/StudentServices.dart';

String? name;
int? id;
String? email;
String? pss;
bool flag = false;

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  StudentsService studentService = new StudentsService();
  bool cargando = true;
  final TextEditingController _controllerUser = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: GlobalColors.colorDarkGrey,
          height: 1000.0,
          child: SingleChildScrollView(
            child: FutureBuilder(
                future: studentService.getStudents(),
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
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 100.0, bottom: 100.0),
                        child: Image.asset(
                          "assets/images/sglogo.png",
                          width: 600,
                          height: 200,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: NumberFieldWidget(
                            isPrefixIcon: true,
                            prefixIconData: Icons.apps_sharp,
                            isSuffixIcon: false,
                            isMyControllerActivate: true,
                            controller: _controllerUser,
                            hintText: 'Matrícula',
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
                            controller: _controllerPassword,
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
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 0, 100, 0),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: new GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType
                                                    .rightToLeft,
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
                            //Captura de datos
                            if (_controllerUser.text.isEmpty ||
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
                                        child:
                                            ListBody(children: const <Widget>[
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
                                          color:
                                              GlobalColors.colorGreenTurquoise,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25.0),
                                      contentTextStyle: const TextStyle(
                                          color:
                                              GlobalColors.colorGreenTurquoise),
                                    );
                                  });
                            } else {
                              flag = false;
                              id = int.parse(_controllerUser.text);
                              pss = _controllerPassword.text;
                              for (var i = 0;
                                  i <= snapshot.requireData.length;
                                  i++) {
                                if (id == snapshot.requireData[i].matricula &&
                                    pss == snapshot.requireData[i].contrasena) {
                                  name = snapshot.requireData[i].nombre;
                                  email = snapshot.requireData[i].correo;
                                  pss = snapshot.requireData[i].contrasena;
                                  flag = true;
                                  Navigator.of(context).pop();
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child: MenuPage()));
                                  break;
                                }
                                if (flag == false &&
                                    i == snapshot.requireData.length - 1) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                            "Datos incorrectos",
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
                                                      "No existe la matrícula o la contraseña es incorrecta, por favor, verifique sus datos.")
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
                                  break;
                                }
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  );
                }),
          )),
    );
  }
}
