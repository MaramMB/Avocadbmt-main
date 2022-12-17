import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/contact.dart';
import 'package:flutter_application_1/pages/join.dart';
import 'package:flutter_application_1/pages/testlogin.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
class scrollhome extends StatefulWidget {
  @override
  _scrollhomeState createState() => _scrollhomeState();
}

class _scrollhomeState extends State<scrollhome> {
  final controller = PageController(viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final pages = List.generate( 1,
            (index) => Container(
          child: SingleChildScrollView(
            // physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('img/1.png'),
                            fit: BoxFit.cover,
                          )),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(bottom: BorderSide(
                                width: 1,
                                color: Colors.grey,
                              )),
                              boxShadow: [
                                 BoxShadow(
                                  color: Colors.white70,
                                ),
                                 BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: -5.0,
                                  blurRadius: 12.0,
                                ),
                              ],

                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30.0, top: 5, left: 30),
                              child: Row(
                                children: [
                                   Padding(
                                    padding: EdgeInsets.only(left: 1.0),
                                    child: Image.asset('img/nabralogo.png',width: 80,height: 50,),
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
                                        return testlog();
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
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:60.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FadeInLeftBig(
                                  child: Image.asset(
                                    'img/boy.png',
                                    height: 532,
                                  ),
                                ),

                                IconButton(
                                    padding: EdgeInsets.only(right: 120, bottom: 50),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (context) {
                                        return scrollhome();
                                      }));
                                    },
                                    icon: const Icon(
                                      Icons.expand_more,
                                      color: Colors.white,
                                      size: 90,
                                    )),
                                // SizedBox(width: 30,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 45.0, top: 10, left: 30 , bottom: 80),
                                  child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.end,

                                    children: [
                                      FadeInRightBig(
                                        child: const Text(
                                          "مرحباً بك",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Tajawal",
                                            fontSize: 70,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      FadeInRightBig(
                                        delay: Duration(seconds: 1),
                                        child: const Text(
                                          "في افضـل منـصـة تعلـيـمـية",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "DroidKufi",
                                              fontSize: 35),
                                        ),
                                      ),
                                      FadeInRightBig(
                                        delay: Duration(seconds: 2),
                                        child: const Text(
                                          "للتأهيل السمعي واللفظي",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "DroidKufi",
                                              fontSize: 35),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      // child: Text(
                      //   "Page $index",
                      //   style: const TextStyle(color: Colors.indigo),
                      // )
                    ),
                ),
                Container(
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
                                "موقعنا عبارة عن مشروع جامعي بدأ عام 2022 ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "DroidKufi",
                                    fontSize: 25,
                                    fontWeight: FontWeight.w100),
                              ),
                              const Text(
                                "يهدف الى تطوير العملية التأهيلية للأطفال بشكل عام",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "DroidKufi",
                                    fontSize: 25),
                              ),
                              const Text(
                                "وللأطفال الذين يعانون من مشاكل بالسمع ",
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
                              IconButton(
                                  padding: const EdgeInsets.only(right: 120, bottom: 50),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (context) {
                                      return  scrollhome();
                                    }));
                                  },
                                  icon: const Icon(
                                    Icons.expand_less,
                                    color: Colors.white,
                                    size: 90,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )

    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: PageView.builder(
                      controller: controller,
                      // itemCount: pages.length,
                      itemBuilder: (_, index) {
                        return pages[index % 1];
                      },
                    ),
                  ),
              // Padding(
              //   padding:  EdgeInsets.symmetric(horizontal: 15,vertical:MediaQuery.of(context).size.height/2.4),
              //   child: Container(
              //     child: SmoothPageIndicator(
              //       controller: controller,
              //       count: pages.length,
              //       axisDirection: Axis.vertical,
              //       // onDotClicked: (index) => ,
              //       effect: const JumpingDotEffect(
              //         dotHeight: 18,
              //         dotWidth: 18,
              //         jumpScale: .6,
              //         verticalOffset: 15,
              //         dotColor: Colors.grey,
              //         activeDotColor: Colors.green,
              //       ),
              //     ),
              //   ),
              // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
