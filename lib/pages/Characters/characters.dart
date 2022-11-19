import 'dart:html';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';

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

  int index = 0;
  var names = [
    "سجادة",
    "بقرة",
    "شوكة",
    "حليب",
    "شمس",
    "شطيرة",
    "غراب",
    "قهوة",
    "دجاج",
    "مواصلات",
    "رئيس",
    "استحمام",
    "منزل",
    "شباك",
    "الطقس",
    "ريشة",
    "حيوانات",
    "الوان",
    "موز",
    "مكتب",
    "عصا",
    "خلاط",
    "أسد",
    "رمان",
    "كرسي",
    "ذرة",
    "رسالة",
    "نظارة",
    " أطار",
    "كأس حليب",
    "مضرب",
    "ماء",
    "مزهرية",
    "بطاقة",
    "شارع",
    "بيض",
    "جبنة",
    "خيار",
    "زهور",
    "بيانو",
    "مزرعة",
    "خشب",
    "عجل",
    "اناناس",
    "صندوق",
    "قلم",
    "ديك",
    "بصل",
    "أرنب",
    "سفينة",
    "فأر",
    "سمك",
    "تين",
    "مذياع",
    "حلزون",
    "عسل",
    "لحمة",
    "قبعة",
    "ورقة",
    "مصباح",
    "ببغاء",
    "زيت",
    "طائرة",
    "نملة",
    "تفاحة",
    "يد",
    "بطة",
    "هدية",
    "سلم",
    "ضفدع",
    "عنب",
    "صمغ",
    "معلقة",
    "وسادة",
    "بطيخ",
    "جرس",
    "هاتف",
    "مفتاح",
    "عصفور",
    "فراشة",
    " ثعلب",
    " فستان",
    "افوكادو",
    "كيكة"
  ];
  var images = [
    "carbet.png",
    "ca.png",
    "aaa.png",
    "milk.png",
    "shamos.png",
    "sa.png",
    "cr.png",
    "co.png",
    "dag.png",
    "transportation.jpeg",
    "president.png",
    "tub.jpg",
    "home.jpeg",
    "wind.png",
    "climate.jpg",
    "fea.png",
    "animals.jpeg",
    "colors.jpeg",
    "ba.png",
    "Desk.jpg",
    "cane.jpg",
    "mixer.jpg",
    "leon.png",
    "pomegranate.jpg",
    "chair.jpg",
    "corn.jpg",
    "envelope.jpg",
    "Eyeglasses.jpg",
    "frame.jpg",
    "leb.png",
    "pad.png",
    "Water.jpg",
    "vase.jpg",
    "ticket.jpg",
    "Street.jpg",
    "eggs.jpg",
    "cheese.jpg",
    "Cucumber.png",
    "flo.png",
    "pia.png",
    "plough.jpg",
    "wood.jpg",
    "tir.png",
    "ananas-removebg-preview.png",
    "treas.png",
    "pencil.jpg",
    "rooster.jpg",
    "onion.png",
    "rabbit.png",
    "Stea.png",
    "mouse.png",
    "Fish.jpg",
    "Figs.jpg",
    "radio.jpg",
    "snail.jpg",
    "honey.jpg",
    "meat.jpg",
    "hat.jpg",
    "paper.jpg",
    "ll.png",
    "parrot.jpg",
    "oil.jpg",
    "airplane.jpg",
    "ant.jpg",
    "apple.jpg",
    "hand.jpg",
    "D.png",
    "gift.jpg",
    "ladder.jpg",
    "frog.jpg",
    "Grape.png",
    "Glue.png",
    "spoon.jpg",
    "Pillow.jpg",
    "waterm.png",
    "bell.jpg",
    "ipho.png",
    "key.jpg",
    "BRIDE.png",
    "B.png",
    "fox.png",
    "DREES.png",
    "maram.png",
    "cake.jpg"
  ];
  var errors = [];
  var truee = [];
  bool active = true;

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
                    SingleChildScrollView(
                      child: Column(
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
                                  center: Text("${index + 1}"),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Stack(children: [
                                        Center(
                                            child: Image.asset(
                                          "img/board.png",
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              1.85,
                                        )),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 85.0),
                                          child: Center(
                                              child: Column(
                                            children: [
                                              Image.asset(
                                                  "img/${images[index]}",
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      3.65,
                                                  alignment: Alignment.center),
                                              Text(names[index],
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
                                      Visibility(
                                        visible: active,
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ButtonBar(
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        if (index == 83) {
                                                          truee.add(1);
                                                          setState(() {
                                                            active = false;
                                                          });
                                                          myDiealog();
                                                        } else {
                                                          setState(() {
                                                            truee.add(1);
                                                            _loading =
                                                                !_loading;
                                                            index++;

                                                            _updateProgress();
                                                          });
                                                        }
                                                      },
                                                      iconSize: 82,
                                                      icon: Image.asset(
                                                          "img/btick.png")),
                                                  const SizedBox(
                                                    width: 130,
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        if (index == 83) {
                                                          errors.add(
                                                              names[index]);
                                                          setState(() {
                                                            active = false;
                                                          });
                                                          myDiealog();
                                                        } else {
                                                          setState(() {
                                                            errors.add(
                                                                names[index]);
                                                            _loading =
                                                                !_loading;
                                                            index++;

                                                            _updateProgress();
                                                          });
                                                        }
                                                      },
                                                      iconSize: 82,
                                                      icon: Image.asset(
                                                          "img/bcross.png")),
                                                ],
                                              ),
                                            ],
                                          ),
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

  myDiealog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          content: Center(
            child: Text(
              "تم الانتهاء من التدريب",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          actions: <Widget>[
            Center(
              child: Column(
                children: [
                  Text(
                    "نتيجتك من 84 هي : ${truee.length}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "الأخطاء هي التالي  : ",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    child: Center(
                      child: ListView.builder(
                          itemCount: errors.length,
                          shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (_, int index) {
                            return Center(
                              child: Text(
                                errors[index],
                                style: TextStyle(fontSize: 20),
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 200,
                        height: 35,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "حسنا",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void downloadData() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
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
    const oneSec = const Duration(seconds: 1);
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