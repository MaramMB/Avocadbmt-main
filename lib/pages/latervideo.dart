import 'dart:html';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/expl.dart';
import 'package:flutter_application_1/pages/faceexpl.dart';
import 'package:flutter_application_1/pages/laterss.dart';
import 'package:flutter_application_1/pages/latertest.dart';
import 'package:flutter_application_1/pages/latter.dart';
import 'package:flutter_application_1/pages/latterexpl.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/speaktest.dart';
import 'package:flutter_application_1/pages/voiceexpl.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';



const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;
late String url;
late int Lindex;
List<Map<String, String>> letters = const [
  {
    'letter': 'أ',
    'name' : 'الف',
    'video' : 'videos/a.mp4',

  },
  {
    'letter': 'ب',
    'name' : 'باء',
    'video' : 'videos/ب.mp4',

  },
  {
    'letter': 'ت',
    'name' : 'تاء',
    'video' : 'videos/ت.mp4',

  },
  {
    'letter': 'ث',
    'name' : 'ثاء',
    'video' : 'videos/ث.mp4',

  },
  {
    'letter': 'ج',
    'name' : 'جيم',
    'video' : 'videos/ج.mp4',

  },
  {
    'letter': 'ح',
    'name' : 'حاء',
    'video' : 'videos/ح.mp4',

  },
  {
    'letter': 'خ',
    'name' : 'خاء',
    'video' : 'videos/خ.mp4',

  },
  {
    'letter': 'د',
    'name' : 'دال',
    'video' : 'videos/د.mp4',

  },
  {
    'letter': 'ذ',
    'name' : 'ذال',
    'video' : 'videos/ذ.mp4',

  },
  {
    'letter': 'ر',
    'name' : 'راء',
    'video' : 'videos/ر.mp4',

  },
  {
    'letter': 'ز',
    'name' : 'زاي',
    'video' : 'videos/ز.mp4',

  },
  {
    'letter': 'س',
    'name' : 'سين',
    'video' : 'videos/س.mp4',

  },
  {
    'letter': 'ش',
    'name' : 'شين',
    'video' : 'videos/ش.mp4',

  },
  {
    'letter': 'ص',
    'name' : 'صاد',
    'video' : 'videos/ص.mp4',

  },
  {
    'letter': 'ض',
    'name' : 'ضاد',
    'video' : 'videos/ض.mp4',

  },
  {
    'letter': 'ط',
    'name' : 'طاء',
    'video' : 'videos/ط.mp4',

  },
  {
    'letter': 'ظ',
    'name' : 'ظاء',
    'video' : 'videos/ظ.mp4',

  },
  {
    'letter': 'ع',
    'name' : 'عين',
    'video' : 'videos/ع.mp4',

  },
  {
    'letter': 'غ',
    'name' : 'غين',
    'video' : 'videos/غ.mp4',

  },
  {
    'letter': 'ف',
    'name' : 'فاء',
    'video' : 'videos/ف.mp4',

  },
  {
    'letter': 'ق',
    'name' : 'قاف',
    'video' : 'videos/ق.mp4',

  },
  {
    'letter': 'ك',
    'name' : 'كاف',
    'video' : 'videos/ك.mp4',

  },

  {
    'letter': 'ل',
    'name' : 'لام',
    'video' : 'videos/ل.mp4',

  },
  {
    'letter': 'م',
    'name' : 'ميم',
    'video' : 'videos/م.mp4',

  },
  {
    'letter': 'ن',
    'name' : 'نون',
    'video' : 'videos/ن.mp4',

  },
  {
    'letter': 'ه',
    'name' : 'هاء',
    'video' : 'videos/ه.mp4',

  },
  {
    'letter': 'و',
    'name' : 'واو',
    'video' : 'videos/و.mp4',

  },
  {
    'letter': 'ي',
    'name' : 'ياء',
    'video' : 'videos/ي.mp4',

  },

];
int search (String s){
  int x=0;
  for ( var i=0 ; i<letters.length;i++ )
  {
    if (letters[i]['letter']==s){
      x=i;
      url = letters[i]['video']!;
    }
  }
  return x;
}
var flickmanager;
class lettervideo extends StatefulWidget {
  late String letter;
  final String userId;
  lettervideo({
    required this.letter, required this.userId,
  });
  @override

  State<lettervideo> createState() => _lettervideoState();
}

class _lettervideoState extends State<lettervideo> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    Lindex = search(widget.letter);
     flickmanager = FlickManager(videoPlayerController: VideoPlayerController.asset(letters[Lindex]['video']!) , autoPlay: false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: Column(
        children: [
           SelectionButton(),
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
              child: SingleChildScrollView(
                child: Column(
                  children:   [

                    Row(
                      children: [
                        SizedBox(width: 50,),
                        Spacer(),
                        Text('حرف ال'+letters[Lindex]['name']!,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: "DroidKufi",
                                fontWeight: FontWeight.w700)),
                        Spacer(),
                        GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_forward_ios_rounded, size: 40, color: Colors.white,)),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    const SizedBox(height: 5,),
                    const Text("فيديو يوضح طريقة نطق الحرف",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: "DroidKufi",
                            fontWeight: FontWeight.w700)),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: 300,
                      width: 600,
                      child: FlickVideoPlayer(
                        flickManager: flickmanager,

                      ),
                    ),
                    SizedBox(height: 30,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return  lettertest(letter: letters[Lindex]['letter']!, userId: widget.userId,);
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
            ),
          )

        ],
      ),
    );

  }
}

