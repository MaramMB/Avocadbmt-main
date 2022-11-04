import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/expl.dart';
import 'package:flutter_application_1/pages/faceexpl.dart';
import 'package:flutter_application_1/pages/laterss.dart';
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
class lettertest extends StatefulWidget {

  const lettertest({Key? key}) : super(key: key);

  @override
  State<lettertest> createState() => _lettertestState();
}

class _lettertestState extends State<lettertest> {
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

                  Stack(
                    alignment: Alignment.center,
                      children: [

                    Container(

                      height: MediaQuery.of(context).size.height / 2.5,
                      width: MediaQuery.of(context).size.width / 3.5,
                      decoration:  BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.green, width: 5),
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                        Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top:10.0),
                                  child: Image.network("https://th.bing.com/th/id/R.310204dc2867aa2a13bd6d856f68daed?rik=D4yjXlSYLZky4g&pid=ImgRaw&r=0",
                                      height: MediaQuery.of(context).size.height / 4,
                                      alignment: Alignment.center
                                  ),
                                ),
                                RichText(
                                  text: const TextSpan(
                                    text: "عـ",
                                    style: TextStyle(
                                    fontFamily: "ArbFONTS",
                                    color: Colors.red,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 45,
                                  ),
                                    children: <TextSpan>[
                                      TextSpan(text: 'سل',
                                        style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "ArbFONTS",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 45,
                                      )),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                  ]),
                  const SizedBox(height: 20,),
                  Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 14,
                    decoration:  BoxDecoration(
                      color: Colors.redAccent,
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                    ),
                    child: IconButton(onPressed:() {

                    }, icon: Icon(Icons.mic_none,color: Colors.white,size: 60,)),
                  ),
                  const SizedBox(height: 20,),
                  const Text("فيديو يوضح طريقة نطق الحرف",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: "DroidKufi",
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: () {
                     /* Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const letterss();
                      }));*/
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


