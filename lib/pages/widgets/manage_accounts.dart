import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Account_Managment/Add_Account/addteacher.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Account_Managment/Add_Account/add_account_form.dart';
import '../models/person.dart';
import 'person_record.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;
String type = "";

// void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const managepage(),
    );
  }
}

class managepage extends StatefulWidget {
  const managepage({Key? key}) : super(key: key);

  @override
  State<managepage> createState() => _managepageState();
}

class _managepageState extends State<managepage> {
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
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: const Locale(
          'ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales,
      home: Scaffold(
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
            children: [
              const Text('ادارة الحسابات',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 25,
                      fontFamily: "DroidKufi",
                      fontWeight: FontWeight.w700)),
              const SizedBox(
                height: 10,
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
                          const SizedBox(width: 6),
                          Row(
                            children: [
                              buildStudentAccountButton(),
                              const SizedBox(width: 5),
                              buildTeacherAccountButton(),
                            ],
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
                          height: 370,
                          child: teacher
                              ? FutureBuilder(
                                  future:
                                      search ? searchTeachers() : getTeachers(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height *
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
                                              const AlwaysScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return PersonRecord(
                                              ID: Customers[index]["id"],
                                              person: Person(
                                                name: Customers[index]["name"],
                                                id: Customers[index]["Id_Num"],
                                                gender: Customers[index]
                                                            ["gender"] ==
                                                        "female"
                                                    ? Gender.female
                                                    : Gender.male,
                                                address: '',
                                                phoneNumber: Customers[index]
                                                    ["phone"],
                                                fatherName: Customers[index]
                                                    ["fatherName"],
                                                email: Customers[index]
                                                    ["Email"],
                                                password: Customers[index]
                                                    ["Password"],
                                                type: AccountType.teacher,
                                                familyname: Customers[index]
                                                    ["familyname"],
                                                image: Customers[index]
                                                    ["image"],
                                                accountNumber: Customers[index]
                                                        ["accountnumber"] ??
                                                    '',
                                                grandName: Customers[index]
                                                        ["thirdname"] ??
                                                    '',
                                                specific: Customers[index]
                                                        ["spec"] ??
                                                    '',
                                              ),
                                              isActive: Customers[index]
                                                          ["active"] ==
                                                      "active"
                                                  ? true
                                                  : false,
                                            );
                                          },
                                        );
                                      } else {
                                        return const Center(
                                            child: SizedBox(
                                          height: 40,
                                          child: Text(
                                            overflow: TextOverflow.visible,
                                            'لا يوجد حساب بهذا الاسم',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "DroidKufi",
                                            ),
                                          ),
                                        ));
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
                                          itemBuilder: (context, index) {
                                            return PersonRecord(
                                              ID: Customers[index]["id"],
                                              person: Person(
                                                name: Customers[index]["name"],
                                                id: Customers[index]
                                                    ["student_id"],
                                                gender: Customers[index]
                                                                ["Gender"]
                                                            .toString()
                                                            .toLowerCase() ==
                                                        "female"
                                                    ? Gender.female
                                                    : Gender.male,
                                                address: Customers[index]
                                                    ["address"],
                                                phoneNumber: Customers[index]
                                                        ["phone"] ??
                                                    '',
                                                type: AccountType.student,
                                                email: Customers[index]
                                                    ["Email"],
                                                familyname: Customers[index]
                                                        ["familyname"] ??
                                                    '',
                                                image: Customers[index]
                                                    ["image"],
                                                motherName: Customers[index]
                                                        ["mothername"] ??
                                                    '',
                                                fatherjob: Customers[index]
                                                        ["work"] ??
                                                    '',
                                                grandName: Customers[index]
                                                        ["thirdname"] ??
                                                    '',
                                                fatherDob: Customers[index]
                                                        ["fatherDob"] ??
                                                    '',
                                                ptype: Customers[index]
                                                        ["ptype"] ??
                                                    '',
                                                fatherName: Customers[index]
                                                        ["father_name"] ??
                                                    '',
                                                teatcherId: Customers[index]
                                                        ["tid"] ??
                                                    '',
                                                date: Customers[index]["dob"] ??
                                                    '',
                                              ),
                                              isActive: Customers[index]
                                                          ["active"] ==
                                                      "active"
                                                  ? true
                                                  : false,
                                            );
                                          },
                                        );
                                      } else {
                                        return const Center(
                                            child: SizedBox(
                                                height: 40,
                                                // width: 40,
                                                child: Text(
                                                  "لا يوجد حساب بهذا الاسم",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: "DroidKufi",
                                                  ),
                                                )));
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
                                  top: 8, right: 18, left: 20)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return teacher == false
                                ? const AddAccountForm()
                                : const AddTeacheAccount();
                          }));
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
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? userId = pref.getString('userId');

    var url =
        'http://localhost/get_students.php?id=$userId';
    var response = await http.get(Uri.parse(url));
    var res = jsonDecode(response.body);
    return res;
  }

  bool search = false;
  var searchController = TextEditingController();

  searchStudents() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? userId = pref.getString('userId');

    var url = 'http://localhost/search_student.php';
    var response = await http.post(
      Uri.parse(url),
      body: {
        'id': userId,
        'firstname': searchController.text,
      },
    );
    var res = jsonDecode(response.body);
    return res;
  }

  getTeachers() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? userId = pref.getString('userId');

    var url =
        'http://localhost/get_teachers.php?id=$userId';
    var response = await http.get(Uri.parse(url));
    var res = jsonDecode(response.body);
    return res;
  }

  searchTeachers() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? userId = pref.getString('userId');

    var url = 'http://localhost/search_teacher.php';
    var response = await http.post(
      Uri.parse(url),
      body: {
        'firstname': searchController.text,
        'id': userId,
      },
    );
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

  Widget get _noSocietyFound => const Center(
        child: Text(
          "لا توجد جمعيات مضافة",
          style: TextStyle(
            fontSize: 16,
            fontFamily: "DroidKufi",
          ),
        ),
      );
}
