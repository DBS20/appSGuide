import 'package:flutter/material.dart';
import 'package:appsguide/utilerias/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appsguide/pages/LoginPage.dart';
import 'package:appsguide/widgets/TextFieldWidget.dart';
import 'package:appsguide/widgets/ButtonWidget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
              },
              icon: Icon(Icons.logout)),
        ],
        title: Text('Menu SGuide',style: GoogleFonts.raleway(fontSize: 20, fontStyle: FontStyle.italic,color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: GlobalColors.colorGrey,

      ),
      body: Container(
        child: Text("HOLA MUNDO"),
      ),
    );
  }
}
