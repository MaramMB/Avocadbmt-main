import 'dart:convert';
import 'dart:html';
import 'package:flutter_application_1/pages/models/person.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/testlogin.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 0;
int countr = 0;
bool _loading = false;
double _progressValue = 0;

class sptest extends StatefulWidget {
  const sptest({Key? key, required this.person, required this.id}) : super(key: key);
  final Person person;
  final String id;


  @override
  State<sptest> createState() => _sptestState();
}

class _sptestState extends State<sptest> {
  String? userKind;
  String userId = '';

  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userKind = prefs.getString('userKind') ?? '';
      userId = prefs.getString('userId') ?? '';
    });
  }
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
      });
    });
    getUserData();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
      });
    });
    _loading = false;
    _progressValue = 0.0;
  }

  int index = 0;
  var place = [
    "بداية",
    "بداية",
    "بداية",
    "بداية",
    "وسط",
    "وسط",
    "بداية",
    "بداية",
    "بداية",
    "وسط",
    "بداية",
    "وسط",
    "وسط",
    "نهاية",
    "وسط",
    "بداية",
    "وسط",
    "نهاية",
    "بداية",
    "نهاية",
    "بداية",
    "بداية",
    "بداية",
    "وسط",
    "بداية",
    "بداية",
    "وسط",
    "بداية",
    "نهاية",
    "وسط",
    "وسط",
    "بداية",
    "وسط",
    "نهاية",
    "نهاية",
    "نهاية",
    "وسط",
    "وسط",
    "بداية",
    "نهاية",
    "وسط",
    "وسط",
    "نهاية",
    "نهاية",
    "نهاية",
    "نهاية",
    "نهاية",
    "نهاية",
    "نهاية",
    "وسط",
    "بداية",
    "نهاية",
    "بداية",
    "نهاية",
    "وسط",
    "بداية",
    "بداية",
    "وسط",
    "بداية",
    "نهاية",
    "نهاية",
    "نهاية",
    "بداية",
    "نهاية",
    "وسط",
    "نهاية",
    "نهاية",
    "وسط",
    "بداية",
    "بداية",
    "وسط",
    "نهاية",
    "نهاية",
    "بداية",
    "نهاية",
    "بداية",
    "وسط",
    "وسط",
    "وسط",
    "نهاية",
    " بداية",
    " نهاية",
    "افوكادو",
    "وسط"
  ];
  var later = [
    "س",
    "ب",
    "ش",
    "ح",
    "م",
    "ط",
    "غ",
    "ق",
    "د",
    "ص",
    "ر",
    "س",
    "ن",
    "ك",
    "ق",
    "ر",
    "و",
    "ن",
    "م",
    "ب",
    "ع",
    "خ",
    "أ",
    "ث",
    "ك",
    "ذ",
    "ل",
    "ب",
    "ر",
    "أ",
    "ض",
    "م",
    "ز",
    "ض",
    "ع",
    "ض",
    "ب",
    "ي",
    "ز",
    "و",
    "ج",
    "ش",
    "ل",
    "س",
    "ق",
    "م",
    "ج",
    "خ",
    "ب",
    "ذ",
    "ف",
    "ذ",
    "ت",
    "ع",
    "خ",
    "ص",
    "ل",
    "ع",
    "و",
    "ح",
    "ء",
    "ت",
    "ط",
    "ز",
    "ح",
    "د",
    "ط",
    "د",
    "ظ",
    "ض",
    "ظ",
    "غ",
    "ف",
    "ي",
    "خ",
    "ج",
    "ت",
    "ف",
    "غ",
    "ش",
    " ث",
    " ص",
    "افوكادو",
    "ك"
  ];
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
    "وثب",
    "كرسي",
    "ذرة",
    "رسالة",
    "نظارة",
    " أطار",
    "كأس ",
    "مضرب",
    "ماء",
    "مزهرية",
    "بعوض",
    "شارع",
    "بيض",
    "جبنة",
    "خيار",
    "زهور",
    "بيانو",
    "نجوم",
    "خشب",
    "عجل",
    "اناناس",
    "صندوق",
    "قلم",
    "سياج",
    "بطيخ",
    "أرنب",
    "اذن",
    "فأر",
    "قنفذ",
    "تين",
    "مذياع",
    "فخار",
    "صقر",
    "لحمة",
    "قبعة",
    "ورقة",
    "مصباح",
    "ببغاء",
    "زيت",
    "طائرة",
    "خبز",
    "تفاحة",
    "يد",
    "حائط",
    "هدية",
    "ظل",
    "ضفدع",
    "عظم",
    "صمغ",
    "صوف",
    "يد",
    "بطيخ",
    "جرس",
    "هاتف",
    "مفتاح",
    "كنغر",
    "فراشة",
    " ثعلب",
    " مقص",
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
    "mixer.png",
    "leon.png",
    "jump.png",
    "chair.jpg",
    "corn.jpg",
    "envelope.png",
    "Eyeglasses.jpg",
    "frame.jpg",
    "leb.png",
    "pad.png",
    "Water.jpg",
    "vase.png",
    "mi.png",
    "Street.png",
    "eggs.png",
    "cheese.jpg",
    "Cucumber.png",
    "flo.png",
    "pia.png",
    "starr.png",
    "wood.jpg",
    "tir.png",
    "ananas-removebg-preview.png",
    "treas.png",
    "pencil.jpg",
    "so.png",
    "onion.png",
    "rabbit.png",
    "ear.png",
    "mouse.png",
    "q.png",
    "Figs.jpg",
    "radio.jpg",
    "salsal.png",
    "bi.png",
    "meat.jpg",
    "hat.jpg",
    "paper.jpg",
    "ll.png",
    "parrot.jpg",
    "oil.jpg",
    "airplane.png",
    "bread.jpg",
    "apple.jpg",
    "hand.jpg",
    "wall.png",
    "gift.jpg",
    "thape.jpg",
    "frog.jpg",
    "bone.png",
    "Glue.png",
    "k.png",
    "Pillow.jpg",
    "waterm.png",
    "bell.jpg",
    "ipho.png",
    "key.jpg",
    "kng.png",
    "B.png",
    "fox.png",
    "se.png",
    "maram.png",
    "cake.jpg"
  ];
  var errors = [];
  var truee = [];
  bool active = true;
  void addresult() async {

      var url = 'http://localhost/firsttest.php';

      final req = await http.post(Uri.parse(url), body: {
        "studid": 2,
        "note":truee.length,
        "res": errors[index],
      });

      var response = jsonDecode(req.body);
        var data = jsonDecode(response.body);

        if (data == 'Success') {
          Fluttertoast.showToast(msg: "تم اضافه النتيجة بنجاح");
        }
      else {
        Navigator.of(context, rootNavigator: true).pop();
        print('fsdsdfs');
      }
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
                padding: const EdgeInsets.only( right: 20, left: 20),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(later[index],
                                        style: TextStyle(
                                          fontFamily: "DroidKufi",
                                          fontSize: 18,
                                          // color: Colors.green,
                                          fontWeight: FontWeight.w900,
                                        )),
                                    Text(
                                      ' : الحرف ',
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontFamily: "DroidKufi",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.green,
                                      ),

                                    ),
                                    Spacer(),
                                    Text(
                                      widget.person.name,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontFamily: "DroidKufi",
                                        fontSize: 18,
                                        // color: Colors.green,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),

                                    Text(
                                      ' : الطالب ',
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontFamily: "DroidKufi",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                LinearPercentIndicator(
                                  width: MediaQuery.of(context).size.width / 2,
                                  // backgroundColor: Colors.grey,
                                  // progressColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                                  percent: ((index as double)+1)/84,
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

                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [

                                    Stack(
                                        children: [
                                      Row(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (index == 0) {
                                                setState(() {
                                                  index=0;
                                                });
                                              } else {
                                                setState(() {
                                                  // truee.add(-1);
                                                  if(_value==1){
                                                    truee.removeLast();
                                                    errors.removeLast();
                                                    _loading =
                                                    !_loading;
                                                    index--;
                                                    _updateProgress();
                                                  }
                                                  else
                                                    {
                                                      truee.removeLast();
                                                       _loading = !_loading;
                                                       index--;
                                                       _updateProgress();
                                                    }
                                                });
                                              }
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 60,right: 50),
                                              child: Container(
                                                child: Icon(
                                                  Icons.arrow_back_sharp,
                                                  color: Colors.green,
                                                  size: 50,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Center(
                                              child: Image.asset(
                                            "img/board.png",
                                            height: MediaQuery.of(context).size.height / 1.85,
                                            width: MediaQuery.of(context).size.width / 2.85,
                                          )),
                                          InkWell(
                                            onTap: () {
                                              if (index == 83) {
                                                setState(() {
                                                  index=83;
                                                });
                                              } else {
                                                setState(() {
                                                  _loading =
                                                  !_loading;
                                                  index++;
                                                  _updateProgress();
                                                });
                                              }
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 60,left: 50),
                                              child: Container(
                                                child: Icon(
                                                  Icons.arrow_forward_sharp,
                                                  color: active == false ? Colors.green : Colors.white,
                                                  size: 50,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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
                                                          _value=0;
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
                                                        // errors.add(later[index]+" حرف ال "+place[index]+" في ");
                                                        setState(() {
                                                          active = false;
                                                        });
                                                        myDiealog();
                                                      } else {
                                                        setState(() {
                                                          _value=1;
                                                          errors.add(" حرف ال "+later[index]+" في ال"+place[index]);
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
      useSafeArea: true,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(

          scrollable: true,
          actions: <Widget>[
            Center(
              child: Column(
                children: [
                  Text(
                    "تم الانتهاء من التدريب",
                    style: TextStyle(
                      color: Colors.green,
                      fontFamily: "DroidKufi",
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,

                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "نتيجتك من 84 هي : ${truee.length}",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "DroidKufi",
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,

                      )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    ": الأخطاء هي التالي   ",
                    style: TextStyle(
                      color: Colors.red,
                      fontFamily: "DroidKufi",
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,

                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 150,
                    width: 400,
                    child: Center(
                      child: ListView.builder(
                          itemCount: errors.length,
                          shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (_, int index) {
                            return Center(
                              child: Text(
                                errors[index],
                                style: TextStyle(
                                color: Colors.black,
                                fontFamily: "DroidKufi",
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,

                              )
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () {
                        // addresult();
                        addTestResult();
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
                                color: Colors.white,
                                fontFamily: "DroidKufi",
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,

                              )
                          ),
                        ),
                      )),
                  SizedBox(height: 6,)
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
  addTestResult() async {
    var url = 'http://localhost/addTestResult.php';
    final response = await http.post(Uri.parse(url), body: {
      'stuid': (widget.person.id).toString(),
      'result': (truee.length).toString(),
      'note': errors.toString(),
      'testid' :'1',
    });
    // var data = jsonDecode(response.body);
    // print(data);
  //   if (data == 'Success') {
  //     // Navigator.of(context, rootNavigator: true).pop();
      Fluttertoast.showToast(msg: "تم اضافه بنجاح", timeInSecForIosWeb: 1);
  //   }
  //   else{ Fluttertoast.showToast(
  //           msg: "لم يتم الاضافه بنجاح", timeInSecForIosWeb: 1);
  // }
      }
    }


