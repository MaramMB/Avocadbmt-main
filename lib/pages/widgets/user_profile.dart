import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/models/person.dart';
import 'package:flutter_application_1/pages/rowbar.dart';

const backgreen = Color.fromRGBO(131, 190, 99, 1);

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key, required this.person, required this.id})
      : super(key: key);
  final Person person;
  final String id;

  String get gender {
    if (person.gender == Gender.male) {
      return 'ذكر';
    } else if (person.gender == Gender.female) {
      return 'أنثى';
    }
    return "";
  }

  String get type {
    if (person.type == AccountType.student) {
      return 'طالب';
    } else if (person.type == AccountType.teacher) {
      return 'معلم';
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: Container(
        child: Column(
          children: [
            const SelectionButton(),
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
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                          child: Text("  ملف الشخصي ل ${person.name}",
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 30,
                                  fontFamily: "DroidKufi",
                                  fontWeight: FontWeight.w700))),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _idNumber,
                          _vGap,
                          _name,
                          _vGap,
                          _phone,
                          _vGap,
                          _address,
                          _vGap,
                          _gender,
                          _vGap,
                          _type
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
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
                          child: const Text("العودة",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "DroidKufi",
                                fontSize: 18.0,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget get _vGap => const SizedBox(
        height: 5.0,
      );

  Widget get _idNumber => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(id,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
              )),
          const Text(" : رقم الهوية   ",
              style: TextStyle(
                color: Colors.green,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 12,
          ),
        ],
      );

  Widget get _name => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(person.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
              )),
          const Text(" : الاسم   ",
              style: TextStyle(
                color: Colors.green,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 12,
          ),
        ],
      );

  Widget get _phone => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(person.phoneNumber,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
              )),
          const Text(" : رقم الهاتف   ",
              style: TextStyle(
                color: Colors.green,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 12,
          ),
        ],
      );

  Widget get _address => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(person.address,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
              )),
          const Text(" : العنوان   ",
              style: TextStyle(
                color: Colors.green,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 12,
          ),
        ],
      );

  Widget get _gender => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(gender,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
              )),
          const Text(" : الجنس   ",
              style: TextStyle(
                color: Colors.green,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 12,
          ),
        ],
      );

  Widget get _type => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(type,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
              )),
          const Text(" : نوع الحساب   ",
              style: TextStyle(
                color: Colors.green,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 12,
          ),
        ],
      );
}

