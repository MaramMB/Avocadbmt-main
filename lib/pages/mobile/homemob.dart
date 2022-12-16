import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/contact.dart';
import 'package:flutter_application_1/pages/join.dart';
import 'package:flutter_application_1/pages/mobile/join.dart';
import 'package:flutter_application_1/pages/mobile/loginmobile.dart';
import 'package:flutter_application_1/pages/testlogin.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
class scrollmobile extends StatefulWidget {
  @override
  _scrollmobileState createState() => _scrollmobileState();
}

class _scrollmobileState extends State<scrollmobile> {
  // final controller = PageController(viewportFraction: 1, keepPage: true);
  var controller;
  @override
  void initState() {
    controller=new PageController(
      viewportFraction:1.05,
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
      return Container(
                  width:double.infinity,
                  height:MediaQuery.of(context).size.height,
                  child:
                  Column(
                    children:[
                      Stack(
                        children: [
                          SizedBox(
                            height:MediaQuery.of(context).size.height,
                            child:PageView(
                              controller:controller,
                              children: [
                                SizedBox(
                                  width:double.infinity,
                                  height:MediaQuery.of(context).size.height,
                                  child:
                                  Card(
                                    child: Container(
                                                    height: MediaQuery.of(context).size.height,
                                                    decoration: const BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage('img/1.png'),
                                                          fit: BoxFit.cover,
                                                        )),
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(right: 15.0, top: 10, left: 20),
                                                      child: Column(
                                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                               Padding(
                                                                padding: EdgeInsets.only(left: 1.0),
                                                                child: Image.asset('img/nabralogo.png',width: 60,height: 40,),

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
                                                                    return const joinmob();
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
                                                                        return mobilelogin() ;
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
                                                              SizedBox(height: MediaQuery.of(context).size.height/2.3,),
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
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                  ),
                                ),
                                SizedBox(
                                  width:double.infinity,
                                  height:300,
                                  child:
                                  Card(
                                    child:Container(
                                                  decoration: const BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage('img/les.png'),
                                                        fit: BoxFit.cover,
                                                      )),
                                                  height: MediaQuery.of(context).size.height,
                                                  child: Center(
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment: Alignment.center,
                                                          child: Column(
                                                            // crossAxisAlignment: CrossAxisAlignment.end,
                                                            children: [
                                                              const SizedBox(
                                                                height: 160,
                                                              ),
                                                              const Text(
                                                                " من نحن ؟",
                                                                style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontFamily: "Tajawal",
                                                                    fontSize: 70,
                                                                    fontWeight: FontWeight.bold),
                                                              ),
                                                              const Text(
                                                                "موقعنا عبارة عن مشروع جامعي بدأ ",
                                                                style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontFamily: "DroidKufi",
                                                                    fontSize: 25,
                                                                    fontWeight: FontWeight.w100),
                                                              ),
                                                              const Text(
                                                                "عام 2022 يهدف الى تطوير العملية",
                                                                style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontFamily: "DroidKufi",
                                                                    fontSize: 25),
                                                              ),
                                                              const Text(
                                                                " التأهيلية للأطفال بشكل عام",
                                                                style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontFamily: "DroidKufi",
                                                                    fontSize: 25),
                                                              ),
                                                              const Text(
                                                                "وللأطفال الدين يعانون من مشاكل بالسمع ",
                                                                style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontFamily: "DroidKufi",
                                                                    fontSize: 25),
                                                              ),
                                                              const Text(
                                                                "والنطق بشكل خاص",
                                                                style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontFamily: "DroidKufi",
                                                                    fontSize: 25),
                                                              ),
                                                              // IconButton(
                                                              //     padding: const EdgeInsets.only(right: 120, bottom: 50),
                                                              //     onPressed: () {
                                                              //       // Navigator.of(context)
                                                              //       //     .push(MaterialPageRoute(builder: (context) {
                                                              //       //   return  scrollhome();
                                                              //       // }));
                                                              //     },
                                                              //     icon: const Icon(
                                                              //       Icons.expand_less,
                                                              //       color: Colors.white,
                                                              //       size: 90,
                                                              //     )),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                      ))
                                  ),
                                ),
                              ],
                            ),
                          ),
                      Padding(
                        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width/2.1,top:MediaQuery.of(context).size.height/1.19),
                        child: SmoothPageIndicator(
                          controller:controller,
                          axisDirection: Axis.horizontal,
                          count:2,
                          effect:JumpingDotEffect(
                            dotHeight: 22,
                            dotWidth: 22,
                            jumpScale: .6,
                            verticalOffset: 15,
                            dotColor: Colors.white,
                            activeDotColor: Colors.green,
                          ),
                        ),
                      )
                        ],
                      ),

                    ],
                  )
      );
    }
  }