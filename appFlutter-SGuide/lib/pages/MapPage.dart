import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:appsguide/pages/MenuPage.dart';
import 'package:appsguide/widgets/NavigationDrawer.dart';

import 'package:appsguide/utilerias/colors.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:page_transition/page_transition.dart';




class MapPage extends StatefulWidget {
  MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: MenuPage()));
              },
              icon: Icon(Icons.close)),
        ],
        title: Text('Rutas',
            style: GoogleFonts.comfortaa(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),

        backgroundColor: GlobalColors.colorGrey,
        shadowColor: GlobalColors.colorGreenLight,
        elevation: 20,
      ),
      body: Container(
        child: Row(

          children: [
            Expanded(
              child: WebView(
                initialUrl: "https://www.google.com/maps/d/u/0/viewer?hl=es-419&hl=es-419&mid=1xzqdwTrqymW5hIF2m5ROK9u-SWwOD2c&ll=21.15169201723427%2C-101.71122303489506&z=17",
                backgroundColor: Colors.white10,
                javascriptMode: JavascriptMode.unrestricted,
              ),
              //Image.network("https://www.google.com/maps/@21.1537915,-101.7109448,3a,75y,340h,80t/data=!3m4!1e1!3m2!1sAF1QipP97A1IpldVO_S-lnOht0IK6ONkOgH8MVazR38y!2e10"),
            ),
          ],
        ),
      ),
      drawer: NavigationDrawer(),
    );
  }
}
