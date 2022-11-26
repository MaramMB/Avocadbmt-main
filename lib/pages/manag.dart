import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Account_Managment/Add_Account/add_account_form.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'models/person.dart';
import 'widgets/person_record.dart';
const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);

class adminmanage extends StatefulWidget {
  const adminmanage({super.key});

  @override
  State<adminmanage> createState() => _adminmanageState();
}

class _adminmanageState extends State<adminmanage> {
  int _selectedAccountType = 1;

  TextStyle unselectedAccountTypeTextStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  TextStyle selectedAccountTypeTextStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  var personList = [
    PersonRecord(
      person: Person(
        name: 'الاميرة تسنيم',
        id: '123456789',
        gender: Gender.female,
        address: 'الخليل',
        phoneNumber: '01234568',
        type: AccountType.student,
      ),
      isActive: true,
    ),
    PersonRecord(
      person: Person(
        name: 'الامورة دونيا',
        id: '123456789',
        gender: Gender.male,
        address: 'الخليل',
        phoneNumber: '01234568',
        type: AccountType.student,
      ),
      isActive: true,
    ),
    PersonRecord(
      person: Person(
        name: 'العسل رنة',
        id: '123456789',
        gender: Gender.female,
        address: 'دورا',
        phoneNumber: '01234568',
        type: AccountType.teacher,
      ),
      isActive: true,
    ),
    PersonRecord(
      person: Person(
        name: 'المميزة مرام',
        id: '543544333',
        gender: Gender.female,
        address: 'الخليل',
        phoneNumber: '87453410',
        type: AccountType.teacher,
      ),
      isActive: true,
    ),
    PersonRecord(
      person: Person(
        name: 'البطل براء',
        id: '543544333',
        gender: Gender.male,
        address: 'الخليل',
        phoneNumber: '87453410',
        type: AccountType.teacher,
      ),
      isActive: true,
    ),
  ];
  late List<PersonRecord> displayedList = _selectedAccountType == 1
      ? personList
      .where((element) => element.person.type == AccountType.student)
      .toList()
      : personList
      .where((element) => element.person.type == AccountType.teacher)
      .toList();

  var searchBarController = TextEditingController();

  void updateListOnSearch(value) {
    displayedList = personList
        .where((element) => element.person.name.contains(value))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:backgreen,
      body: Center(
        child: Container(
          child:  Column(
              children: [
                // const SelectionButton(),
            const SizedBox(height: 25,),
            buildTable(context),
          ]),
        ),
      ),
    );
  }
  // this container contains the person list and search bar and buttons
  Container buildTable(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height/1.1,
      width: MediaQuery.of(context).size.width/1.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
        child: Padding(
          padding: const EdgeInsets.only(right: 25.0,top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 10,),
              Center(
                child: const Text('ادارة الحسابات',
                  style: TextStyle(
                      color: Colors.green,fontSize: 35,fontFamily: "DroidKufi",fontWeight: FontWeight.w700)
                ),
              ),
              SizedBox(height: 15,),
              const Text('هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة,لقد تم توليد هذا النص'
                  ' من مولد النص العربي.',
                style: TextStyle(
                    fontFamily: "DroidKufi",
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),

              Center(
                child: Container(
                  // color: Colors.black38,
                  height:  MediaQuery.of(context).size.height / 1.41,
                  width: MediaQuery.of(context).size.width / 2.5,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              buildTeacherAccountButton(),
                              const SizedBox(width: 5),
                              buildStudentAccountButton(),
                            ],
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            // flex: 1,
                            child: Container(
                              padding: const EdgeInsets.only(right:18,bottom: 5,top: 5,left: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.black38),
                              ),
                              child: Container(
                                height: 28,
                                // width: MediaQuery.of(context).size.width/5,
                                child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      updateListOnSearch(value);
                                    });
                                  },
                                  controller: searchBarController,
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
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.black12,
                          ),
                        ),
                        height: MediaQuery.of(context).size.height/1.98,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: displayedList.map((e) => e).toList(),
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
                          padding:
                          MaterialStateProperty.all(const EdgeInsets.only(top: 8,bottom: 10,right: 18,left: 20)),
                          backgroundColor: MaterialStateProperty.all(Colors.green),
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

    );
  }

  TextButton buildTeacherAccountButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          _selectedAccountType = 0;
          displayedList = personList
              .where((element) => element.person.type == AccountType.teacher)
              .toList();
        });
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(20),
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(85, 42)),
        textStyle: MaterialStateProperty.all(const TextStyle(fontFamily: "Tajawal",fontSize: 16)),
        backgroundColor: MaterialStateProperty.all(
          _selectedAccountType == 0 ? Colors.green : Colors.grey,
        ),
      ),
      child: Text(
        'معلم',
        style: _selectedAccountType == 0
            ? selectedAccountTypeTextStyle
            : unselectedAccountTypeTextStyle,

      ),
    );
  }

  TextButton buildStudentAccountButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          _selectedAccountType = 1;
          displayedList = personList
              .where((element) => element.person.type == AccountType.student)
              .toList();
        });
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(85, 42)),
        textStyle: MaterialStateProperty.all(const TextStyle(fontFamily: "Tajawal",fontSize: 16)),
        backgroundColor: MaterialStateProperty.all(
          _selectedAccountType == 1 ? Colors.green : Colors.grey,
        ),
      ),
      child: Text(
        'طالب',
        style: _selectedAccountType == 1
            ? selectedAccountTypeTextStyle
            : unselectedAccountTypeTextStyle,
      ),
    );
  }
}
