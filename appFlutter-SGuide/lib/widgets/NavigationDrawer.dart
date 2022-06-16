import 'package:appsguide/pages/MenuPage.dart';
import 'package:flutter/material.dart';
import 'package:appsguide/utilerias/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:appsguide/pages/ProfilePage.dart';
import 'package:appsguide/pages/HelpPage.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawer();
}

class _NavigationDrawer extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: GlobalColors.blackBackgroundNavigation,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: GlobalColors.colorBlack,
            ),
            accountName: Text('Alan Guzmán', style: GoogleFonts.comfortaa(fontSize: 14,color: GlobalColors.colorWhite,fontWeight: FontWeight.bold)),
            accountEmail: Text('af189107@gmail.com',style: GoogleFonts.comfortaa(fontSize: 12,color: GlobalColors.colorWhite)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Color.alphaBlend(Colors.black, Colors.black),
              backgroundImage:
                  ExactAssetImage("assets/images/profile.png"),
            ),
          ),
          Ink(
            color: Color.fromARGB(64, 0, 0, 0),
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: GlobalColors.colorGreenEmerald,
              ),
              title: Text('Inicio', style: GoogleFonts.nunito(fontSize: 15,color: GlobalColors.colorBlueCapri, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MenuPage()));
              },
            ),
          ),

          Divider(
            thickness: 0.5,
            color: GlobalColors.colorGreenLight,
          ),

          Ink(
            color: Color.fromARGB(64, 0, 0, 0),
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: GlobalColors.colorGreenEmerald,
              ),
              title: Text('Datos de Cuenta', style: GoogleFonts.nunito(fontSize: 15,color: GlobalColors.colorBlueCapri, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ProfilePage()));
              },
            ),
          ),

          Divider(
            thickness: 0.5,
            color: GlobalColors.colorGreenLight,
          ),

          Ink(
            color: Color.fromARGB(64, 0, 0, 0),
            child: ListTile(
              leading: Icon(
                Icons.question_answer,
                color: GlobalColors.colorGreenEmerald,
              ),
              title: Text('Ayuda', style: GoogleFonts.nunito(fontSize: 15,color: GlobalColors.colorBlueCapri,fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => HelpPage()));
              },
            ),
          ),

          Divider(
            thickness: 0.5,
            color: GlobalColors.colorGreenLight,
          ),

          Ink(
            color: Color.fromARGB(64, 0, 0, 0),
            child: ListTile(
              leading: Icon(
                Icons.close,
                color: GlobalColors.colorGreenEmerald,
              ),
              title: Text('Cerrar', style: GoogleFonts.nunito(fontSize: 15,color: GlobalColors.colorBlueCapri, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
