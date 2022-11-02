import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/expl.dart';
import 'package:flutter_application_1/pages/faceexpl.dart';
import 'package:flutter_application_1/pages/latervideo.dart';
import 'package:flutter_application_1/pages/latterexpl.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/speaktest.dart';
import 'package:flutter_application_1/pages/voiceexpl.dart';

import 'manag.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;
class letterss extends StatefulWidget {
  const letterss({Key? key}) : super(key: key);

  @override
  State<letterss> createState() => _letterssState();
}

class _letterssState extends State<letterss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: Container(
        child: Column(
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
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children:  [
                    SizedBox(height: 20,),
                    const Text("الحروف الحلقية",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: "DroidKufi",
                            fontWeight: FontWeight.w700)),
                    SizedBox(height: 5,),
                    const Text("اختر الحرف الذي تريد التدرب عليه ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: "DroidKufi",
                            fontWeight: FontWeight.w700)),
                    SizedBox(height: 60,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const lettervideo();
                            }));
                          },
                          child: Container(
                            // width: MediaQuery.of(context).size.width / 10,
                            // height: MediaQuery.of(context).size.height /5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:  const Color(0xFF357AB0),
                            ),
                            child: const Padding(
                              padding:EdgeInsets.only(bottom: 10,left: 55,right: 55) ,
                              child: Text("خ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 90,
                                      fontFamily: "ArbFONTS",
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const lettervideo();
                            }));
                          },
                          child: Container(
                            // width: MediaQuery.of(context).size.width / 10,
                            // height: MediaQuery.of(context).size.height /5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:  const Color(0xFF357AB0),
                            ),
                            child: const Padding(
                              padding:EdgeInsets.only(bottom: 10,left: 55,right: 55) ,
                              child: Text("ح",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 90,
                                      fontFamily: "ArbFONTS",
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const lettervideo();
                            }));
                          },
                          child: Container(
                            // width: MediaQuery.of(context).size.width / 10,
                            // height: MediaQuery.of(context).size.height /5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            color:  const Color(0xFF357AB0),
                            ),
                            child: const Padding(
                              padding:EdgeInsets.only(bottom: 10,left: 55,right: 55) ,
                              child: Text("غ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 90,
                                      fontFamily: "ArbFONTS",
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const lettervideo();
                            }));
                          },
                          child: Container(
                            // width: MediaQuery.of(context).size.width / 10,
                            // height: MediaQuery.of(context).size.height /5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            color:  const Color(0xFF357AB0),
                            ),
                            child: const Padding(
                              padding:EdgeInsets.only(bottom: 10,left: 55,right: 55) ,
                              child: Text("ع",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 90,
                                      fontFamily: "ArbFONTS",
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
