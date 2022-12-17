import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Account_Managment/Add_Account/add_account_form.dart';
import 'package:flutter_application_1/pages/Account_Managment/Add_Account/add_society.dart';
import 'package:flutter_application_1/pages/Account_Managment/Add_Account/addteacher.dart';
import 'package:flutter_application_1/pages/models/person.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.1,
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
                        person.type == AccountType.manager
                            ? _societyFormat
                            : _teacherFormat,
                        const SizedBox(
                          height: 180,
                        ),

                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                          alignment: Alignment.bottomCenter,
                                child: ElevatedButton(
                                  onPressed: () {

                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (BuildContext ctx) {
                                        return person.type == AccountType.manager
                                            ? AddScociety(
                                                isUpdateForm: true,
                                                user: person,
                                              )
                                            : (person.type == AccountType.teacher
                                                ? AddTeacheAccount(
                                                    isUpdateForm: true,
                                                    user: person,
                                                  )
                                                : AddAccountForm(
                                                    isUpdateForm: true,
                                                    user: person,
                                                  ));
                                      }),
                                    );
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
                                  child: const Text("تعديل البيانات",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "DroidKufi",
                                        fontSize: 18.0,
                                      )),
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              ElevatedButton(
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
                            ],
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
      ),
    );
  }

  Widget get _vGap => const SizedBox(
        height: 5.0,
      );

  Widget get _idNumber => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("رقم الهوية : ",
              style: TextStyle(
                color: Colors.green,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              )),
          Text(person.id,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
              )),
          const SizedBox(
            height: 12,
          ),
        ],
      );

  Widget get _name => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("الاسم : ",
              style: TextStyle(
                color: Colors.green,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              )),
          Text(person.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
              )),
          const SizedBox(
            height: 12,
          ),
        ],
      );

  Widget get _phone => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("رقم الهاتف : ",
              style: TextStyle(
                color: Colors.green,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              )),
          Text(person.phoneNumber,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
              )),
          const SizedBox(
            height: 12,
          ),
        ],
      );

  Widget get _address => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("العنوان : ",
              style: TextStyle(
                color: Colors.green,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              )),
          Text(person.address,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
              )),
          const SizedBox(
            height: 12,
          ),
        ],
      );

  Widget get _gender => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("الجنس :",
              style: TextStyle(
                color: Colors.green,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              )),
          Text(gender,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
              )),
          const SizedBox(
            height: 12,
          ),
        ],
      );

  Widget get _type => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(" نوع الحساب : ",
              style: TextStyle(
                color: Colors.green,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              )),
          Text(type,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
              )),
          const SizedBox(
            height: 12,
          ),
        ],
      );

  Widget _rowData(String title, String data) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                color: Colors.green,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              )),
          Text(data,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: "DroidKufi",
                fontSize: 19.0,
              )),
          const SizedBox(
            height: 12,
          ),
        ],
      );

  Widget get _teacherFormat => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _idNumber,
          _vGap,
          _name,
          _vGap,
          _rowData("اسم الأب : ", person.fatherName ?? ''),
          _vGap,
          _phone,
          person.type == AccountType.student ? _parentData : _vGap,
          person.type == AccountType.student
              ? _address
              : _rowData("التخصص : ", person.specific ?? ''),
          _vGap,
          _gender,
          _vGap,
          person.type == AccountType.student
              ? _rowData("المشكلة : ",
                  person.ptype == "hear" ? "مشكله بالسمع" : "مشكله بالنطق")
              : Container(),
          _vGap,
          _type,
          _vGap,
          _rowData("البريد الإلكتروني : ", person.email ?? ''),
        ],
      );

  Widget get _parentData => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _vGap,
          _rowData("اسم الأم : ", person.motherName ?? ''),
          _vGap,
          _rowData("وظيفة الأب : ", person.fatherjob ?? ''),
          _vGap,
          _rowData("تاريخ ميلاد الأب : ", person.fatherDob ?? ''),
          _vGap,
        ],
      );

  Widget get _societyFormat => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _rowData("اسم الجمعية : ", person.name),
          _vGap,
          _rowData("رقم الترخيص : ", person.id),
          _vGap,
          _rowData("اسم المدير : ", person.managerName ?? ''),
          _vGap,
          _rowData("رقم الهاتف : ", person.phoneNumber),
          _vGap,
          _rowData("العنوان : ", person.address),
          _vGap,
          _rowData("عدد الايام المتبقي للاشتراك : ", "${person.date} يوم"),
          _vGap,
          _rowData("البريد الإلكتروني : ", person.email ?? ''),
        ],
      );
}