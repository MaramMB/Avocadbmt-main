// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/contact.dart';
import 'package:flutter_application_1/pages/join.dart';
import 'package:flutter_application_1/pages/loginpage.dart';
import 'package:flutter_application_1/pages/nexthomepage.dart';
import 'package:flutter_application_1/pages/testlogin.dart';

// import 'package:google_fonts/google_fonts.dart';
const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required uname}) : super(key: key);

  // const HomePage({super.key, });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('img/1.png'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.only(right: 45.0, top: 10, left: 30),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 1.0),
                    child: Text(
                      "LOGO",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const contact();
                      }));
                    },
                    child: const Text(
                      "تواصل معنا",
                      style: TextStyle(color: blak, fontFamily: "DroidKufi"),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return testlog(
                          title: 'Login Page',
                        );
                      }));
                    },
                    child: const Text(
                      "تسجيل الدخول",
                      style: TextStyle(color: blak, fontFamily: "DroidKufi"),
                    ),
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateColor.resolveWith((states) => gren),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.only(left: 18.0, right: 18.0)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const joinus();
                      }));
                    },
                    child: const Text(
                      "انـضـــم لــنــا",
                      style: TextStyle(
                          color: Colors.white, fontFamily: "DroidKufi"),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'img/boy.png',
                      height: 600,
                    ),

                    IconButton(
                        padding: EdgeInsets.only(right: 120, bottom: 50),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const homepage2();
                          }));
                        },
                        icon: const Icon(
                          Icons.expand_more,
                          color: Colors.white,
                          size: 90,
                        )),
                    // SizedBox(width: 30,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 80.0),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.end,

                        children: [
                          const Text(
                            "مرحباً بك",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Tajawal",
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "في افضـل منـصـة تعلـيـمـية",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "DroidKufi",
                                fontSize: 35),
                          ),
                          const Text(
                            "للتأهيل السمعي واللفظي",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "DroidKufi",
                                fontSize: 35),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
