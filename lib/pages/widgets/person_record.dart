import 'package:flutter/material.dart';

import '../models/person.dart';
// import 'package:flutter_app_4/models/person.dart';

class PersonRecord extends StatefulWidget {
  PersonRecord({Key? key, required this.person, required this.isActive})
      : super(key: key);
  final Person person;
  late bool isActive;

  @override
  State<PersonRecord> createState() => _PersonRecordState();
}

class _PersonRecordState extends State<PersonRecord> {
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
                  width: 210,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 5),
                        TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext ctx) {
                                  return SimpleDialog(

                                    title: const Text(
                                      'الملف الشخصي',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "Tajawal",
                                      ),
                                    ),
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: [
                                            // place the image widget here
                                            //--------------------------------------------
                                            //-------------------------------------------------
                                            Text(
                                              type,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: RichText(
                                                text: TextSpan(
                                                    text: 'الرقم:',
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: widget.person.id,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                          FontWeight.normal,
                                                        ),
                                                      ),
                                                    ]),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: RichText(
                                                text: TextSpan(
                                                    text: 'الاسم:',
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                          text: widget.person.name,
                                                          style: const TextStyle(
                                                            fontWeight:
                                                            FontWeight.normal,
                                                          )),
                                                    ]),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: RichText(
                                                text: TextSpan(
                                                    text: 'الجنس:',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold),
                                                    children: [
                                                      TextSpan(
                                                        text: gender,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                          FontWeight.normal,
                                                        ),
                                                      ),
                                                    ]),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: RichText(
                                                text: TextSpan(
                                                    text: 'العنوان:',
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: widget.person.address,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                          FontWeight.normal,
                                                        ),
                                                      ),
                                                    ]),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: RichText(
                                                text: TextSpan(
                                                    text: widget.person.phoneNumber,
                                                    children: const [
                                                      TextSpan(
                                                        text: ':رقم الهاتف',
                                                        style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold,
                                                        ),
                                                      ),
                                                    ]),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                });
                          },
                          style: ButtonStyle(
                            minimumSize:
                            MaterialStateProperty.all(const Size(90, 40)),
                            backgroundColor: MaterialStateProperty.all(
                              Colors.lightBlue,
                            ),
                          ),
                          child: const Text(
                            'الملف الشخصي',
                            style: TextStyle(
                              fontFamily: "Tajawal",
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                // color: Colors.white,
                height: 65,
                // color: Colors.white,
                width: MediaQuery.of(context).size.width/5.8,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ListTile(
                    trailing: const CircleAvatar(
                      backgroundColor:Color(75747400),
                      child: Icon(Icons.account_circle_outlined,size: 60,color: Colors.green,),
                      // child: ClipOval(),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(top:12.0),
                      child: Text(
                        widget.person.name,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontFamily: "DroidKufi",
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    subtitle: Text(widget.person.id, textAlign: TextAlign.right),
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

  TextButton buildEnableButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          widget.isActive = true;
        });
      },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(90, 40)),
        backgroundColor: MaterialStateProperty.all(
          Colors.green,
        ),
      ),
      child: const Text(
        'تفعيل',
        style: TextStyle(
          fontFamily: "Tajawal",
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  TextButton buildDisableButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          widget.isActive = false;
        });
      },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(90, 40)),
        backgroundColor: MaterialStateProperty.all(
          Colors.redAccent,
        ),
      ),
      child: const Text(
        'إلغاء التفعيل',
        style: TextStyle(
          fontFamily: "Tajawal",
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
