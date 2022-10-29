import 'dart:html';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';

import 'mainpage.dart';
import 'manag.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;
int countr = 0;
bool _loading = false;
double _progressValue = 0;

class sptest extends StatefulWidget {
  const sptest({Key? key}) : super(key: key);

  @override
  State<sptest> createState() => _sptestState();
}

class _sptestState extends State<sptest> {
  void initState() {
    super.initState();
    _loading = false;
    _progressValue = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: Container(
        child: Column(
          children: [
            SelectionButton(),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.19,
              width: MediaQuery.of(context).size.width / 1.8,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              // child: Stack(
              //
              // ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              LinearPercentIndicator(
                                width: MediaQuery.of(context).size.width / 2,
                                // backgroundColor: Colors.grey,
                                // progressColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                                percent: _progressValue,
                                // animation: true,
                                lineHeight: 20.0,
                                // animationDuration: 2500,
                                // percent: 0.8,
                                center:
                                Text("${(_progressValue * 84).round()}"),
                                barRadius: const Radius.circular(15),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                progressColor: Colors.green,
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(children: [
                                      Center(
                                          child: Image.asset(
                                            "img/board.png",
                                            height:
                                            MediaQuery.of(context).size.height /
                                                1.85,
                                          )),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(top: 85.0),
                                        child: Center(
                                            child: Column(
                                              children: [
                                                Image.asset("img/boytalk.png",
                                                    height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                        3.65,
                                                    alignment: Alignment.center),
                                                const Text("صاروخ",
                                                    style: TextStyle(
                                                      fontFamily: "ArbFONTS",
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 45,
                                                    )),
                                                // SizedBox(height: 10,),
                                              ],
                                            )),
                                      ),
                                    ]),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          ButtonBar(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _loading = !_loading;
                                                      _updateProgress();
                                                    });
                                                  },
                                                  iconSize: 82,
                                                  icon: Image.asset(
                                                      "img/btick.png")),
                                              const SizedBox(
                                                width: 130,
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _loading = !_loading;
                                                      _updateProgress();
                                                    });
                                                  },
                                                  iconSize: 82,
                                                  icon: Image.asset(
                                                      "img/bcross.png")),
                                              // FloatingActionButton(
                                              //
                                              //   onPressed: (){},
                                              //   backgroundColor: Colors.white,
                                              //
                                              //   child: Image.asset("img/btick.png",fit:BoxFit.fill,),
                                              //
                                              //
                                              // ),
                                              // FloatingActionButton(
                                              //   onPressed: (){},
                                              //   backgroundColor: Colors.white,
                                              //   child: Image.asset("img/bcross.png",fit:BoxFit.cover,),
                                              //
                                              //
                                              // ),
                                            ],
                                          ),
                                          // IconButton(onPressed: (){}, icon:const Icon(Icons.check_circle,color: Colors.green,size: 90,)),
                                          // const SizedBox(width: 170,),
                                          // IconButton(onPressed: (){}, icon:const Icon(Icons.check_circle,color: Colors.redAccent,size: 90,)),
                                          // const SizedBox(width: 50,),
                                        ],
                                      ),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                        // const Text("الاختبار الاولي",style: TextStyle(color: Colors.green,fontSize: 25,fontFamily: "DroidKufi",fontWeight: FontWeight.w700)),
                        // const Text("تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",style: TextStyle(fontFamily: "DroidKufi")),
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

  void downloadData() {
    Timer.periodic(Duration(milliseconds: 100), (Timer timer) {
      setState(() {
        if (_progressValue == 1) {
          timer.cancel();
        } else {
          _progressValue = _progressValue + 0.0119047619;
        }
      });
    });
  }

  void _updateProgress() {
    const oneSec = const Duration(milliseconds: 100);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue += 0.0119047619;
        t.cancel();
        // we "finish" downloading here
        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          t.cancel();
          return;
        }
      });
    });
  }
}
