import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/widgets/user_profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../models/person.dart';

class PersonmobRecord extends StatefulWidget {
  PersonmobRecord(
      {Key? key, required this.person, this.ID, required this.isActive})
      : super(key: key);
  final Person person;
  final ID;
  late bool isActive;

  @override
  State<PersonmobRecord> createState() => _PersonmobRecordState();
}

class _PersonmobRecordState extends State<PersonmobRecord> {
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
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: SizedBox(
                    width:115 ,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 5),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return UserProfile(
                                    person: widget.person, id: widget.ID);
                              }));
                            },
                            style: ButtonStyle(
                              minimumSize:
                              MaterialStateProperty.all( Size(40, 45)),
                              backgroundColor: MaterialStateProperty.all(
                                Colors.lightBlue,
                              ),
                            ),
                            child: Icon(Icons.person_outline_rounded,color: Colors.white,size: 30,)
                          ),
                          widget.isActive
                              ? buildDisableButton()
                              : buildEnableButton(),
                          // SizedBox(width: 20,),
                        ],
                      ),
                    ),
                  ),
                ),
                // SizedBox(width: 20,),
                Container(
                  height: 60,
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ListTile(
                      trailing: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child:
                          Image.memory(base64.decode(widget.person.image))),
                      title: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(
                          '${widget.person.name} ${widget.person.familyname}',
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
      ),
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

  void confirmDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text("هل تريد بالتأكيد تعديل حاله الحساب ؟ "),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      updateActive();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        height: 40,
                        width: 100,
                        child: const Center(
                            child: Text(
                              "نعم",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.white),
                            )))),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        height: 40,
                        width: 100,
                        child: const Center(
                            child: Text(
                              "لا",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.white),
                            )))),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> updateActive() async {
    {
      var url = 'http://localhost/edit_user.php';
      bool toggle = !widget.isActive;
      final response = await http.post(
        Uri.parse(url),
        body: {
          "Id_Num": widget.person.id.toString(),
          "active": toggle ? "active" : "inactive",
        },
      );
      var data = jsonDecode(response.body);
      if (data == 'Success') {
        setState(() {
          widget.isActive = toggle;
        });
        Fluttertoast.showToast(msg: "تم تعديل حاله الحساب بنجاح");
      } else {
        Fluttertoast.showToast(
            msg: "حدثت مشكلة اثناء التفعيل", backgroundColor: Colors.red);
      }
    }
  }

  TextButton buildEnableButton() {
    return TextButton(
      onPressed: () {
        confirmDialog();
      },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(40, 45)),
        backgroundColor: MaterialStateProperty.all(
          Colors.green,
        ),
      ),
      child: Icon(Icons.person_add_alt_outlined,color: Colors.white,size: 30,)
    );
  }

  TextButton buildDisableButton() {
    return TextButton(
      onPressed: () {
        confirmDialog();
      },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(40, 45)),
        backgroundColor: MaterialStateProperty.all(
          Colors.redAccent,
        ),
      ),
      child: Icon(Icons.person_off_outlined,color: Colors.white,size: 30,)
    );
  }
}
