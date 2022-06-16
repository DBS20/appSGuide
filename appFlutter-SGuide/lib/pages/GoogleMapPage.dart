import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:appsguide/pages/MenuPage.dart';

import 'package:appsguide/utilerias/colors.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:page_transition/page_transition.dart';



class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({Key? key}) : super(key: key);

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
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
            style: GoogleFonts.raleway(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        backgroundColor: GlobalColors.colorGrey,
        shadowColor: GlobalColors.colorGreenLight,
        elevation: 20,
      ),
      body: Container(
        child: Row(

          children: [
            Expanded(
              child: WebView(
                initialUrl: googleMapLink!,
                backgroundColor: Colors.white10,
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

