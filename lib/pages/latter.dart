import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/expl.dart';
import 'package:flutter_application_1/pages/faceexpl.dart';
import 'package:flutter_application_1/pages/laterss.dart';
import 'package:flutter_application_1/pages/latterexpl.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/speaktest.dart';
import 'package:flutter_application_1/pages/voiceexpl.dart';

import 'manag.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;
class letterex extends StatefulWidget {
  const letterex({Key? key}) : super(key: key);

  @override
  State<letterex> createState() => _letterexState();
}

class _letterexState extends State<letterex> {
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
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,

                              children: [
                                GestureDetector(

                                  onTap: () {

                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child:Image.network("https://th.bing.com/th/id/OIP.xl0CqdLfPXO6-WVm2UtX9AHaFi?pid=ImgDet&w=200&h=149&c=7&dpr=1%D9%AB5",
                                        width: MediaQuery.of(context).size.width / 10.5,
                                        height: MediaQuery.of(context).size.height / 5.5,
                                    fit: BoxFit.fill,
                                    )
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 10.5,
                                  height: MediaQuery.of(context).size.height /5.5,
                                  decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                    color: const Color(0x2FE7E4E4),
                                  ),
                                ),
                                const Text("ج , ش , ض ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "DroidKufi",
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                            const Text("الحروف الشجرية",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "DroidKufi",
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                        Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,

                              children: [
                                GestureDetector(

                                  onTap: () {

                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child:Image.network("https://th.bing.com/th/id/OIP.xl0CqdLfPXO6-WVm2UtX9AHaFi?pid=ImgDet&w=200&h=149&c=7&dpr=1%D9%AB5",
                                      width: MediaQuery.of(context).size.width / 10.5,
                                      height: MediaQuery.of(context).size.height /5.5,
                                    fit: BoxFit.fill,
                                    )
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 10.5,
                                  height: MediaQuery.of(context).size.height /5.5,
                                  decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                    color: const Color(0x22E7E4E4),
                                  ),
                                ),
                                const Text("ق , ك ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "DroidKufi",
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                            const Text("الحروف اللهوية",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "DroidKufi",
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return const letterss();
                                }));
                              },
                              child: Stack(
                                alignment: Alignment.center,

                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child:Image.network("https://th.bing.com/th/id/OIP.xl0CqdLfPXO6-WVm2UtX9AHaFi?pid=ImgDet&w=200&h=149&c=7&dpr=1%D9%AB5",
                                      width: MediaQuery.of(context).size.width / 10.5,
                                      height: MediaQuery.of(context).size.height /5.5,
                                    fit: BoxFit.fill,
                                    )
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width / 10.5,
                                    height: MediaQuery.of(context).size.height /5.5,
                                    decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                      color: const Color(0x22E7E4E4),
                                    ),
                                  ),
                                  const Text("ع , غ , ح , خ ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: "DroidKufi",
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                            ),
                            const Text("الحروف الحلقية",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "DroidKufi",
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ],
                    ),
                            SizedBox(height: 17,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,

                              children: [
                                GestureDetector(

                                  onTap: () {

                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child:Image.network("https://th.bing.com/th/id/OIP.xl0CqdLfPXO6-WVm2UtX9AHaFi?pid=ImgDet&w=200&h=149&c=7&dpr=1%D9%AB5",
                                        width: MediaQuery.of(context).size.width / 10.5,
                                        height: MediaQuery.of(context).size.height / 5.5,
                                    fit: BoxFit.fill,
                                    )
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 10.5,
                                  height: MediaQuery.of(context).size.height /5.5,
                                  decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                    color: const Color(0x2FE7E4E4),
                                  ),
                                ),
                                const Text("ظ , ذ ,ث",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "DroidKufi",
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                            const Text("الحروف اللثوية",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "DroidKufi",
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                        Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,

                              children: [
                                GestureDetector(

                                  onTap: () {

                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child:Image.network("https://th.bing.com/th/id/OIP.xl0CqdLfPXO6-WVm2UtX9AHaFi?pid=ImgDet&w=200&h=149&c=7&dpr=1%D9%AB5",
                                      width: MediaQuery.of(context).size.width / 10.5,
                                      height: MediaQuery.of(context).size.height /5.5,
                                    fit: BoxFit.fill,
                                    )
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 10.5,
                                  height: MediaQuery.of(context).size.height /5.5,
                                  decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                    color: const Color(0x22E7E4E4),
                                  ),
                                ),
                                const Text("ط , ت , د",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "DroidKufi",
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                            const Text("الحروف النطعية",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "DroidKufi",
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                        Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,

                              children: [
                                GestureDetector(

                                  onTap: () {

                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child:Image.network("https://th.bing.com/th/id/OIP.xl0CqdLfPXO6-WVm2UtX9AHaFi?pid=ImgDet&w=200&h=149&c=7&dpr=1%D9%AB5",
                                      width: MediaQuery.of(context).size.width / 10.5,
                                      height: MediaQuery.of(context).size.height /5.5,
                                    fit: BoxFit.fill,
                                    )
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 10.5,
                                  height: MediaQuery.of(context).size.height /5.5,
                                  decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                    color: const Color(0x22E7E4E4),
                                  ),
                                ),
                                const Text("ز , س , ص",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "DroidKufi",
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                            const Text("الحروف الأسلية",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "DroidKufi",
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 17,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,

                              children: [
                                GestureDetector(

                                  onTap: () {

                                  },
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child:Image.network("https://th.bing.com/th/id/OIP.xl0CqdLfPXO6-WVm2UtX9AHaFi?pid=ImgDet&w=200&h=149&c=7&dpr=1%D9%AB5",
                                        width: MediaQuery.of(context).size.width / 10.5,
                                        height: MediaQuery.of(context).size.height / 5.5,
                                        fit: BoxFit.fill,
                                      )
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 10.5,
                                  height: MediaQuery.of(context).size.height /5.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0x2FE7E4E4),
                                  ),
                                ),
                                const Text("ا , و , ي , ء",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "DroidKufi",
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                            const Text("الحروف الهوائية",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "DroidKufi",
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                        Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,

                              children: [
                                GestureDetector(

                                  onTap: () {

                                  },
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child:Image.network("https://th.bing.com/th/id/OIP.xl0CqdLfPXO6-WVm2UtX9AHaFi?pid=ImgDet&w=200&h=149&c=7&dpr=1%D9%AB5",
                                        width: MediaQuery.of(context).size.width / 10.5,
                                        height: MediaQuery.of(context).size.height /5.5,
                                        fit: BoxFit.fill,
                                      )
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 10.5,
                                  height: MediaQuery.of(context).size.height /5.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0x22E7E4E4),
                                  ),
                                ),
                                const Text("ف , ب , م ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "DroidKufi",
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                            const Text("الحروف الشفوية",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "DroidKufi",
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                        Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,

                              children: [
                                GestureDetector(

                                  onTap: () {

                                  },
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child:Image.network("https://th.bing.com/th/id/OIP.xl0CqdLfPXO6-WVm2UtX9AHaFi?pid=ImgDet&w=200&h=149&c=7&dpr=1%D9%AB5",
                                        width: MediaQuery.of(context).size.width / 10.5,
                                        height: MediaQuery.of(context).size.height /5.5,
                                        fit: BoxFit.fill,
                                      )
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 10.5,
                                  height: MediaQuery.of(context).size.height /5.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0x22E7E4E4),
                                  ),
                                ),
                                const Text("ر , ل , ن",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "DroidKufi",
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                            const Text("الحروف الذلقية",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "DroidKufi",
                                    fontWeight: FontWeight.w700)),
                          ],
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
