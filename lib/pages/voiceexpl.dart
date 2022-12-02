import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/speaktest.dart';
import 'package:flutter_application_1/pages/voice.dart';
import 'mainpage.dart';

import 'package:http/http.dart' as http;
const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
 var x;
int _value = 1;
class voiceexp extends StatefulWidget {
   voiceexp({Key? key,  required this.UserID, required this.UserKind}) : super(key: key);
  String UserID;
  String? UserKind;


  @override
  State<voiceexp> createState() => _voiceexpState();
}

class _voiceexpState extends State<voiceexp> {
  @override
  void initState() {

    super.initState();
  }
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
                            child: Text("تدريب الاصوات",
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

                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: ()  async {
                              x =await getTid(widget.UserID, widget.UserKind);
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return  voicex(UserID: widget.UserID, UserKind: widget.UserKind, tid: x,);
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

  getTid(String userID, String? userKind) async {
    print(userID);
    print ('get tid');
    if (userKind == 'student'){
      var url = 'http://localhost/getTid.php';
      var response = await http.post(Uri.parse(url), body :{
        'id': userID,
      });
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data[0]['tid']);
        return data[0]['tid'];
      }
    }
    else
      {
        return userID;
      }


  }
}
