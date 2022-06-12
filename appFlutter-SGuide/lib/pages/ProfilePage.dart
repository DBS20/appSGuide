import 'package:flutter/material.dart';
import 'package:appsguide/utilerias/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appsguide/pages/MenuPage.dart';

import 'package:page_transition/page_transition.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                //
              },
              icon: Icon(Icons.person)),
        ],
        title: Text('Perfil',
            style: GoogleFonts.nunito(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        backgroundColor: GlobalColors.colorGrey,
        shadowColor: GlobalColors.colorGreenLight,
        elevation: 20,
      ),
      body: Container(
        color: GlobalColors.colorLightGrey,
        child: Center(
          child: Column(
            children: [
             Image.network("lib/logo/Wallpaper2.jpg"),

              Card(
                color: GlobalColors.colorBlueRaf,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                        title: Text('Nombre completo:'),
                        subtitle: Text('Diana Bojorquez Soto'),
                        leading: Icon(Icons.person),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                color: GlobalColors.colorBlueRaf,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                        title: Text('Correo:'),
                        subtitle: Text('dbs70624@udelasalle.edu.mx'),
                        leading: Icon(Icons.mail),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                color: GlobalColors.colorBlueRaf,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                        title: Text('Matricula:'),
                        subtitle: Text('70624'),
                        leading: Icon(Icons.apps_sharp),
                      ),
                    ),
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
