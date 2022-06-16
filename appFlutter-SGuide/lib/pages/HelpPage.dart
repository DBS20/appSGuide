import 'package:flutter/material.dart';

import 'package:appsguide/utilerias/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';


import 'package:page_transition/page_transition.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {

   late VideoPlayerController _controller;

   @override
   void initState() {
     super.initState();
     //_controller = VideoPlayerController.asset("dataSource")
     _controller = VideoPlayerController.asset('assets/video/videoGuide.mp4')
       ..initialize().then((_) {
         // Ensure the first frame is shown after the videos is initialized, even before the play button has been pressed.
         setState(() {});
       });
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Ayuda',
            style: GoogleFonts.comfortaa(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),

        backgroundColor: GlobalColors.colorGrey,
        shadowColor: GlobalColors.colorGreenLight,
        elevation: 20,
      ),
      body: Center(
        child: _controller.value.isInitialized ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ): Container(),
        ), floatingActionButton: FloatingActionButton(
          backgroundColor: GlobalColors.colorGreenEmerald,
          onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        }, child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

   @override
   void dispose() {
     super.dispose();
     _controller.dispose();
   }
}
