import 'package:appsguide/data/Students.dart';
import 'package:flutter/material.dart';
import 'package:appsguide/utilerias/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appsguide/pages/LoginPage.dart';
import 'package:appsguide/pages/MenuPage.dart';
import 'package:appsguide/services/StudentServices.dart';

import 'package:appsguide/widgets/ButtonWidgetGradient.dart';
import 'package:page_transition/page_transition.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  StudentsService studentsService = new StudentsService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil',
            style: GoogleFonts.comfortaa(
                fontSize: 20,
                color: GlobalColors.colorWhite,
                fontWeight: FontWeight.bold)),
        backgroundColor: GlobalColors.colorGrey,
        shadowColor: GlobalColors.colorGreenLight,
        elevation: 20,
      ),
      body: Container(
        color: GlobalColors.colorDarkGrey,
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/images/profileWallpaper.jpg"),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: FutureBuilder(
                          future: studentsService.getStudents(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            //Crear FOR para iterar entre matrícula e Index
                            if (!snapshot.hasData) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasData &&
                                snapshot.data.isEmpty) {
                              return Center(
                                child: Text('Cargando...',
                                    style: GoogleFonts.nunito(
                                        fontSize: 30,
                                        color: GlobalColors.colorGreenTurquoise,
                                        fontWeight: FontWeight.bold)),
                              );
                            }
                            return Column(
                              children: [
                                Card(
                                  color: GlobalColors.colorGrey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1)),
                                  margin: EdgeInsets.all(1),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: ListTile(
                                          title: Text('Nombre completo:',
                                              style: GoogleFonts.nunito(
                                                  fontSize: 18,
                                                  color: GlobalColors
                                                      .colorGreenTurquoise,
                                                  fontWeight: FontWeight.bold)),
                                          subtitle: Text(name!,
                                              //snapshot.requireData.nombre,
                                              style: GoogleFonts.nunito(
                                                  fontSize: 15,
                                                  color: GlobalColors
                                                      .colorGreenTurquoise)),
                                          leading: Icon(
                                              Icons.alternate_email_sharp,
                                              size: 50,
                                              color: GlobalColors
                                                  .colorGreenTurquoise),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 0.3,
                                  color: GlobalColors.colorGreenLight,
                                ),
                                Card(
                                  color: GlobalColors.colorGrey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1)),
                                  margin: EdgeInsets.all(1),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: ListTile(
                                          title: Text('Correo:',
                                              style: GoogleFonts.nunito(
                                                  fontSize: 18,
                                                  color: GlobalColors
                                                      .colorGreenTurquoise,
                                                  fontWeight: FontWeight.bold)),
                                          subtitle: Text(email!,
                                              style: GoogleFonts.nunito(
                                                  fontSize: 15,
                                                  color: GlobalColors
                                                      .colorGreenTurquoise)),
                                          leading: Icon(Icons.mail,
                                              size: 50,
                                              color: GlobalColors
                                                  .colorGreenTurquoise),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 0.3,
                                  color: GlobalColors.colorGreenLight,
                                ),
                                Card(
                                  color: GlobalColors.colorGrey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1)),
                                  margin: EdgeInsets.all(1),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: ListTile(
                                          //contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                                          title: Text('Matricula:',
                                              style: GoogleFonts.nunito(
                                                  fontSize: 18,
                                                  color: GlobalColors
                                                      .colorGreenTurquoise,
                                                  fontWeight: FontWeight.bold)),
                                          subtitle: Text(id.toString(),
                                              style: GoogleFonts.nunito(
                                                  fontSize: 15,
                                                  color: GlobalColors
                                                      .colorGreenTurquoise)),
                                          leading: Icon(Icons.apps_sharp,
                                              size: 50,
                                              color: GlobalColors
                                                  .colorGreenTurquoise),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 0.5,
                                  color: GlobalColors.colorGreenLight,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
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
                                    onPressed: () {},
                                  ),
                                )
                              ],
                            );
                          }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
