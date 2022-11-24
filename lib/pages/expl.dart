import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Account_Managment/Add_Account/add_society.dart';
import 'package:flutter_application_1/pages/Characters/characters.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/widgets/person_record.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

// import 'package:flutter_app_4/models/person.dart';
// import 'package:flutter_app_4/screens/add_account_form.dart';
// import 'package:flutter_app_4/widgets/person_record.dart';
const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);

// void main() => runApp(const MyApp());

class expage extends StatefulWidget {
  const expage({Key? key}) : super(key: key);

  @override
  State<expage> createState() => _expageState();
}

class _expageState extends State<expage> {
  TextStyle unselectedAccountTypeTextStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  TextStyle selectedAccountTypeTextStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  var searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: Container(
        child: Center(
          child: Column(children: [
            // const SelectionButton(),
            const SizedBox(
              height: 25,
            ),
            buildTable(context),
          ]),
        ),
      ),
    );
  }

  // this container contains the person list and search bar and buttons
  Container buildTable(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.1,
      width: MediaQuery.of(context).size.width / 1.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 25.0, top: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 25,
                      fontFamily: "DroidKufi",
                      fontWeight: FontWeight.w700)),
              const Text(
                'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة,لقد تم توليد هذا النص'
                    ' من مولد النص العربي.',
                style: TextStyle(
                    fontFamily: "DroidKufi",
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              Center(
                child: Container(
                  // color: Colors.black38,
                  height: 510,
                  width: 600,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 6),
                          Expanded(
                            // flex: 1,
                            child: Container(
                              padding: const EdgeInsets.only(
                                  right: 18, bottom: 5, top: 5, left: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.black38),
                              ),
                              child: Container(
                                height: 28,
                                // width: MediaQuery.of(context).size.width/5,
                                child: TextFormField(
                                  onChanged: (value) {
                                    // setState(() {
                                    //   updateListOnSearch(value);
                                    // });
                                  },
                                  controller: searchBarController,
                                  textAlign: TextAlign.right,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'أدخل اسم الجمعية',
                                    prefixIcon: Icon(Icons.search),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.black12,
                              ),
                            ),
                            height: 350,
                            child: FutureBuilder(
                              future: getSocieties(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting ||
                                    !snapshot.hasData) {
                                  return Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    child: const SpinKitPulse(
                                      color: Colors.green,
                                      size: 60,
                                    ),
                                  );
                                } else {
                                  if (snapshot.data != null) {
                                    var Customers = snapshot.data;

                                    return ListView.builder(
                                      itemCount: Customers.length,
                                      shrinkWrap: true,
                                      physics:
                                      const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return  Customers[index]["id"];
                                      },
                                    );
                                  } else {
                                    return const Center(
                                        child: SizedBox(
                                            height: 40,
                                            width: 40,
                                            child:
                                            CircularProgressIndicator()));
                                  }
                                }
                              },
                            )),
                      ),
                      const SizedBox(height: 10),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return sptest();
                              }));
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
                                )
                                ),
                          ),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getSocieties() async {
    var url = 'http://localhost/get_societis.php';
    var response = await http.get(Uri.parse(url));
    var res = jsonDecode(response.body);
    return res;
  }

  TextButton buildTeacherAccountButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          teacher = true;
        });
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(85, 42)),
        textStyle: MaterialStateProperty.all(
            const TextStyle(fontFamily: "Tajawal", fontSize: 16)),
        backgroundColor: MaterialStateProperty.all(
          teacher ? Colors.green : Colors.grey,
        ),
      ),
      child: Text(
        'معلم',
        style: teacher
            ? selectedAccountTypeTextStyle
            : unselectedAccountTypeTextStyle,
      ),
    );
  }

  bool teacher = false;

  TextButton buildStudentAccountButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          teacher = false;
        });
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(85, 42)),
        textStyle: MaterialStateProperty.all(
            const TextStyle(fontFamily: "Tajawal", fontSize: 16)),
        backgroundColor: MaterialStateProperty.all(
          teacher == false ? Colors.green : Colors.grey,
        ),
      ),
      child: Text(
        'طالب',
        style: teacher == false
            ? selectedAccountTypeTextStyle
            : unselectedAccountTypeTextStyle,
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/Characters/characters.dart';
// import 'package:flutter_application_1/pages/firsttestdata.dart';
// import 'package:flutter_application_1/pages/rowbar.dart';
// import 'package:flutter_application_1/pages/speaktest.dart';
// import 'package:flutter_application_1/pages/testdetail.dart';
//
// import 'mainpage.dart';
// import 'manag.dart';
//
// const blak = Color.fromRGBO(55, 53, 53, 1);
// const gren = Color.fromRGBO(129, 188, 95, 1);
// const backgreen = Color.fromRGBO(131, 190, 99, 1);
// int _value = 1;
// class expage extends StatefulWidget {
//   const expage({Key? key}) : super(key: key);
//   @override
//   State<expage> createState() => _expageState();
// }
//
// class _expageState extends State<expage> {
//   static List<String> testword =['أسد','فأر','عصا','بطة','شباك','أرنب'];
//
//   static List<String> url = ['https://th.bing.com/th/id/OIP.iSebuYpfhQG14qgscrlV1QHaIg?w=186&h=213&c=7&r=0&o=5&dpr=1.5&pid=1.7',
//     'https://th.bing.com/th/id/R.4d72d9940dc967e6b7a53ab36dfbaf54?rik=Rq3566yQbsJ0%2bg&riu=http%3a%2f%2fsweetclipart.com%2fmultisite%2fsweetclipart%2ffiles%2fmouse_gray.png&ehk=MsRHbLxNwehMkTfFA%2faQ%2fDmSXirq6hn%2bvpIMn5v7IA0%3d&risl=&pid=ImgRaw&r=0',
//     'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Hapus_Mango.jpg/220px-Hapus_Mango.jpg',
//     'https://5.imimg.com/data5/VN/YP/MY-33296037/orange-600x600-500x500.jpg',
//     'https://5.imimg.com/data5/VN/YP/MY-33296037/orange-600x600-500x500.jpg',
//     'https://5.imimg.com/data5/GJ/MD/MY-35442270/fresh-pineapple-500x500.jpg'];
//
//   final List<FirstTest> testdata = List.generate(testword.length, (index) => FirstTest('${testword[index]}', '${url[index]}','${testword[index]} Description...'));
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgreen,
//       body: Container(
//         child: Column(
//           children: [
//             SelectionButton(),
//             const SizedBox(
//               height: 30,
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height / 1.2,
//               width: MediaQuery.of(context).size.width / 1.8,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(Radius.circular(15)),
//               ),
//               // child: Stack(
//               //
//               // ),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         const Center(
//                             child: Text("الاختبار الاولي",
//                                 style: TextStyle(
//                                     color: Colors.green,
//                                     fontSize: 30,
//                                     fontFamily: "DroidKufi",
//                                     fontWeight: FontWeight.w700))),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         const Text(
//                             "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
//                             style: TextStyle(fontFamily: "DroidKufi")),
//                         const Text(
//                             "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات ",
//                             style: TextStyle(fontFamily: "DroidKufi")),
//                         const Text(
//                             "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات ",
//                             style: TextStyle(fontFamily: "DroidKufi")),
//                         const Text(
//                             "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
//                             style: TextStyle(fontFamily: "DroidKufi")),
//                         const Text(
//                             "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات ",
//                             style: TextStyle(fontFamily: "DroidKufi")),
//                         const Text(
//                             "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات ",
//                             style: TextStyle(fontFamily: "DroidKufi")),
//                         const Text(
//                             "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
//                             style: TextStyle(fontFamily: "DroidKufi")),
//                         const Text(
//                             "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
//                             style: TextStyle(fontFamily: "DroidKufi")),
//                         const Text(
//                             "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات ",
//                             style: TextStyle(fontFamily: "DroidKufi")),
//                         const Text(
//                             "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات ",
//                             style: TextStyle(fontFamily: "DroidKufi")),
//                         const Text(
//                             "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
//                             style: TextStyle(fontFamily: "DroidKufi")),
//                         const Text(
//                             "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
//                             style: TextStyle(fontFamily: "DroidKufi")),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         Center(
//                           child: ElevatedButton(
//                             onPressed: () {
//                               Navigator.of(context)
//                                   .push(MaterialPageRoute(builder: (context) {
//                                 return sptest();
//                               }));
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.green,
//                               shape: const RoundedRectangleBorder(
//                                   borderRadius:
//                                   BorderRadius.all(Radius.circular(10))),
//                               elevation: 2.0,
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 35, vertical: 10),
//                             ),
//                             child: const Text("هيا لنبدأ",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: "DroidKufi",
//                                   fontSize: 17.0,
//                                 )
//                                 ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Stack(alignment: Alignment.bottomLeft, children: [
//                       Image.asset("img/girl-explain.png",
//                           alignment: Alignment.bottomLeft,
//                           height: MediaQuery.of(context).size.height / 1.9)
//                     ]),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
