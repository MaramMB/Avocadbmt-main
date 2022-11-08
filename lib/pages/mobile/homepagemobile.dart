// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/contact.dart';
import 'package:flutter_application_1/pages/join.dart';
import 'package:flutter_application_1/pages/mobile/homep2mobile.dart';
import 'package:flutter_application_1/pages/mobile/loginmobile.dart';
const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);

class HomemobailPage extends StatefulWidget {
  const HomemobailPage({super.key, required uname});

  @override
  State<HomemobailPage> createState() => _HomemobailPageState();
}

class _HomemobailPageState extends State<HomemobailPage> {
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
          padding: const EdgeInsets.only(right: 15.0, top: 10, left: 30),
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
                  SizedBox(width: 8,),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: PopupMenuButton(
                      itemBuilder:(context) => [
                        PopupMenuItem(

                          value: 1,
                          child: Row(
                            textDirection:TextDirection.rtl ,
                            children: const [
                              Icon(Icons.login,color: Colors.black87,size: 20,),
                              SizedBox(width: 8,),
                              Text("تسجيل الدخول",style: TextStyle(
                                  fontSize: 14,
                                  color: blak,
                                  fontFamily: "DroidKufi"),),
                            ],
                          ),

                        ),

                        PopupMenuItem(

                          value: 2,

                          child: Row(
                            textDirection:TextDirection.rtl ,
                            children: const [
                              Icon(Icons.connect_without_contact,color: Colors.black87,size: 20,),
                              SizedBox(width: 8,),
                              Text("تواصل معنا",style: TextStyle(
                                  fontSize: 14,
                                  color: blak,
                                  fontFamily: "DroidKufi"),),
                            ],
                          ),
                        )
                      ],
                      offset: const Offset(0, 35),
                      // color: Colors.grey,
                      elevation: 2,
                      // on selected we show the dialog box
                      onSelected: (value) async {
                        // if value 1 show dialog
                        if (value == 1) {
                          (context as Element).reassemble();

                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return mobilelogin(
                              title: 'Login Page',
                            ) ;
                          }));
                        } else if (value == 2) {
                          (context as Element).reassemble();

                          // await AuthClient.internal().signOut();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (c) => contact()
                              ),
                                  (r) => false);

                        }
                      },


                      child:Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Icon( Icons.menu_rounded,color: Colors.green,size: 30,),

                          // Image.asset("img/avocado.png",width: 30,)
                        ],
                      ),

                    ),

                  ),

                ],
              ),
              Column(
                children: [
                  SizedBox(height: 260,),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      const Text(
                        "مرحباً بك",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Tajawal",
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "في افضـل منـصـة تعلـيـمـية",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "DroidKufi",
                            fontSize: 30),
                      ),
                      const Text(
                        "للتأهيل السمعي واللفظي",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "DroidKufi",
                            fontSize: 30),
                      ),
                      IconButton(
                        padding: EdgeInsets.only(right: 60),
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const mobilepage2();
                            }));
                          },
                          icon: const Icon(
                            Icons.expand_more,
                            color: Colors.white,
                            size: 90,
                          )),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
