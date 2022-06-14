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
        title: Text('Perfil',
            style: GoogleFonts.nunito(
                fontSize: 20,
                fontStyle: FontStyle.italic,
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

             Image.network("lib/logo/profileWallpaper.jpg"),

              Padding(
                padding: const EdgeInsets.all(5.0),

                child: Column(
                  children: [
                    Card(
                      color: GlobalColors.colorGrey,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
                      margin: EdgeInsets.all(1),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListTile(
                              title: Text('Nombre completo:', style: GoogleFonts.nunito(fontSize: 18,color: GlobalColors.colorGreenTurquoise,fontWeight: FontWeight.bold)),
                              subtitle: Text('Diana Bojorquez Soto',style: GoogleFonts.nunito(fontSize: 15,color: GlobalColors.colorGreenTurquoise)),
                              leading: Icon(Icons.alternate_email_sharp, size: 50, color: GlobalColors.colorGreenTurquoise),
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
                      margin: EdgeInsets.all(1),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListTile(
                              title: Text('Correo:', style: GoogleFonts.nunito(fontSize: 18,color: GlobalColors.colorGreenTurquoise,fontWeight: FontWeight.bold)),
                              subtitle: Text('dbs70624@udelasalle.edu.mx', style: GoogleFonts.nunito(fontSize: 15,color: GlobalColors.colorGreenTurquoise)),
                              leading: Icon(Icons.mail, size: 50, color: GlobalColors.colorGreenTurquoise),
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
                      margin: EdgeInsets.all(1),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListTile(
                              //contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                              title: Text('Matricula:', style: GoogleFonts.nunito(fontSize: 18,color: GlobalColors.colorGreenTurquoise,fontWeight: FontWeight.bold)),
                              subtitle: Text('70624', style: GoogleFonts.nunito(fontSize: 15,color: GlobalColors.colorGreenTurquoise)),
                              leading: Icon(Icons.apps_sharp, size: 50,color: GlobalColors.colorGreenTurquoise),
                            ),
                          ),
                        ],
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
