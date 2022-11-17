import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/widgets/person_record.dart';
import 'package:flutter_application_1/pages/widgets/societies.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import '../Account_Managment/Add_Account/add_account_form.dart';
import '../models/person.dart';

// import 'package:flutter_app_4/models/person.dart';
// import 'package:flutter_app_4/screens/add_account_form.dart';
// import 'package:flutter_app_4/widgets/person_record.dart';
const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;


class managemobile extends StatefulWidget {
  const managemobile({super.key});

  @override
  State<managemobile> createState() => _managemobileState();
}

class _managemobileState extends State<managemobile> {
  int _selectedAccountType = 1;

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
      body: Center(
        child: Container(
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
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0, top: 10,left: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: const Text('ادارة الحسابات',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 25,
                        fontFamily: "DroidKufi",
                        fontWeight: FontWeight.w700)),
              ),
              SizedBox(
                height: 10,
              ),
              // InkWell(
              //   onTap: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => Socieites()));
              //   },
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: Colors.green,
              //     ),
              //     height: 40,
              //     width: 100,
              //     child: Center(
              //       child: Text(
              //         "الجمعيات",
              //         style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white,
              //             fontSize: 18),
              //       ),
              //     ),
              //   ),
              // ),
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
                  height: 445,
                  width: 600,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              buildTeacherAccountButton(),
                              const SizedBox(width: 5),
                              buildStudentAccountButton(),
                            ],
                          ),

                        ],
                      ),
                          const SizedBox(height: 6),
                      Expanded(
                        // flex: 1,
                        child: Container(
                          padding: const EdgeInsets.only(
                              right: 5, bottom: 5, top: 5, left: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black38),
                          ),
                          child: Container(
                            // height: 30,
                            width: MediaQuery.of(context).size.width/1.3,
                            child: TextFormField(
                              onChanged: (value) {
                                if (searchController.text == "") {
                                  setState(() {
                                    search = false;
                                  });
                                } else {
                                  setState(() {
                                    search = true;
                                  });
                                }
                              },
                              controller: searchController,
                              textAlign: TextAlign.right,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'أدخل اسم المستخدم',
                                prefixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
                        ),
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
                          height: 290,
                          child: teacher
                              ? FutureBuilder(
                            future: getTeachers(),
                            builder: (BuildContext context,
                                AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Container(
                                  width: double.infinity,
                                  height:
                                  MediaQuery.of(context).size.height *
                                      0.4,
                                  child: SpinKitPulse(
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
                                    NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return PersonRecord(
                                        // ID: Customers[index]["id"],
                                        person: Person(
                                          name: Customers[index]["name"],
                                          id: Customers[index]
                                          ["teachers_id"],
                                          gender: Customers[index]
                                          ["gender"] ==
                                              "female"
                                              ? Gender.female
                                              : Gender.male,
                                          address: " - ",
                                          phoneNumber: Customers[index]
                                          ["phone"],
                                          type: AccountType.teacher,
                                        ),
                                        isActive: true,
                                      );
                                    },
                                  );
                                } else {
                                  return Center(
                                      child: SizedBox(
                                          height: 40,
                                          width: 40,
                                          child:
                                          CircularProgressIndicator()));
                                }
                              }
                            },
                          )
                              : FutureBuilder(
                            future:
                            search ? searchStudents() : getStudents(),
                            builder: (BuildContext context,
                                AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Container(
                                  width: double.infinity,
                                  height:
                                  MediaQuery.of(context).size.height *
                                      0.4,
                                  child: SpinKitPulse(
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
                                    NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return PersonRecord(
                                        // ID: Customers[index]["id"],
                                        person: Person(
                                          name: Customers[index]["name"],
                                          id: Customers[index]
                                          ["student_id"],
                                          gender: Customers[index]
                                          ["gender"] ==
                                              "female"
                                              ? Gender.female
                                              : Gender.male,
                                          address: Customers[index]
                                          ["address"],
                                          phoneNumber: Customers[index]
                                          ["phone"],
                                          type: AccountType.teacher,
                                        ),
                                        isActive: true,
                                      );
                                    },
                                  );
                                } else {
                                  return Center(
                                      child: SizedBox(
                                          height: 40,
                                          width: 40,
                                          child:
                                          CircularProgressIndicator()));
                                }
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.only(
                                  top: 8, bottom: 10, right: 18, left: 20)),
                          backgroundColor:
                          MaterialStateProperty.all(Colors.green),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext ctx) {
                              return const AddAccountForm();
                            }),
                          );
                        },
                        child: const Text(
                          'إضافة حساب جديد',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "DroidKufi",
                          ),
                        ),
                      )
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

  getStudents() async {
    var url = 'http://10.7.4.183/Avocadbmt-main/Avocadbmt-main/lib/get_students.php';
    var response = await http.get(Uri.parse(url));
    var res = jsonDecode(response.body);
    return res;
  }

  bool search = false;
  var searchController = TextEditingController();

  searchStudents() async {
    var url = 'http://10.7.4.183/Avocadbmt-main/Avocadbmt-main/lib/search_student.php';
    var response = await http.post(
      Uri.parse(url),
      body: {
        'firstname': searchController.text,
      },
    );
    var res = jsonDecode(response.body);
    return res;
  }

  getTeachers() async {
    var url = 'http://10.7.4.183/Avocadbmt-main/Avocadbmt-main/lib/get_teachers.php';
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
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(120, 45)),
        textStyle: MaterialStateProperty.all(
            const TextStyle(fontFamily: "Tajawal", fontSize: 18)),
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
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(120, 45)),
        textStyle: MaterialStateProperty.all(
            const TextStyle(fontFamily: "Tajawal", fontSize: 18)),
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