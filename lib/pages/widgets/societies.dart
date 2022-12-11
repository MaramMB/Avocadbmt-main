import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Account_Managment/Add_Account/add_society.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import '../models/person.dart';

import 'person_record.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);

class Socieites extends StatefulWidget {
  const Socieites({Key? key}) : super(key: key);

  @override
  State<Socieites> createState() => _SocieitesState();
}

class _SocieitesState extends State<Socieites> {
  TextStyle unselectedAccountTypeTextStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  TextStyle selectedAccountTypeTextStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  bool search = false;
  var searchBarController = TextEditingController();

  @override
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
        body: Container(
          child: Center(
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
              const Text('اداره الجمعيات',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 25,
                      fontFamily: "DroidKufi",
                      fontWeight: FontWeight.w700)),
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
                  height: 510,
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
                                    if (searchBarController.text == "") {
                                      setState(() {
                                        search = false;
                                      });
                                    } else {
                                      setState(() {
                                        search = true;
                                      });
                                    }
                                  },
                                  controller: searchBarController,
                                  textAlign: TextAlign.right,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'أدخل اسم الجمعية',
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
                            height: 380,
                            child: FutureBuilder(
                              future: search ? searchSociey() : getSocieties(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.connectionState ==
                                        ConnectionState.waiting ||
                                    !snapshot.hasData) {
                                  return Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
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
                                            name: Customers[index]
                                                ["Society_Name"],
                                            id: Customers[index]["Society_Id"],
                                            gender: Gender.male,
                                            address: Customers[index]
                                                ["Society_Address"],
                                            phoneNumber: Customers[index]
                                                ["Society_Phone"],
                                            type: AccountType.manager,
                                            date: _remainingDays(
                                                Customers[index]
                                                    ["Participation_Date"]),
                                            email: Customers[index]["Email"],
                                            managerName: Customers[index]
                                                ["Society_Manager"],
                                            password: Customers[index]
                                                ["Password"],
                                            familyname: '',
                                            image: Customers[index]["image"],
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
                                            width: 40,
                                            child: Text(
                                              'لا يوجد حساب بهذا الاسم',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: "DroidKufi",
                                              ),
                                            )));
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
                                  top: 8, right: 18, left: 20)),
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
                          'اضافه جمعية',
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

  String _remainingDays(var days) {
    DateTime date = DateTime.parse(days);
    DateTime nextYear = DateTime((date.year + 1), date.month, date.day);
    DateTime now= DateTime.now();

    final difference = nextYear.toUtc().difference(now.toUtc()).inDays;

    return '$difference';
  }

  getSocieties() async {
    var url = 'http://localhost/get_societis.php';
    var response = await http.get(Uri.parse(url));
    var res = jsonDecode(response.body);
    return res;
  }

  searchSociey() async {
    var url = 'http://localhost/search_society.php';
    var response = await http.post(
      Uri.parse(url),
      body: {
        'name': searchBarController.text,
      },
    );
    var res = jsonDecode(response.body);
    return res;
  }
}
