import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Videos/animals.dart';
import 'package:flutter_application_1/pages/Videos/clothes.dart';
import 'package:flutter_application_1/pages/Videos/colours.dart';
import 'package:flutter_application_1/pages/Videos/drinks.dart';
import 'package:flutter_application_1/pages/Videos/eat.dart';
import 'package:flutter_application_1/pages/Videos/family.dart';
import 'package:flutter_application_1/pages/Videos/job.dart';
import 'package:flutter_application_1/pages/Videos/nature.dart';
import 'package:flutter_application_1/pages/Videos/numbers.dart';
import 'package:flutter_application_1/pages/Videos/transport.dart';

import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Videos/videos.dart';
import 'Videos/videos28..dart';
import 'testlogin.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;

class dic extends StatefulWidget {
  const dic({Key? key}) : super(key: key);

  @override
  State<dic> createState() => _dicState();
}

class _dicState extends State<dic> {
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
    getUserData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: Scrollbar(
        thickness: 10,
        isAlwaysShown: true,
        radius: const Radius.circular(10),
        child: Column(
          children: [
             SelectionButton(),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.15,
              width: MediaQuery.of(context).size.width / 1.8,
              decoration: const BoxDecoration(
                // color: Color(0x6BFFFFFF),
                gradient: LinearGradient(
                  colors: [
                    Color(0x6BFFFFFF),
                    Color(0x5FC3FFC3),
                    Color(0xA65D86A6),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                     FadeIn(
                       child: Text("قاموس لغة الاشارة",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "DroidKufi",
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          )),
                     ),
                    const SizedBox(
                      height: 5,
                    ),
                    SlideInRight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Clothes(
                                        name: "الملابس",
                                      )));
                            },
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.asset(
                                          "img/clothes.jpeg",
                                          width:
                                          MediaQuery.of(context).size.width /
                                              11,
                                          height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                          fit: BoxFit.fill,
                                        )),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width / 11,
                                      height:
                                      MediaQuery.of(context).size.height / 6,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0x34E7E4E4),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  width: 120,
                                  height: 35,
                                  child: Center(
                                    child: Text("الملابس",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "DroidKufi",
                                          fontSize: 18.0,
                                        )),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Eat(
                                        name: "المأكولات",
                                      )));
                            },
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.asset(
                                          "img/eat.jpeg",
                                          width:
                                          MediaQuery.of(context).size.width /
                                              11,
                                          height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                          fit: BoxFit.fill,
                                        )),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width / 11,
                                      height:
                                      MediaQuery.of(context).size.height / 6,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0x34E7E4E4),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  width: 120,
                                  height: 35,
                                  child: Center(
                                    child: Text("المأكولات",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "DroidKufi",
                                          fontSize: 18.0,
                                        )),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Drinks(
                                        name: "المشروبات",
                                      )));
                            },
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.asset(
                                          "img/drinks.jpeg",
                                          width:
                                          MediaQuery.of(context).size.width /
                                              11,
                                          height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                          fit: BoxFit.fill,
                                        )),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width / 11,
                                      height:
                                      MediaQuery.of(context).size.height / 6,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0x34E7E4E4),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  width: 120,
                                  height: 35,
                                  child: Center(
                                    child: Text("المشروبات",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "DroidKufi",
                                          fontSize: 18.0,
                                        )),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Videos(
                                        name: "المنزل",
                                      )));
                            },
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.asset(
                                          "img/home.jpeg",
                                          width:
                                          MediaQuery.of(context).size.width /
                                              11,
                                          height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                          fit: BoxFit.fill,
                                        )),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width / 11,
                                      height:
                                      MediaQuery.of(context).size.height / 6,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0x34E7E4E4),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  width: 120,
                                  height: 35,
                                  child: Center(
                                    child: Text("المنزل",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "DroidKufi",
                                          fontSize: 18.0,
                                        )),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SlideInLeft(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Transprot(
                                        name: "المواصلات",
                                      )));
                            },
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.asset(
                                          "img/transportation.jpeg",
                                          width:
                                          MediaQuery.of(context).size.width /
                                              11,
                                          height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                          fit: BoxFit.fill,
                                        )),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width / 11,
                                      height:
                                      MediaQuery.of(context).size.height / 6,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0x34E7E4E4),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 120,
                                  height: 35,
                                  child: Center(
                                    child: Text("المواصلات",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "DroidKufi",
                                          fontSize: 18.0,
                                        )),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                )
                              ],
                            ),
                          ),
                          // SizedBox(height: 17,),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Colours(
                                        name: "الألوان",
                                      )));
                            },
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.asset(
                                          "img/colors.jpeg",
                                          width:
                                          MediaQuery.of(context).size.width /
                                              11,
                                          height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                          fit: BoxFit.fill,
                                        )),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width / 11,
                                      height:
                                      MediaQuery.of(context).size.height / 6,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0x34E7E4E4),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 120,
                                  height: 35,
                                  child: Center(
                                    child: Text("الألوان",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "DroidKufi",
                                          fontSize: 18.0,
                                        )),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Videos28(
                                        name: "الحروف",
                                      )));
                            },
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.asset(
                                          "img/characters.jpeg",
                                          width:
                                          MediaQuery.of(context).size.width /
                                              11,
                                          height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                          fit: BoxFit.fill,
                                        )),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width / 11,
                                      height:
                                      MediaQuery.of(context).size.height / 6,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0x34E7E4E4),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 120,
                                  height: 35,
                                  child: Center(
                                    child: Text("الحروف",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "DroidKufi",
                                          fontSize: 18.0,
                                        )),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Numbers(
                                        name: "الأرقام",
                                      )));
                            },
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.asset(
                                          "img/numbers.jpeg",
                                          width:
                                          MediaQuery.of(context).size.width /
                                              11,
                                          height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                          fit: BoxFit.fill,
                                        )),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width / 11,
                                      height:
                                      MediaQuery.of(context).size.height / 6,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0x34E7E4E4),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  width: 120,
                                  height: 35,
                                  child: Center(
                                    child: Text("الأرقام",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "DroidKufi",
                                          fontSize: 18.0,
                                        )),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SlideInRight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Family(
                                        name: "العائله",
                                      )));
                            },
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.asset(
                                          "img/family.jpeg",
                                          width:
                                          MediaQuery.of(context).size.width /
                                              11,
                                          height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                          fit: BoxFit.fill,
                                        )),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width / 11,
                                      height:
                                      MediaQuery.of(context).size.height / 6,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0x34E7E4E4),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  width: 120,
                                  height: 35,
                                  child: Center(
                                    child: Text("العائله",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "DroidKufi",
                                          fontSize: 18.0,
                                        )),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Job(
                                        name: "المهن",
                                      )));
                            },
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.asset(
                                          "img/jobs.jpeg",
                                          width:
                                          MediaQuery.of(context).size.width /
                                              11,
                                          height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                          fit: BoxFit.fill,
                                        )),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width / 11,
                                      height:
                                      MediaQuery.of(context).size.height / 6,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0x34E7E4E4),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 120,
                                  height: 35,
                                  child: Center(
                                    child: Text("المهن",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "DroidKufi",
                                          fontSize: 18.0,
                                        )),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                )
                              ],
                            ),
                          ),
                          // SizedBox(height: 17,),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Nature(
                                        name: "الطبيعه",
                                      )));
                            },
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.asset(
                                          "img/nature.jpeg",
                                          width:
                                          MediaQuery.of(context).size.width /
                                              11,
                                          height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                          fit: BoxFit.fill,
                                        )),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width / 11,
                                      height:
                                      MediaQuery.of(context).size.height / 6,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0x34E7E4E4),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 120,
                                  height: 35,
                                  child: Center(
                                    child: Text("الطبيعه",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "DroidKufi",
                                          fontSize: 18.0,
                                        )),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Animals(
                                        name: "الحيوانات",
                                      )));
                            },
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.asset(
                                          "img/animals.jpeg",
                                          width: MediaQuery.of(context).size.width /
                                              11,
                                          height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                          fit: BoxFit.fill,
                                        )),
                                    Container(
                                      width: MediaQuery.of(context).size.width / 11,
                                      height:
                                      MediaQuery.of(context).size.height / 6,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0x34E7E4E4),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 120,
                                  height: 35,
                                  child: Center(
                                    child: Text("الحيوانات",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "DroidKufi",
                                          fontSize: 18.0,
                                        )),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                )
                              ],
                            ),
                          ),
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
}
