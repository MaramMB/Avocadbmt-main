import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/latertest.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/speaktest.dart';
import 'package:flutter_application_1/pages/voiceexpl.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'manag.dart';

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
    'video' : 'https://youtu.be/Vdch39qe5_0',

  },
  {
    'letter': 'ب',
    'name' : 'باء',
    'video' : 'https://youtu.be/snBplpE9HPQ',

  },
  {
    'letter': 'ت',
    'name' : 'تاء',
    'video' : 'https://youtu.be/NRAHR79_FD8',

  },
  {
    'letter': 'ث',
    'name' : 'ثاء',
    'video' : 'https://youtu.be/N9cDgSjmX2E',

  },
  {
    'letter': 'ج',
    'name' : 'جيم',
    'video' : 'https://youtu.be/wUX_1m0NJ5o',

  },
  {
    'letter': 'ح',
    'name' : 'حاء',
    'video' : 'https://youtu.be/569GkdUjPCo',

  },
  {
    'letter': 'خ',
    'name' : 'خاء',
    'video' : 'https://youtu.be/F-a8viuS4Bw',

  },
  {
    'letter': 'د',
    'name' : 'دال',
    'video' : 'https://youtu.be/p4mXFsF1FnY',

  },
  {
    'letter': 'ذ',
    'name' : 'ذال',
    'video' : 'https://youtu.be/SsVVi0EE7ow',

  },
  {
    'letter': 'ر',
    'name' : 'راء',
    'video' : 'https://youtu.be/1ZifdMbGjLE',

  },
  {
    'letter': 'ز',
    'name' : 'زاي',
    'video' : 'https://youtu.be/41LRxNKgnjk',

  },
  {
    'letter': 'س',
    'name' : 'سين',
    'video' : 'https://youtu.be/0OIh22MQXtM',

  },
  {
    'letter': 'ش',
    'name' : 'شين',
    'video' : 'https://youtu.be/EXwAa_MiRl0',

  },
  {
    'letter': 'ص',
    'name' : 'صاد',
    'video' : 'https://youtu.be/3usY54GS-0o',

  },
  {
    'letter': 'ض',
    'name' : 'ضاد',
    'video' : 'https://youtu.be/H6XWY5YiMVU',

  },
  {
    'letter': 'ط',
    'name' : 'طاء',
    'video' : 'https://youtu.be/Ueh2dk_sIw8',

  },
  {
    'letter': 'ظ',
    'name' : 'ظاء',
    'video' : 'https://youtu.be/QjrWwoRwkfw',

  },
  {
    'letter': 'ع',
    'name' : 'عين',
    'video' : 'https://youtu.be/u_qPMA7fP48',

  },
  {
    'letter': 'غ',
    'name' : 'غين',
    'video' : 'https://youtu.be/KXG-u2SOD7M',

  },
  {
    'letter': 'ف',
    'name' : 'فاء',
    'video' : 'https://youtu.be/my12d4B8als',

  },
  {
    'letter': 'ق',
    'name' : 'قاف',
    'video' : 'https://youtu.be/3vnUEw1L_RQ',

  },
  {
    'letter': 'ك',
    'name' : 'كاف',
    'video' : 'https://youtu.be/WsQKd8U7Nnk',

  },

  {
    'letter': 'ل',
    'name' : 'لام',
    'video' : 'https://youtu.be/lGhEbrUKKwQ',

  },
  {
    'letter': 'م',
    'name' : 'ميم',
    'video' : 'https://youtu.be/dtC7i-qBccI',

  },
  {
    'letter': 'ن',
    'name' : 'نون',
    'video' : 'https://youtu.be/J8R_RWnUf2E',

  },
  {
    'letter': 'ه',
    'name' : 'هاء',
    'video' : 'https://youtu.be/0x3OTCpJ4ys',

  },
  {
    'letter': 'و',
    'name' : 'واو',
    'video' : 'https://youtu.be/o6__TLsUvxA',

  },
  {
    'letter': 'ي',
    'name' : 'ياء',
    'video' : 'https://youtu.be/kLiXXdpGwqk',

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

class lettervideo extends StatefulWidget {
  late String letter;
  lettervideo({
   required this.letter,
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
      _controller = YoutubePlayerController(

        params: const YoutubePlayerParams(
          showControls: true,
          mute: false,
          showFullscreenButton: true,
          loop: false,
        ),
      )..onInit = (){
        _controller.loadVideo("letters[Lindex]['video']");
      };
  }
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
                  const SizedBox(height: 10,),
                  Container(
                    color: Colors.transparent,
                    width: 640,
                    height: 360,
                    child: Center(
                      child: YoutubePlayerScaffold( controller: _controller,  aspectRatio: 4 / 3,
                          builder: (BuildContext context, Widget player) {
                        return Scaffold(
                          body: player,
                        );
                      },

                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return  lettertest(letter: letters[Lindex]['letter']!,);
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


