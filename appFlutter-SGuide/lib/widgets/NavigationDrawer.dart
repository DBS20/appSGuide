import 'package:flutter/material.dart';
import 'package:appsguide/utilerias/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appsguide/pages/LoginPage.dart';
import 'package:appsguide/widgets/TextFieldWidget.dart';
import 'package:appsguide/widgets/ButtonWidget.dart';

import 'package:appsguide/pages/ProfilePage.dart';

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
            accountName: Text('Alan Guzmán'),
            accountEmail: Text('af189107@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Color.alphaBlend(Colors.black, Colors.black),
              backgroundImage:
                  ExactAssetImage("assets/images/schoolguideLogo.png"),
            ),
          ),
          Ink(
            color: Color.fromARGB(64, 0, 0, 0),
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: GlobalColors.colorGreenEmerald,
              ),
              title: Text(
                'Inicio',
                style: TextStyle(
                  color: GlobalColors.colorBlueCapri,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                /*Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => FirstPage()));*/
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
              title: Text(
                'Datos de cuenta',
                style: TextStyle(color: GlobalColors.colorBlueCapri),
              ),
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
              title: Text(
                'Ayuda',
                style: TextStyle(color: GlobalColors.colorBlueCapri),
              ),
              onTap: () {
                Navigator.of(context).pop();
                /*Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => XauUsdPage()));*/
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
              title: Text(
                'Cerrar',
                style: TextStyle(color: GlobalColors.colorBlueCapri),
              ),
              onTap: () {
                Navigator.of(context).pop();
                /*Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => XagUsdPage()));*/
              },
            ),
          ),
        ],
      ),
    );
  }
}
