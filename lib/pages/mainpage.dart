import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/expl.dart';
import 'package:flutter_application_1/pages/faceexpl.dart';
import 'package:flutter_application_1/pages/latterexpl.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/speaktest.dart';
import 'package:flutter_application_1/pages/voiceexpl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;
class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  String? userKind;
  String userId = '';
 // bool show=false;
  bool showbtn  (){
    if (userKind == 'student'){
      return false;
    }
    else
    {
      return true;
    }
  }
  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userKind = prefs.getString('userKind') ?? '';
      userId = prefs.getString('userId') ?? '';
    });
  }
  void initState() {
    super.initState();
    getUserData();
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
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            // child: Stack(
            //
            // ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FadeIn(
                        child: const Text("قائمة التدريبات",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 25,
                                fontFamily: "DroidKufi",
                                fontWeight: FontWeight.w700)),
                      ),
                      FadeIn(
                        duration: Duration(milliseconds: 800),
                        child: const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                      ),
                      FadeIn(
                        duration: Duration(milliseconds: 800),

                        child: const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                      ),
                      FadeIn(
                        duration: Duration(milliseconds: 800),

                        child: const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                      ),
                      FadeIn(
                        child: const Text("قائمة التدريبات",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 25,
                                fontFamily: "DroidKufi",
                                fontWeight: FontWeight.w700)),
                      ),
                      FadeIn(
                        duration: Duration(milliseconds: 800),
                        child: const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                      ),
                      FadeIn(
                        duration: Duration(milliseconds: 800),

                        child: const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                      ),
                      FadeIn(
                        duration: Duration(milliseconds: 800),

                        child: const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                      ), FadeIn(
                        child: const Text("قائمة التدريبات",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 25,
                                fontFamily: "DroidKufi",
                                fontWeight: FontWeight.w700)),
                      ),
                      FadeIn(
                        duration: Duration(milliseconds: 800),
                        child: const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                      ),
                      FadeIn(
                        duration: Duration(milliseconds: 800),

                        child: const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                      ),
                      FadeIn(
                        duration: Duration(milliseconds: 800),

                        child: const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Visibility(
                        visible: showbtn(),
                        child: Center(
                          child: SlideInUp(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return  expage(exid: "1",);
                                }));
                              },
                              style: ElevatedButton.styleFrom(
                                alignment: Alignment.bottomCenter,
                                backgroundColor: Colors.green,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                elevation: 2.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 12),
                              ),
                              child: const Text("بدأ الاختبار الاولي للنطق",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "DroidKufi",
                                    fontSize: 16.0,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(alignment: Alignment.bottomLeft, children: [
                    FadeInLeft(
                      duration: Duration(milliseconds: 800),
                      child: Image.asset("img/boytalk.png",
                          alignment: Alignment.bottomLeft,
                          height: MediaQuery.of(context).size.height / 1.9),
                    )
                  ]),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  getResult(String id , String tid) async {
    var url = 'http://localhost/getResult.php';
    var response = await http.post(Uri.parse(url), body: {
      'sid':userId,
      'exid':'1',
    });
    var res = jsonDecode(response.body);
  }
}
