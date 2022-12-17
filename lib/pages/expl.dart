import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/models/person.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/testlogin.dart';
import 'package:flutter_application_1/pages/testrecord.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
String type="";
class expage extends StatefulWidget {
  const expage({Key? key, required this.exid}) : super(key: key);
  final exid;

  @override
  State<expage> createState() => _expageState();
}

class _expageState extends State<expage> {
  String testName='';
  late FocusNode focusNode = FocusNode()
    ..addListener(() {
      setState(() {});
    });
  TextStyle unselectedAccountTypeTextStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  TextStyle selectedAccountTypeTextStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  String userId = '';
  var searchBarController = TextEditingController();
  String? userKind;


  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userKind = prefs.getString('userKind') ?? '';
      userId = prefs.getString('userId') ?? '';
    });
  }
  void initState() {
    if (widget.exid=='1')
      {
        testName='الاختبار الاولي';
      }
    else if (widget.exid=='4')
      {
        testName='اختبار الاصوات البيئية';
      }
    else if (widget.exid=='5')
    {
      testName='اختبار الاصوات الاستيعابية';
    }
    else if (widget.exid=='6')
    {
      testName='اختبار نطق الحروف';
    }
    // print('testt');
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: Center(
        child: Container(
          child: Column(children: [
            const SelectionButton(),
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
      height: MediaQuery.of(context).size.height / 1.15,
      width: MediaQuery.of(context).size.width / 1.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Padding(
        padding: const EdgeInsets.only( top: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
               Padding(
                 padding: const EdgeInsets.only(right: 25.0),
                 child: Text(testName,
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 25,
                        fontFamily: "DroidKufi",
                        fontWeight: FontWeight.w700)),
               ),
              // const SizedBox(
              //   height: 10,
              // ),
              const Padding(
                padding:  EdgeInsets.only(right: 25.0),
                child:  Text(
                  'قم بإختيار الطالب المراد عمل الاختبار له ، سيتم تخزين نتيجة الاختبار في سجل الطالب الذي تم اختياره ',
                  style: TextStyle(
                      fontFamily: "DroidKufi",
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Center(
                child: Container(
                  // color: Colors.black38,
                  height: 460,
                  width: 600,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          // const SizedBox(width: 6),
                          Expanded(
                            // flex: 1,
                            child: Container(
                              // padding: const EdgeInsets.only(
                              //     right: 8, bottom: 1, top: 1, left: 5),
                              height: 45,
                              // width: MediaQuery.of(context).size.width/5,
                              child: TextFormField(

                                focusNode: focusNode,
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
                                decoration: InputDecoration(
                                  // border: InputBorder.none,
                                  hintText: '... البحث عن طالب',
                                  prefixIcon: Icon(Icons.search,color: focusNode.hasFocus ? Colors.green : Colors.grey),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(25)),
                                    borderSide: BorderSide(color: Colors.green, width: 2.5),
                                  ),
                                  fillColor: Colors.white,
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20))
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
                          height: MediaQuery.of(context).size.height/1.8,
                          child: FutureBuilder(
                            future:
                            search ? searchStudents() : getStudents(),
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Container(
                                  width: double.infinity,
                                  height: MediaQuery.of(context).size.height * 0.4,
                                  child: const SpinKitPulse(
                                    color: Colors.green,
                                    size: 60,
                                  ),
                                );
                              } else {
                                var Customers = snapshot.data;
                                // print(Customers[0]['image']);
                                if (snapshot.data != null) {
                                  return ListView.builder(
                                    itemCount: Customers.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                          return testRecord(
                                              ID: Customers[index]["id"],
                                              person: Person(
                                              name: Customers[index]["name"],
                                              id: Customers[index]
                                              ["student_id"],
                                              gender: Customers[index]
                                              ["gender"] == "female" ? Gender.female : Gender.male,
                                              address: Customers[index]["address"],
                                              phoneNumber: Customers[index]["phone"],
                                              type: AccountType.student,
                                                familyname: Customers[index]["familyname"], image: Customers[index]["image"],
                                            ),
                                            exID: widget.exid,
                                            isActive: true,
                                          );

                                      },

                                  );
                                } else {
                                  return const Center(
                                      child: SizedBox(
                                          height: 40,
                                          // width: 40,
                                          child:Text("لا يوجد طلاب بهذا الاسم", style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "DroidKufi",
                                          ),)));
                                }


                              }

                            },

                          ),

                        ),
                      ),

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
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
  getStudents() async {
    var url = 'http://localhost/teststudent.php';
    var response = await http.post(Uri.parse(url), body: {
      "id":userId,
    });
    var res = jsonDecode(response.body);
    return res;
  }

  bool search = false;
  var searchController = TextEditingController();

  searchStudents() async {
    var url = 'http://localhost/testserch.php';
    var response = await http.post(
      Uri.parse(url),
      body: {
         'id' : userId,
        'firstname': searchController.text,
      },
    );
    var res = jsonDecode(response.body);
    return res;
  }
}
