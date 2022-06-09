import 'package:flutter/material.dart';
import 'package:appsguide/pages/MenuPage.dart';
import 'package:appsguide/utilerias/colors.dart';
import 'package:appsguide/widgets/TextFieldWidget.dart';
import 'package:appsguide/widgets/ButtonWidgetGradient.dart';
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
      body: Container(
        color: GlobalColors.colorDarkGrey,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network("lib/logo/sglogo.png", width: 600,height: 200,),
          Padding(
            padding: const EdgeInsets.all(15.0),
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
            padding: const EdgeInsets.all(15.0),
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
            padding: const EdgeInsets.all(15.0),
            child: ButtonWidget(
              tittle: 'LOGIN',
              width: 200.0,
              height: 50.0,
              hasColor: false,
              gradient: LinearGradient(
                colors: <Color>[GlobalColors.colorBlue,GlobalColors.colorGreenEmerald, GlobalColors.colorGreenTurquoise],
              ),
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
