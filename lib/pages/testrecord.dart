import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Characters/characters.dart';
import 'package:flutter_application_1/pages/models/person.dart';
import 'package:flutter_application_1/pages/voice.dart';
import 'package:flutter_application_1/pages/voicetestbe.dart';
import 'package:flutter_application_1/pages/widgets/user_profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:flutter_app_4/models/person.dart';

class testRecord extends StatefulWidget {
  testRecord(
      {Key? key, required this.person, this.ID, required this.isActive, this.exID})
      : super(key: key);
  final Person person;
  final ID;
  late bool isActive;
  final exID;

  @override
  State<testRecord> createState() => _testRecordState();
}

class _testRecordState extends State<testRecord> {
  @override

   late Color test;
  String result = '';
  String msg = '';
  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      result = prefs.getString('result') ?? '';
      // print(result);
    });
  }
   testresult() async {
    if (result == '0') {
      test =Colors.blue;
      msg='';
      // return test;
    }
    else{
      test =Colors.green;

    }
  }

  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
      });
    });
    getUserData();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
      });
    });
    super.initState();
    getResult(widget.person.id, '1');
    testresult();
  }
  String get gender {
    if (widget.person.gender == Gender.male) {
      return 'ذكر';
    } else if (widget.person.gender == Gender.female) {
      return 'أنثى';
    }
    return "";
  }

  String get type {
    if (widget.person.type == AccountType.student) {
      return 'طالب';
    } else if (widget.person.type == AccountType.teacher) {
      return 'معلم';
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
            // vertical: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: SizedBox(
                  width: 120,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 5),
                        TextButton(
                          onPressed: () {
                            if (widget.exID=='1')
                            {
                              if(result=='0'){
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return sptest(person: widget.person, id: widget.ID);
                              }));
                              }else{
                                showDialog(context: context, builder: (context)=>AlertDialog(
                                  title: Container(
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Text('هذا الطالب اجرى الاختبار من قبل هل تريد اعادة الاختبار له ؟', style: TextStyle(
                                          fontFamily: "DroidKufi",
                                          fontSize: 18,
                                        ),),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () async {
                                                Navigator.push (
                                                  context,
                                                  MaterialPageRoute (
                                                    builder: (BuildContext context) => sptest(person: widget.person, id: widget.ID),
                                                  ),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                                shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.all(Radius.circular(10))),
                                                elevation: 2.0,
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 25, vertical: 5),
                                              ),
                                              child:  Text( 'نعم',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "DroidKufi",
                                                    fontSize: 18.0,
                                                  )),
                                            ),
                                            SizedBox(width: 30,),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.all(Radius.circular(10))),
                                                elevation: 2.0,
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 30, vertical: 5),
                                              ),
                                              child:  Text( 'لا',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "DroidKufi",
                                                    fontSize: 18.0,
                                                  )),
                                            ),


                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                              }
                            }
                            else if (widget.exID=='4')
                            {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return betest(type: 1, sid: widget.person.id, isTeacher: true,);
                              }));
                            }
                            else if (widget.exID=='5')
                            {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return betest(type: 2, sid: widget.person.id, isTeacher: true,);
                              }));
                            }
                          },
                          style: ButtonStyle(
                            minimumSize:
                            MaterialStateProperty.all(const Size(90, 20)),
                            backgroundColor: MaterialStateProperty.all( test,),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: const Text(
                              'ابدأ الاختبار',
                              style: TextStyle(
                                fontFamily: "DroidKufi",
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // SizedBox(width: 20,),
              Container(
                height: 65,
                width: MediaQuery.of(context).size.width / 5.8,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ListTile(
                    trailing:  ClipRRect( borderRadius: BorderRadius.circular(50),child: Image.memory(base64.decode(widget.person.image))),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text(
                        widget.person.name+' '+widget.person.familyname,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontFamily: "DroidKufi",
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    subtitle:
                    Text(widget.person.id, textAlign: TextAlign.right),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(color: Colors.black12),
      ],
    );
  }

  Widget buildInfoRecord(String label, String value) {
    return Container(
      // padding: const EdgeInsets.all(8),
      child: RichText(
        text: TextSpan(
          text: value,
          children: [
            TextSpan(
              text: label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.right,
      ),
    );
  }

  getResult(String id , String tid) async {
    var url = 'http://localhost/getResult.php';
    var response = await http.post(Uri.parse(url), body: {
      'sid':widget.person.id,
      'exid':widget.exID,
    });
    var res = jsonDecode(response.body);
  }

}
