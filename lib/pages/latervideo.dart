import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/expl.dart';
import 'package:flutter_application_1/pages/faceexpl.dart';
import 'package:flutter_application_1/pages/laterss.dart';
import 'package:flutter_application_1/pages/latertest.dart';
import 'package:flutter_application_1/pages/latterexpl.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/speaktest.dart';
import 'package:flutter_application_1/pages/voiceexpl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'manag.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;
class lettervideo extends StatefulWidget {

  const lettervideo({Key? key}) : super(key: key);

  @override
  State<lettervideo> createState() => _lettervideoState();
}

class _lettervideoState extends State<lettervideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: Column(
        children: [
          const SelectionButton(),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.2,
            width: MediaQuery.of(context).size.width / 1.8,
            decoration: const BoxDecoration(
              // color: Color(0x6BFFFFFF),
              gradient:LinearGradient(
                colors: [
                  Color(0x6BFFFFFF),
                  Color(0x5FC3FFC3),
                  Color(0xA65D86A6),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children:   [
                  const Text("حرف العين",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: "DroidKufi",
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 5,),
                  const Text("فيديو يوضح طريقة نطق الحرف",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: "DroidKufi",
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 10,),
                  YoutubePlayer(
                   width: MediaQuery.of(context).size.width / 2.5,
                    controller: YoutubePlayerController(
                      initialVideoId: 'https://www.youtube.com/watch?v=KXG-u2SOD7M', //Add videoID.
                      flags: const YoutubePlayerFlags(
                        hideControls: false,
                        controlsVisibleAtStart: true,
                        autoPlay: false,
                        mute: false,
                      ),
                    ),
                    showVideoProgressIndicator: true,
                    // progressIndicatorColor: AppColors.primary,
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const lettertest();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                      elevation: 2.0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 12),
                    ),
                    child: const Text("التالي",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "DroidKufi",
                          fontSize: 20.0,
                        )),
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    );

  }
}


