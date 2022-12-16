import 'dart:convert';
import 'dart:html';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/mobile/homemob.dart';
import 'package:flutter_application_1/scroll.dart';


const backgreen = Color.fromRGBO(131, 190, 99, 1);
const blak = Color.fromRGBO(55, 53, 53, 1);

class joinmob extends StatefulWidget {
  const joinmob({Key? key}) : super(key: key);

  @override
  State<joinmob> createState() => _joinmobState();
}


class _joinmobState extends State<joinmob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Spacer(flex: 2,),
              SizedBox(width: 40,),
              Text(
                "انضم لنا",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "DroidKufi",
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),

              Spacer(),
              GestureDetector(
                  onTap: (){
                    Navigator.push (
                      context,
                      MaterialPageRoute (
                        builder: (BuildContext context) =>  scrollmobile(),
                      ),
                    );
                  },
                  child: Icon(Icons.arrow_forward_ios_rounded, size: 40, color: Colors.white,)),
              Spacer(),
            ],
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.3,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              // child: Stack(
              //
              // ),
              child: Padding(
                padding:  EdgeInsets.all(20.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      child: ListView(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          FadeIn(
                            child: Center(
                              child: Text("أهلاً وسهلاً بك",
                                  style: TextStyle(
                                      color: blak,
                                      fontSize: 28,
                                      fontFamily: "DroidKufi",
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                          SizedBox(height: 10,),
                          FadeIn(
                            duration: Duration(milliseconds: 800),
                            child: const Text(
                              "منصة نبرة هي منصة تعليمية تأهيلية تعمل على تحويل عملية تأسيس الاطفال الصم والذين يعانون\n من مشاكل في النطق الى عملية الكترونية ترفيهية لتساند العملية التعليمية وتسهيلها عليهم. ",
                              textDirection: TextDirection.rtl,

                              style: TextStyle(fontFamily: "DroidKufi",)

                              ,),
                          ),

                          FadeIn(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: const Text("لماذا نبرة ؟",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                      fontFamily: "DroidKufi",
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                          FadeIn(
                            duration: Duration(milliseconds: 800),
                            child: const Text(
                                textDirection: TextDirection.rtl,
                                "لأن منصة نبرة هي المنصة الوحيدة في فلسطين التي \nتهتم بفئة الصم والاطفال الذين يواجهون مشاكل \nعديدة في نطق الاحرف والكلمات وكما أن هنالك\n العديد من التدريبات التي تنمي المهارات السمعية و\nاللفظية وكذلك اختبارات لمعرفة مستوى الطفل وتقدمه. ",
                                style: TextStyle(fontFamily: "DroidKufi")),
                          ),

                          FadeIn(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: const Text("كيف يمكنني الانضمام ؟",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                      fontFamily: "DroidKufi",
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                          FadeIn(
                            duration: Duration(milliseconds: 800),
                            child: const Text(
                                textDirection: TextDirection.rtl,
                                "منصة نبرة موجهة تحديداً الى المراكز والجمعيات أو \nالمؤسسات التعليمية لمساندة الكوادر التأهيلية ،\n فإذا كنت مديراً لمؤسسة معينة وترغب بالانضمام \nإضغط على زر تعبئة طلب الإنضمام وثم سيتم نقلك\n الى صفحة جديدة تقوم بتعبئة معلومات التواصل\nالخاصة بك في الخانات المطلوبة ثم سيقوم فريقنا\n بالتواصل معك و إعلامك بتفاصيل الاشتراك والمعلومات \nالتي تحتاجها. ",
                                style: TextStyle(fontFamily: "DroidKufi")),
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          Spacer(),
                          Center(
                            child: FadeInUp(
                              child: ElevatedButton(
                                onPressed: () {
                                  window.open('https://forms.gle/ko676roEYEQfFXek6', '');
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
                                child: const Text("تعبئة طلب الانضمام",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "DroidKufi",
                                      fontSize: 17.0,
                                    )),
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Stack(alignment: Alignment.bottomLeft, children: [
                      FadeInLeft(
                        duration: Duration(milliseconds: 800),
                        child: Image.asset("img/boywavecut.png",
                            alignment: Alignment.bottomLeft,
                            height: MediaQuery.of(context).size.height / 2.5),
                      )
                    ]),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}