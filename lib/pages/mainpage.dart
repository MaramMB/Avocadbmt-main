import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/expl.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/testlogin.dart';
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
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
      });
    });
    getUserData();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
      });
    });
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
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FadeIn(
                          child: const Text("اختبار النطق الأولي",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontFamily: "DroidKufi",
                                  fontWeight: FontWeight.w700)),
                        ),
                        FadeIn(
                          duration: Duration(milliseconds: 800),
                          child: const Text(
                              "هو اختبار يقوم المعلم بعمله للطالب ليستطيع معرفة مدى النطق السليم لدى الطفل  ومعرفة\nنقاط الضعف لديه حيث يتم عرض عدد من الكلمات ويجب على الطفل نطقها بالشكل الصحيح.",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontFamily: "DroidKufi",)

                            ,),
                        ),

                        FadeIn(
                          child: const Text("تدريب نطق الحروف",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontFamily: "DroidKufi",
                                  fontWeight: FontWeight.w700)),
                        ),
                        FadeIn(
                          duration: Duration(milliseconds: 800),
                          child: const Text(
                              textDirection: TextDirection.rtl,
                              "في هذا التدريب يقوم الطفل بنطق كلمة معينة لكل حرف ويقوم النظام بمعرفة ما اذا نطق\nبشكل سليم أم لا ثم يقوم بتخزين نتيجة نطق الحروف على حسب مخرجها.",
                              style: TextStyle(fontFamily: "DroidKufi")),
                        ),

                         FadeIn(
                          child: const Text("التدريبات الصوتية",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontFamily: "DroidKufi",
                                  fontWeight: FontWeight.w700)),
                        ),
                        FadeIn(
                          duration: Duration(milliseconds: 800),
                          child: const Text(
                              textDirection: TextDirection.rtl,
                              "يتعرف الطفل على العديد من الاصوات مقسمة الى قسمين الاصوات البيئية\nوالاصوات الاستيعابية ثم يقوم المعلم أو ولي الامر بعمل اختبار للطفل ",
                              style: TextStyle(fontFamily: "DroidKufi")),
                        ),
                        FadeIn(
                          child: const Text("تدريبات الوجه",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontFamily: "DroidKufi",
                                  fontWeight: FontWeight.w700)),
                        ),
                        FadeIn(
                          duration: Duration(milliseconds: 800),
                          child: const Text(
                              textDirection: TextDirection.rtl,
                              "وهي تدريبات لتحسين حركة الفم والوجه والتي بدورها تساعد على نطق الحروف\nتكون هذه التدريبات على شكل مجموعة من الفيديوهات يقوم الطفل بتقليدها",
                              style: TextStyle(fontFamily: "DroidKufi")),
                        ),
                        FadeIn(
                          child: const Text("التدريبات الصوتية",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontFamily: "DroidKufi",
                                  fontWeight: FontWeight.w700)),
                        ),
                        FadeIn(
                          duration: Duration(milliseconds: 800),
                          child: const Text(
                              textDirection: TextDirection.rtl,
                              "يتعرف الطفل على العديد من الاصوات مقسمة الى قسمين الاصوات البيئية\n والاصوات الاستيعابية ثم يقوم المعلم أو ولي الامر بعمل اختبار للطفل ",
                              style: TextStyle(fontFamily: "DroidKufi")),
                        ),
                        const SizedBox(
                          height: 10,
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
                                      horizontal: 20, vertical: 8),
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
                  ),
                  Stack(alignment: Alignment.bottomLeft, children: [
                    FadeInLeft(
                      duration: Duration(milliseconds: 800),
                      child: Image.asset("img/boywavecut.png",
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
