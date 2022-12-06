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
  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      result = prefs.getString('result') ?? '';
    });
  }
  Color initState() {
    getUserData();
    super.initState();
    if ('result' != 0) {
      test =Colors.blue;
      return test;
    }
    else{
      test =Colors.green;
      return test;
    }
    getResult(widget.person.id, '1');
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
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return sptest(person: widget.person, id: widget.ID);
                              }));
                            }
                            else if (widget.exID=='4')
                            {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return betest(type: 1, sid: widget.person.id);
                              }));
                            }
                            else if (widget.exID=='5')
                            {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return betest(type: 2, sid: widget.person.id);
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
