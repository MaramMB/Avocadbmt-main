import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/expl.dart';
import 'package:flutter_application_1/pages/rowbar.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;

class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SelectionButton(),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 0.8,
              width: MediaQuery.of(context).size.width / 1.8,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              // child: Stack(
              //
              // ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text("قائمة التدريبات",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 25,
                                fontFamily: "DroidKufi",
                                fontWeight: FontWeight.w700)),
                        const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                        const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                        const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                        const Text("قائمة التدريبات",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 25,
                                fontFamily: "DroidKufi",
                                fontWeight: FontWeight.w700)),
                        const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                        const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                        const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                        const Text("قائمة التدريبات",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 25,
                                fontFamily: "DroidKufi",
                                fontWeight: FontWeight.w700)),
                        const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                        const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                        const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                        const SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const expage();
                              }));
                            },
                            style: ElevatedButton.styleFrom(
                              alignment: Alignment.bottomCenter,
                              backgroundColor: Colors.green,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              elevation: 2.0,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 12),
                            ),
                            child: const Text("بدأ الاختبار الاولي للنطق",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "DroidKufi",
                                  fontSize: 16.0,
                                )),
                          ),
                        ),
                      ],
                    ),
                    Stack(alignment: Alignment.bottomLeft, children: [
                      Image.asset("img/boytalk.png",
                          alignment: Alignment.bottomLeft,
                          height: MediaQuery.of(context).size.height / 1.9)
                    ]),
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