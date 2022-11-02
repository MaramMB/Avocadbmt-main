import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/firsttestdata.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/speaktest.dart';
import 'package:flutter_application_1/pages/testdetail.dart';

import 'mainpage.dart';
import 'manag.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;
class expage extends StatefulWidget {
  const expage({Key? key}) : super(key: key);
  @override
  State<expage> createState() => _expageState();
}

class _expageState extends State<expage> {
  static List<String> testword =['أسد','فأر','عصا','بطة','شباك','أرنب'];

  static List<String> url = ['https://th.bing.com/th/id/OIP.iSebuYpfhQG14qgscrlV1QHaIg?w=186&h=213&c=7&r=0&o=5&dpr=1.5&pid=1.7',
    'https://th.bing.com/th/id/R.4d72d9940dc967e6b7a53ab36dfbaf54?rik=Rq3566yQbsJ0%2bg&riu=http%3a%2f%2fsweetclipart.com%2fmultisite%2fsweetclipart%2ffiles%2fmouse_gray.png&ehk=MsRHbLxNwehMkTfFA%2faQ%2fDmSXirq6hn%2bvpIMn5v7IA0%3d&risl=&pid=ImgRaw&r=0',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Hapus_Mango.jpg/220px-Hapus_Mango.jpg',
    'https://5.imimg.com/data5/VN/YP/MY-33296037/orange-600x600-500x500.jpg',
    'https://5.imimg.com/data5/VN/YP/MY-33296037/orange-600x600-500x500.jpg',
    'https://5.imimg.com/data5/GJ/MD/MY-35442270/fresh-pineapple-500x500.jpg'];

  final List<FirstTest> testdata = List.generate(testword.length, (index) => FirstTest('${testword[index]}', '${url[index]}','${testword[index]} Description...'));
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
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Center(
                            child: Text("الاختبار الاولي",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 30,
                                    fontFamily: "DroidKufi",
                                    fontWeight: FontWeight.w700))),
                        SizedBox(
                          height: 20,
                        ),
                        const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                        const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات ",
                            style: TextStyle(fontFamily: "DroidKufi")),
                        const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات ",
                            style: TextStyle(fontFamily: "DroidKufi")),
                        const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                        const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات ",
                            style: TextStyle(fontFamily: "DroidKufi")),
                        const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات ",
                            style: TextStyle(fontFamily: "DroidKufi")),
                        const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                        const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                        const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات ",
                            style: TextStyle(fontFamily: "DroidKufi")),
                        const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات ",
                            style: TextStyle(fontFamily: "DroidKufi")),
                        const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                        const Text(
                            "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                            style: TextStyle(fontFamily: "DroidKufi")),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigator.of(context)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   return sptest();
                              // }));
                              
                              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TestDetail(index: index,testDataModel: testdata,)));
                              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>sptest(index: index,testDataModel: testdata,)));
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
                            child: const Text("هيا لنبدأ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "DroidKufi",
                                  fontSize: 17.0,
                                )),
                          ),
                        ),
                      ],
                    ),
                    Stack(alignment: Alignment.bottomLeft, children: [
                      Image.asset("img/girl-explain.png",
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
