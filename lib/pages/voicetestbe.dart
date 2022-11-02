import 'dart:html';
import 'dart:math';
import 'package:flutter_application_1/pages/audio.dart';
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
bool isClicked = false;

class betest extends StatefulWidget {
   betest({Key? key}) : super(key: key);

  @override

  State<betest> createState() => _betestState();
}

class _betestState extends State<betest> {

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
            const SelectionButton(),
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
                             const SizedBox(height: 20,),
                             const Text("استمع الى الصوت واختر الصورة المناسبة",  style: TextStyle(
                                 color: Colors.green,
                                 fontSize: 25,
                                 fontFamily: "DroidKufi",
                                 fontWeight: FontWeight.w700)),
                             const SizedBox(height: 35,),
                              audio(path: 'audio/avoc.mp3'),
                             const SizedBox(height: 35,),
                              Row(
                                children: [
                                  const SizedBox(width: 15,),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: isClicked? Colors.red : Colors.black87, width: 3.5),
                                        borderRadius: BorderRadius.circular(30)

                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isClicked = true;
                                        });
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.asset(
                                          'img/avocado.png',
                                          width: MediaQuery.of(context).size.width / 7,
                                          fit: BoxFit.fill,
                                        ),
                                      ),

                                    ),

                                  ),
                                  const SizedBox(width: 15,),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: isClicked? Colors.green : Colors.black87, width: 3.5),
                                        borderRadius: BorderRadius.circular(30)

                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isClicked = false;
                                        });
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.asset(
                                          'img/avocado.png',
                                          width: MediaQuery.of(context).size.width / 7,
                                          fit: BoxFit.fill,
                                        ),
                                      ),

                                    ),

                                  ),
                                  const SizedBox(width: 15,),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:isClicked? Colors.red : Colors.black87 , width: 3.5),
                                        borderRadius: BorderRadius.circular(30)

                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isClicked = true;
                                        });
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.asset(
                                          'img/avocado.png',
                                          width: MediaQuery.of(context).size.width / 7,
                                          fit: BoxFit.fill,
                                        ),
                                      ),

                                    ),

                                  ),

                                ],
                              ),
                              const SizedBox(height: 35,),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _loading = !_loading;
                                    _updateProgress();
                                  });
                                  // Navigator.of(context)
                                  //     .push(MaterialPageRoute(builder: (context) {
                                  //   return const betest();
                                  //
                                  // }));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                                  elevation: 2.0,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 5),
                                ),
                                child: const Text("التالي",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "DroidKufi",
                                      fontSize: 18.0,
                                    )),
                              ),
                            ],
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

  void downloadData() {
    Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
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
