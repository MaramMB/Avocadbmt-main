import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/homepage.dart';
import 'package:flutter_application_1/pages/mainpage.dart';

class homepage2 extends StatefulWidget {
  const homepage2({Key? key}) : super(key: key);

  @override
  State<homepage2> createState() => _homepage2State();
}

class _homepage2State extends State<homepage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('img/2.png'),
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
                  child: Image.asset('img/les.png'),
                ),
              ),
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
                        padding: const EdgeInsets.only(right: 120, bottom: 50),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const HomePage(
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
