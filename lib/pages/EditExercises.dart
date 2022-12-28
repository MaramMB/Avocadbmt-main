import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Account_Managment/Add_Account/add_society.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/testlogin.dart';
import 'package:flutter_application_1/scroll.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
bool Bclick = true;
bool Bclick2 = false;
bool Bclick3 = false;
bool Bclick4 = false;
bool eclick=true;
var images = [
  "leon.png",
  "leb.png",

  "ca.png",
  "Desk.jpg",

  "Figs.jpg",
  "ipho.png",
  "oil.jpg",

  "fox.png",
  "jump.png",

  "fea.png",
  "president.png",
  "frame.jpg",

  "carbet.png",
  "tub.jpg",
  "ananas-removebg-preview.png",

  "aaa.png",
  "milk.png",
  "shamos.png",
  "sa.png",
  "cr.png",
  "co.png",
  "dag.png",
  "transportation.jpeg",
  "home.jpeg",
  "wind.png",
  "climate.jpg",
  "animals.jpeg",
  "colors.jpeg",
  "ba.png",
  "cane.jpg",
  "mixer.png",
  "chair.jpg",
  "corn.jpg",
  "envelope.png",
  "Eyeglasses.jpg",
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
  "treas.png",
  "pencil.jpg",
  "so.png",
  "onion.png",
  "rabbit.png",
  "ear.png",
  "mouse.png",
  "q.png",
  "radio.jpg",
  "salsal.png",
  "bi.png",
  "meat.jpg",
  "hat.jpg",
  "paper.jpg",
  "ll.png",
  "parrot.jpg",
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
  "key.jpg",
  "kng.png",
  "B.png",
  "se.png",
  "maram.png",
  "cake.jpg"
];
var names = [
  "أسد",
  "كأس ",

  "بقرة",
  "مكتب",

  "تين",
  "هاتف",
  "زيت",

  " ثعلب",
  "وثب",

  "ريشة",
  "رئيس",
  " أطار",

  "سجادة",
  "استحمام",
  "اناناس",

  "شوكة",
  "حليب",
  "شمس",
  "شطيرة",
  "غراب",
  "قهوة",
  "دجاج",
  "مواصلات",
  "منزل",
  "شباك",
  "الطقس",
  "حيوانات",
  "الوان",
  "موز",
  "عصا",
  "خلاط",
  "كرسي",
  "ذرة",
  "رسالة",
  "نظارة",
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
  "صندوق",
  "قلم",
  "سياج",
  "بطيخ",
  "أرنب",
  "اذن",
  "فأر",
  "قنفذ",
  "مذياع",
  "فخار",
  "صقر",
  "لحمة",
  "قبعة",
  "ورقة",
  "مصباح",
  "ببغاء",
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
  "مفتاح",
  "كنغر",
  "فراشة",
  " مقص",
  "افوكادو",
  "كيكة"
];
class Eedit extends StatefulWidget {
  const Eedit({Key? key}) : super(key: key);

  @override
  State<Eedit> createState() => _EeditState();
}

class _EeditState extends State<Eedit> {
  TextStyle unselectedAccountTypeTextStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  TextStyle selectedAccountTypeTextStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  bool search = false;
  var searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: const Locale(
          'ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales,
      home: Scaffold(
        backgroundColor: backgreen,

        body: Container(

          child: Stack(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 35,right: 15.0),
                    child: OutlinedButton(
                      style: ButtonStyle(

                        backgroundColor:
                        MaterialStateColor.resolveWith((states) => Colors.white),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.only(left: 22.0, right: 22.0,top: 10,bottom: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return  scrollhome();
                        }));
                      },
                      child: const Text(
                        "تسـجـيـل الخـروج",
                        style: TextStyle(
                            color: Colors.black, fontFamily: "DroidKufi"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 35,right: 15.0),
                    child: OutlinedButton(
                      style: ButtonStyle(

                        backgroundColor:
                        MaterialStateColor.resolveWith((states) => Colors.green),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.only(left: 22.0, right: 22.0,top: 10,bottom: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                      ),
                      onPressed: () {

                      },
                      child: const Text(
                        "تعديل التدريبات",
                        style: TextStyle(
                            color: Colors.white, fontFamily: "DroidKufi"),
                      ),
                    ),
                  ),

                ],
              ),

              Center(
                child: Column(children: [
                  // const SelectionButton(),
                  const SizedBox(
                    height: 40,
                  ),
                  buildTable(context),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTable(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: MediaQuery.of(context).size.height / 1.1,
        width: MediaQuery.of(context).size.width / 1.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child:Container(
          child: Column(
            children: [
              SizedBox(height: 15,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Bclick?Colors.green:Colors.grey),onPressed: (){
                    setState((){
                      Bclick=true;
                      Bclick2=false;
                      Bclick3=false;
                      Bclick4=false;
                    });

                  }, child: Text(
                    'الاختبار الاولي',style: TextStyle(
                      color: Colors.white, fontFamily: "DroidKufi"),
                  ),),
                  SizedBox(width: 10,),
                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Bclick2?Colors.green:Colors.grey),onPressed: (){
                    setState((){
                      Bclick=false;
                      Bclick2=true;
                      Bclick3=false;
                      Bclick4=false;
                    });
                  }, child: Text(
                    'التدريبات الصوتية',style: TextStyle(
                      color: Colors.white, fontFamily: "DroidKufi"),
                  ),),
                  SizedBox(width: 10,),
                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Bclick3?Colors.green:Colors.grey),onPressed: (){
                    setState((){
                      Bclick=false;
                      Bclick2=false;
                      Bclick3=true;
                      Bclick4=false;
                    });
                  }, child: Text(
                    'تدريب نطق الحروف',style: TextStyle(
                      color: Colors.white, fontFamily: "DroidKufi"),
                  ),),
                  SizedBox(width: 10,),
                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Bclick4?Colors.green:Colors.grey),onPressed: (){
                    setState((){
                      Bclick=false;
                      Bclick2=false;
                      Bclick3=false;
                      Bclick4=true;
                    });
                  }, child: Text(
                    'تدريبات الوجه',style: TextStyle(
                      color: Colors.white, fontFamily: "DroidKufi"),
                  ),),
                  SizedBox(width: 10,),
                ],
              ),
              SizedBox(height: 15,),
              Container(
                height: MediaQuery.of(context).size.height / 1.28,
                width: 450,
                child:Bclick ? ListView.separated(
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Row(
                        children: [
                          Container(
                            width: 100,

                            child: TextField(
                              decoration: InputDecoration(
                                labelText: names[index],
                              ),
                            ),
                          ),
                         Spacer(),
                          Row(children: [
                            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green),onPressed: (){
                              setState(() {
                                eclick=false;
                              });
                              Fluttertoast.showToast(msg: 'تم تعديل الكلمة بنجاح');

                            }, child: Icon(Icons.edit,size: 15,)),
                            SizedBox(width: 10,),
                            ElevatedButton(onPressed: (){}, child: Icon(Icons.image_outlined  ,size: 15,)),
                            SizedBox(width: 10,),
                            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),onPressed: (){

                            }, child: Icon(Icons.cancel ,size: 15,)),

                          ],),
                        ],
                      ),
                      leading: Image.asset('img/'+images[index],),
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.grey,
                        height: 1,

                      ),
                    );
                },
                ):Bclick2?Center(child: CircularProgressIndicator(),):Bclick3?Center(child: CircularProgressIndicator(),):Bclick4?Center(child: CircularProgressIndicator(),):Container(),
              ),

            ],
          ),
        )

      ),
    );
  }



}
