import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/mainpage.dart';
import 'package:flutter_application_1/pages/mobile/homepagemobile.dart';

class mobilepage2 extends StatefulWidget {
  const mobilepage2({Key? key}) : super(key: key);

  @override
  State<mobilepage2> createState() => _mobilepage2State();
}

class _mobilepage2State extends State<mobilepage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('img/les.png'),
              fit: BoxFit.cover,
            )),
        child: Center(
          child: Stack(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50)),
                  // child: Image.asset('img/les.png'),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 120,
                    ),
                    const Text(
                      " من نحن ؟",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Tajawal",
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                    ),
                     Text(
                      "موقعنا عبارة عن مشروع ",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "DroidKufi",
                          fontSize: 25,
                          fontWeight: FontWeight.w100),
                    ),                    Text(
                      " جامعي بدأ عام 2022 ",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "DroidKufi",
                          fontSize: 25,
                          fontWeight: FontWeight.w100),
                    ),
                     Text(
                      "يهدف الى تطوير العملية",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "DroidKufi",
                          fontSize: 25),
                    ),
                    Text(
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
                    IconButton(
                        padding: const EdgeInsets.only(right: 60, bottom: 50),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const HomemobailPage(
                              uname: null,
                            );
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
    );
  }
}
