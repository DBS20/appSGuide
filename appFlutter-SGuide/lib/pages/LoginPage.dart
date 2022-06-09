import 'package:flutter/material.dart';
import 'package:appsguide/pages/MenuPage.dart';
import 'package:appsguide/utilerias/colors.dart';
import 'package:appsguide/widgets/TextFieldWidget.dart';
import 'package:appsguide/widgets/ButtonWidget.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFieldWidget(
                  isPrefixIcon: true,
                  prefixIconData: Icons.person,
                  isSuffixIcon: false,
                  isMyControllerActivate: true,
                  //controller: _controllerUser,
                  hintText: 'Username...',
                  onChange: (String value) => {value}

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFieldWidget(
                  isPrefixIcon: true,
                  prefixIconData: Icons.person,
                  isSuffixIcon: false,
                  isMyControllerActivate: true,
                  //controller: _controllerUser,
                  hintText: 'Password...',
                  onChange: (String value) => {value}

              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
              child: ButtonWidget(
                tittle: 'Sign in',
                width: 200.0,
                height: 40.0,
                hasColor: false,
                onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MenuPage()));
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
