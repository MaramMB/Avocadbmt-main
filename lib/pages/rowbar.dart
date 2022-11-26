import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/face.dart';

import 'package:flutter_application_1/pages/faceexpl.dart';
import 'package:flutter_application_1/pages/latterexpl.dart';
import 'package:flutter_application_1/pages/voiceexpl.dart';
import 'package:flutter_application_1/scroll.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Profile/profile.dart';
import 'Profile/teacher_profile.dart';
import 'dic.dart';
import 'expl.dart';
import 'mainpage.dart';
import 'manag.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 0;
bool dropOpen = false;
var list1 = [

  DropdownMenuItem(
    alignment: Alignment.centerRight,
    value: 1,
    child: Text("تدريبات نطق الحروف"),
  ),
  DropdownMenuItem(
    alignment: Alignment.centerRight,
    value: 2,
    child: Text("التدريبات الصوتية"),
  ),
  DropdownMenuItem(
    alignment: Alignment.centerRight,
    value: 3,
    child: Text("تدريبات الوجه"),
  )
];


class SelectionButton extends StatefulWidget {
  const SelectionButton({super.key});

  @override
  State<SelectionButton> createState() => SelectionButtonState();
}

class SelectionButtonState extends State<SelectionButton> {
  String? userKind;
  String userId = '';

  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      userKind = prefs.getString('userKind') ?? '';
      userId = prefs.getString('userId') ?? '';
    });
  }
  bool showbtn  (){
    if (userKind == 'student'){
      return false;
    }
    else
    {
      return true;
    }
  }
  @override
  void initState() {
    super.initState();
    getUserData();


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 7.3,
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor:
              MaterialStateColor.resolveWith((states) => Colors.white),
              padding: MaterialStateProperty.all(const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 15.0)),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(25)))),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const mainpage();
              }));
            },
            child: const Text(
              "المشاركة والتواصل",
              style: TextStyle(color: blak, fontFamily: "DroidKufi"),
            ),
          ),
          Visibility(
            visible: showbtn(),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(left: BorderSide(color: Colors.black12,width: 0.5),right: BorderSide(color: Colors.black12,width: 0.5)),
              ),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                  padding: MaterialStateProperty.all(const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15.0, bottom: 15.0)),
                  shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(0.1)))),
                ),
                onPressed: () {
                  setState(() {
                    _value = 0;
                  });
                  (context as Element).reassemble();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return  expage(userId: userId,);
                  }));
                },
                child: const Text(
                  "النتائج والتقدم",
                  style: TextStyle(color: blak, fontFamily: "DroidKufi"),
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                  left: BorderSide(color: Colors.black12, width: 0.5),
                  right: BorderSide(color: Colors.black12, width: 0.5)),
            ),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white),
                padding: MaterialStateProperty.all(const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15.0, bottom: 15.0)),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(0.1)))),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const dic();
                }));
              },
              child: const Text(
                "قاموس لغة الاشارة",
                style: TextStyle(color: blak, fontFamily: "DroidKufi"),
              ),
            ),
          ),
          Container(
            width: 185,
            padding:
            const EdgeInsets.only(left: 0.0, right: 0.0, top: 0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius:
              BorderRadius.only(bottomRight: Radius.circular(0.1)),
            ),
            height: 41,
            child:
            Directionality(
              textDirection: TextDirection.rtl,

              child: DropdownButtonHideUnderline(

                child: DropdownButton2(
                  hint: Row(
                    children: const [
                      Text('قائمة التدريبات', style: TextStyle(
                          decoration: TextDecoration.none,
                          color: blak,
                          fontFamily: "DroidKufi"),),
                    ],
                  ),

                  alignment: Alignment.center ,
                  style: const TextStyle(
                      decoration: TextDecoration.none,
                      color: blak,
                      fontFamily: "DroidKufi"),
                  value: _value == 0 ? null : _value,
                  items: list1,
                  onChanged: (value) {
                    setState(() {
                      _value = value!;
                      switch(value) {
                        case 1: {
                          (context as Element).reassemble();

                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const latterexp();

                          }));
                        }
                        break;

                        case 2: {
                          (context as Element).reassemble();

                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const voiceexp();

                          }));
                        }
                        break;
                        case 3: {
                          (context as Element).reassemble();

                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return  faceex();

                          }));
                        }
                        break;

                        default: {
                          //statements;
                        }
                        break;
                      }
                    });
                  },



                  // underline:ButtonBar(),
                ),
              ),
            ),
          ),
          // Container(
          //   decoration: const BoxDecoration(
          //     border: Border(
          //         left: BorderSide(color: Colors.black12, width: 0.5),
          //         right: BorderSide(color: Colors.black12, width: 0.5)),
          //   ),
          //   child: TextButton(
          //     style: ButtonStyle(
          //       backgroundColor:
          //       MaterialStateColor.resolveWith((states) => Colors.white),
          //       padding: MaterialStateProperty.all(const EdgeInsets.only(
          //           left: 15.0, right: 15.0, top: 15.0, bottom: 15.0)),
          //       shape: MaterialStateProperty.all(
          //         const RoundedRectangleBorder(
          //             borderRadius: BorderRadius.only(
          //                 bottomRight: Radius.circular(0.1),
          //                 bottomLeft: Radius.circular(0.1))),
          //       ),
          //     ),
          //     onPressed: () {
          //       Navigator.of(context)
          //           .push(MaterialPageRoute(builder: (context) {
          //         return const MyApp();
          //       }));
          //     },
          //     child: const Text(
          //       "إدارة الحسابات",
          //       style: TextStyle(color: blak, fontFamily: "DroidKufi"),
          //     ),
          //   ),
          // ),
          TextButton(
            style: ButtonStyle(
              backgroundColor:
              MaterialStateColor.resolveWith((states) => Colors.white),
              padding: MaterialStateProperty.all(const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 15.0)),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(25)))),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const mainpage();
              }));
            },
            child: const Text(
              "الرئيسية",
              style: TextStyle(color: blak, fontFamily: "DroidKufi"),
            ),
          ),
          const Spacer(),
          Directionality(
            textDirection: TextDirection.ltr,
            child: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: const [
                      Icon(
                        Icons.account_box_outlined,
                        color: Colors.black87,
                        size: 20,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "الملف الشخصي",
                        style: TextStyle(
                            fontSize: 14, color: blak, fontFamily: "DroidKufi"),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: const [
                      Icon(
                        Icons.logout,
                        color: Colors.black87,
                        size: 20,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "الخروج من الموقع",
                        style: TextStyle(
                            fontSize: 14, color: blak, fontFamily: "DroidKufi"),
                      ),
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
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return userKind == 'student'
                        ? personal(userId: userId)
                        : TeacherProfile(
                      userId: userId,
                    );
                  }));
                } else if (value == 2) {
                  // await AuthClient.internal().signOut();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (c) => scrollhome()),
                          (r) => false);
                  // _exitApp(context);
                  // showDialog(
                  //   builder: (context) => AlertDialog(
                  //     title: Text('Do you want to exit this application?'),
                  //     content: Text('We hate to see you leave...'),
                  //     actions: <Widget>[
                  //       FloatingActionButton(
                  //         onPressed: () {
                  //           print("you choose no");
                  //           Navigator.of(context).pop(false);
                  //         },
                  //         child: Text('No'),
                  //       ),
                  //       FloatingActionButton(
                  //         onPressed: () {
                  //           SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  //         },
                  //         child: Text('Yes'),
                  //       ),
                  //     ],
                  //   ),
                  //
                  // ) ??
                  //     false;

                }
              },

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "مرام البدارين",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: "DroidKufi"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage("img/avocado.png"),
                    radius: 16.7,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      // vertical: 20
                    ),
                  ),
                  // Image.asset("img/avocado.png",width: 30,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
