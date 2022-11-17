import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Account_Managment/Add_Account/add_society.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/widgets/person_record.dart';
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

// void main() => runApp(const MyApp());

class Socieitesmobile extends StatefulWidget {
  const Socieitesmobile({super.key});

  @override
  State<Socieitesmobile> createState() => _SocieitesmobileState();
}

class _SocieitesmobileState extends State<Socieitesmobile> {
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
                child: const Text('اداره الجمعيات',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 35,
                        fontFamily: "DroidKufi",
                        fontWeight: FontWeight.w700)),
              ),
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
                  height: 500,
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
                                    hintText: 'أدخل اسم الجمعيه',
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
                            height: 310,
                            child: FutureBuilder(
                              future: getTeachers(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
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
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return PersonRecord(
                                          person: Person(
                                            name: Customers[index]
                                            ["Society_Name"],
                                            id: Customers[index]["Society_Id"],
                                            gender: Gender.male,
                                            address: Customers[index]
                                            ["Society_Address"],
                                            phoneNumber: Customers[index]
                                            ["Society_Phone"],
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
                            )),
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
                              return const AddScociety();
                            }),
                          );
                        },
                        child: const Text(
                          'اضافه جمعيه',
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

  getTeachers() async {
    var url = 'http://10.7.4.183/Avocadbmt-main/Avocadbmt-main/lib/add_societis.php';
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
