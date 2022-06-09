import 'package:flutter/material.dart';
import 'package:appsguide/utilerias/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('School Guide',style: GoogleFonts.raleway(fontSize: 20, fontStyle: FontStyle.italic,color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: GlobalColors.colorGrey,
      ),
      body: Container(
        child: Row(
          children: [
            Text("HOLA MUNDO")
          ],
        ),
      ),
    );
  }
}
