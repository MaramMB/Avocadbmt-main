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
String l="";
String b="";
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
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    " بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    " نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",

    "بداية",
    "وسط",
    "نهاية",
  ];
  var later = [
    "أ",
    "أ",
    "أ",

    "ب",
    "ب",
    "ب",

    "ت",
    "ت",
    "ت",

    "ث",
    "ث",
    "ث",

    "ج",
    "ج",
    "ج",

    "ح",
    "ح",
    "ح",

    "خ",
    "خ",
    "خ",

    "د",
    "د",
    "د",

    "ذ",
    "ذ",
    "ذ",

    "ر",
    "ر",
    "ر",

    "ز",
    "ز",
    "ز",

    "س",
    "س",
    "س",

    "ش",
    "ش",
    "ش",

    "ص",
    "ص",
    "ص",

    "ض",
    "ض",
    "ض",

    "ط",
    "ط",
    "ط",

    "ظ",
    "ظ",
    "ظ",

    "ع",
    "ع",
    "ع",

    "غ",
    "غ",
    "غ",

    "ف",
    "ف",
    "ف",

    "ق",
    "ق",
    "ق",

    "ك",
    "ك",
    "ك",

    "ل",
    "ل",
    "ل",

    "م",
    "م",
    "م",

    "ن",
    "ن",
    "ن",

    "ه",
    "ه",
    "ه",

    "و",
    "و",
    "و",

    "ي",
    "ي",
    "ي",
  ];
  var names = [
    "أسد",
    "كأس ",
    "ببغاء",

    "بقرة",
    "جبنة",
    "أرنب",

    "تين",
    "هاتف",
    "زيت",

    " ثعلب",
    "وثب",
    "مثلث",

    "جرس",
    "نجوم",
    "سياج",

    "حليب",
    "بحر",
    "مصباح",

    "خلاط",
    "فخار",
    "بطيخ",

    "دجاج",
    "هدية",
    "هدهد",

    "ذرة",
    "اذن",
    "قنفذ",

    "ريشة",
    "دورا",
    " أطار",

    "زهور",
    "حلزون",
    "خبز",

    "سجادة",
    "استحمام",
    "اناناس",

    "شوكة",
    "خشب",
    "فراشة",

    "صقر",
    "بصل",
    " مقص",

    "ضفدع",
    "مضرب",
    "بيض",

    "طائرة",
    "شطيرة",
    "حائط",

    "ظرف",
    "عظم",
    "استيقاظ",

    "عسل",
    "قبعة",
    "مذياع",

    "غراب",
    "كنغر",
    "صمغ",

    "فأر",
    "مفتاح",
    "صوف",

    "قهوة",
    "طقس",
    "صندوق",

    "كرسي",
    "كيكة",
    "شباك",

    "لحمة",
    "رسالة",
    "عجل",

    "موز",
    "شمس",
    "قلم",

    "نار",
    "منزل",
    "الوان",

    "هرم",
    "ذهب",
    "حقيبه",

    "ورقة",
    "افوكادو",
    "بيانو",

    "يد",
    "خيار",
    "جيري",
  ];
  var images = [
    "leon.png",
    "leb.png",
    "parrot.jpg",

    "ca.png",
    "cheese.jpg",
    "rabbit.png",

    "Figs.jpg",
    "ipho.png",
    "oil.jpg",

    "fox.png",
    "jump.png",
    "tr.png",

    "bell.jpg",
    "starr.png",
    "so.png",

    "milk.png",
    "sea.png",
    "ll.png",

    "mixer.png",
    "salsal.png",
    "waterm.png",

    "dag.png",
    "gift.jpg",
    "hoopoe.jpg",

    "corn.jpg",
    "ear.png",
    "q.png",

    "fea.png",
    "dora.png",
    "frame.jpg",

    "flo.png",
    "snail.png",
    "bread.png",

    "carbet.png",
    "tub.jpg",
    "ananas-removebg-preview.png",

    "aaa.png",
    "wood.jpg",
    "B.png",

    "bi.png",
    "onion.png",
    "se.png",

    "frog.jpg",
    "pad.png",
    "eggs.png",

    "airplane.png",
    "sa.png",
    "wall.png",

    "envelope.png",
    "bone.png",
    "t.png",

    "honey.jpg",
    "hat.jpg",
    "radio.jpg",

    "cr.png",
    "kng.png",
    "Glue.png",

    "mouse.png",
    "key.jpg",
    "k.png",

    "co.png",
    "climate.jpg",
    "treas.png",

    "chair.jpg",
    "cake.jpg",
    "wind.png",

    "meat.jpg",
    "envelope.png",
    "tir.png",

    "ba.png",
    "shamos.png",
    "pencil.jpg",

    "fire.png",
    "home.jpeg",
    "colors.jpeg",

    "hr.png",
    "gold.png",
    "bag.png",

    "paper.jpg",
    "maram.png",
    "pia.png",

    "hand.jpg",
    "Cucumber.png",
    "jery.png",
  ];
  var errors = [];
  var laterrors = [];
  var truee = [];
  var placeerror = [];
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
                                                          _loading = !_loading;
                                                          index++;
                                                          l="";
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
                                                        setState(() {
                                                          active = false;
                                                        });
                                                        myDiealog();
                                                      } else {
                                                        setState(() {
                                                          _value=1;
                                                          laterrors.add(later[index]);
                                                          placeerror.add(place[index]);
                                                          l+=later[index];
                                                          b+=place[index];

                                                          if(l==later[index]+later[index]+later[index])
                                                          {
                                                            errors.add(" حرف ال "+later[index]);
                                                            adderror();
                                                            print(l);
                                                           l="";
                                                          }
                                                          // if(b=="بدايةبدايةبدايةبدايةبدايةبدايةبداية")
                                                          // {
                                                          //   errors.add(" ال "+place[0]);
                                                          //  b="";
                                                          // }
                                                          if(index!=0){
                                                          if(l.length==3){
                                                            print(l);
                                                            l="";
                                                          }}
                                                            print(l);
                                                          _loading = !_loading;
                                                          index++;
                                                          _updateProgress();
                                                        });
                                                      }
                                                    },
                                                    iconSize: 82,
                                                    icon: Image.asset("img/bcross.png")),
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
      Fluttertoast.showToast(msg: "تم اضافه بنجاح", timeInSecForIosWeb: 1);
      }
      adderror() async {
    var url = 'http://localhost/adderror.php';
    final response = await http.post(Uri.parse(url), body: {
      'stuid': (widget.person.id).toString(),
      'id': index/3,
      'let': laterrors.toString(),
      'problem' :'1',
    });
      Fluttertoast.showToast(msg: "تم اضافه", timeInSecForIosWeb: 1);
      }
    }


