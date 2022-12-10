import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/latter.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/speaktest.dart';
import 'mainpage.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;
class latterexp extends StatefulWidget {
  const latterexp({Key? key}) : super(key: key);

  @override
  State<latterexp> createState() => _latterexpState();
}

class _latterexpState extends State<latterexp> {
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
                         Center(
                            child: FadeInDownBig(
                              child: Text("تدريب نطق الحروف",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 30,
                                      fontFamily: "DroidKufi",
                                      fontWeight: FontWeight.w700)),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeIn(
                          child: const SizedBox(
                            width: 500,
                            child:  Text(" تحتوي هذه الواجهة على الحروف العربية مقسمة الى 9 مجموعات على حسب المخرج الخاص بالحرف يقوم الطفل بإختيار مجموعة معينة للبدأ بها ثم يقوم بإختيار الحرف المراد التدرب عليه وبعد ذلك يظهر فيديو يوضح كيفية نطق الحرف و مخرج الحرف ثم ينتقل الطفل الى التدريب والمطلوب منه الضغط على زر التسجيل ثم نطق الكلمة الظاهرة وثم يقوم النظام بعرض ما اذا قام الطفل بنطق الكلمة بشكل صحيح ام لا  ", textDirection: TextDirection.rtl,
                                style: TextStyle(fontFamily: "DroidKufi", height: 3, fontSize: 15)),
                          ),
                        ),
                        Spacer(),


                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: FadeInUp(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return const letterex();
                                }));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                elevation: 2.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 35, vertical: 10),
                              ),
                              child: const Text("هيا لنبدأ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "DroidKufi",
                                    fontSize: 17.0,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(alignment: Alignment.bottomLeft, children: [
                      FadeInLeft(
                        child: Image.asset("img/girl-explain.png",
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
      ),
    );
  }
}
