import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/face.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/speaktest.dart';
import 'mainpage.dart';
import 'manag.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;

class edit extends StatefulWidget {
  const edit({Key? key}) : super(key: key);

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
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
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Center(
                        child: Text("ملفك الشخصي",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 30,
                                fontFamily: "DroidKufi",
                                fontWeight: FontWeight.w700))),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.green, width: 5),
                                    borderRadius: BorderRadius.circular(30)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    'img/avocado.png',
                                    width: MediaQuery.of(context).size.width / 5.7,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.green, width: 1.5),
                                        borderRadius:
                                        BorderRadius.circular(6)),
                                    child: const Icon(
                                      Icons.alternate_email,
                                      size: 25,
                                    ),
                                  ),
                                  const Text(
                                    "  Avo@gmail.com",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.black87,
                                        fontFamily: "Merienda",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.green, width: 1.5),
                                        borderRadius:
                                        BorderRadius.circular(6)),
                                    child: const Icon(
                                      Icons.phone,
                                      size: 25,
                                    ),
                                  ),
                                  // Icon(Icons.phone,size: 25),
                                  const Text(
                                    " +972 569209948",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.black87,
                                        fontFamily: "Merienda",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.green, width: 1.5),
                                        borderRadius:
                                        BorderRadius.circular(6)),
                                    child: const Icon(
                                      Icons.person,
                                      size: 25,
                                    ),
                                  ),
                                  // Card(shape:BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(35),)),color: Colors.green, child: Icon(Icons.phone,size: 28)),
                                  // Card(shape:Border(left: Border.fromBorderSide(side)), child: Icon(Icons.phone,size: 25)),
                                  const Text(
                                    " 25/13/3133",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.black87,
                                        fontFamily: "Merienda",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                              // ,child: Image.asset("img/avocado.png",width: MediaQuery.of(context).size.width/4.8,fit:BoxFit.cover,))
                            ],
                          ),


                        ),

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Form(
                                child: Column(
                                  // mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text("احداما",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                      fontFamily: "DroidKufi",
                                      fontSize: 19.0,
                                    )),
                                    const SizedBox(height: 12,),
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: const [
                                        Text("ابو الاحداما",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                          fontFamily: "DroidKufi",
                                          fontSize: 19.0,
                                        )),
                                      ],
                                    ),
                                    const SizedBox(height: 12,),
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: const [
                                        Text("", style: TextStyle(
                                          color: Colors.green,
                                          fontFamily: "DroidKufi",
                                          fontSize: 19.0,
                                          fontWeight: FontWeight.bold,
                                        )),
                                        Text("767",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                          fontFamily: "DroidKufi",
                                          fontSize: 19.0,
                                        )),
                                      ],
                                    ),
                                    const SizedBox(height: 12,),
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: const [
                                        Text("ذكر",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                          fontFamily: "DroidKufi",
                                          fontSize: 19.0,
                                        )),
                                      ],
                                    ),
                                    const SizedBox(height: 12,),
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: const [

                                        Text(" 32 / 34 / 1321 ",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                          fontFamily: "DroidKufi",
                                          fontSize: 19.0,
                                        )),
                                      ],
                                    ),
                                    const SizedBox(height: 12,),
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: const [
                                        Text("", style: TextStyle(
                                          color: Colors.green,
                                          fontFamily: "DroidKufi",
                                          fontSize: 19.0,
                                          fontWeight: FontWeight.bold,
                                        )),
                                        Text("723984937",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                          fontFamily: "DroidKufi",
                                          fontSize: 19.0,
                                        )),
                                      ],
                                    ),
                                    const SizedBox(height: 12,),
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: const [
                                        Text("السمع",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                          fontFamily: "DroidKufi",
                                          fontSize: 19.0,
                                        )),
                                      ],
                                    ),

                                  ],
                                ),
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: const [
                                      Text(" : الاسم   ", style: TextStyle(
                                        color: Colors.green,
                                        fontFamily: "DroidKufi",
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                    ],
                                  ),
                                  const SizedBox(height: 12,),
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: const [
                                      Text(" : اسم الأب   ", style: TextStyle(
                                        color: Colors.green,
                                        fontFamily: "DroidKufi",
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                    ],
                                  ),
                                  const SizedBox(height: 12,),
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: const [
                                      Text(" : العمر   ", style: TextStyle(
                                        color: Colors.green,
                                        fontFamily: "DroidKufi",
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                    ],
                                  ),
                                  const SizedBox(height: 12,),
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: const [
                                      Text(" : الجنس   ", style: TextStyle(
                                        color: Colors.green,
                                        fontFamily: "DroidKufi",
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                    ],
                                  ),
                                  const SizedBox(height: 12,),
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: const [
                                      Text(" : تاريخ الميلاد   ", style: TextStyle(
                                        color: Colors.green,
                                        fontFamily: "DroidKufi",
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                    ],
                                  ),
                                  const SizedBox(height: 12,),
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: const [
                                      Text(" : رقم الهوية   ", style: TextStyle(
                                        color: Colors.green,
                                        fontFamily: "DroidKufi",
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                    ],
                                  ),
                                  const SizedBox(height: 12,),
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: const [
                                      Text("  : نقاط الضعف   ", style: TextStyle(
                                        color: Colors.green,
                                        fontFamily: "DroidKufi",
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.bold,
                                      )),

                                    ],
                                  ),

                                ],
                              )
                            ],
                          ),
                        ),


                      ],
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {

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
                        child: const Text("حفظ التعديل",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "DroidKufi",
                              fontSize: 18.0,
                            )),
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
}
