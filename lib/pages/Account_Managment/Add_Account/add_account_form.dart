import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import '../../rowbar.dart';
import '../../widgets/manage_accounts.dart';
// import 'package:intl/intl.dart';

enum SingingCharacterTeacher { Male, Female }

const backgreen = Color.fromRGBO(131, 190, 99, 1);

enum SingingCharacterStudent { Male, Female }

enum SingingCharacterProblem { hear, pron }

class AddAccountForm extends StatefulWidget {
  const AddAccountForm({Key? key}) : super(key: key);

  @override
  State<AddAccountForm> createState() => _AddAccountFormState();
}

class _AddAccountFormState extends State<AddAccountForm> {
  String gender = '';
  int _selectedType = 2;
  TextStyle unselectedTypeTextStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  TextStyle selectedTypeTextStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  final _formKey = GlobalKey<FormState>();
  var backgreen = Color.fromRGBO(131, 190, 99, 1);
  var height16 = const SizedBox(height: 16);

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
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    // textDirection: TextDirection.rtl,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("اضافه حساب",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 30,
                              fontFamily: "DroidKufi",
                              fontWeight: FontWeight.w700)),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            // زر الاستيعابية
                            onPressed: () {
                              setState(() {
                                _selectedType = 1;
                                /*displayedList = soundList
                                    .where((element) => element.sounds.type == soundType.asteabe)
                                    .toList();*/
                              });
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              minimumSize:
                                  MaterialStateProperty.all(const Size(85, 42)),
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(
                                      fontFamily: "DroidKufi", fontSize: 20)),
                              backgroundColor: MaterialStateProperty.all(
                                _selectedType == 1 ? Colors.green : Colors.grey,
                              ),
                            ),
                            child: Text(
                              'اضافه معلم',
                              style: _selectedType == 1
                                  ? selectedTypeTextStyle
                                  : unselectedTypeTextStyle,
                            ),
                          ),
                          const SizedBox(width: 5),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _selectedType = 0;
                                /*  displayedList = soundList
                                    .where((element) => element.sounds.type == soundType.beae)
                                    .toList();*/
                              });
                            },
                            style: ButtonStyle(
                              // زر البيئية

                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(110, 42)),
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(
                                      fontFamily: "DroidKufi", fontSize: 20)),
                              backgroundColor: MaterialStateProperty.all(
                                _selectedType == 0 ? Colors.green : Colors.grey,
                              ),
                            ),
                            child: Text(
                              'اضافه طالب',
                              style: _selectedType == 0
                                  ? selectedTypeTextStyle
                                  : unselectedTypeTextStyle,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _selectedType == 0
                          ? studentwidget()
                          : _selectedType == 1
                              ? teacherwidget()
                              : Container(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
    // Container(
    //   padding: const EdgeInsets.all(30),
    //   alignment: Alignment.topCenter,
    //   child: Column(
    //     children: [
    //       const Text("إنشاء حساب جديد",
    //         style: TextStyle(
    //           color: Colors.white,
    //           fontFamily: "Tajawal",
    //           fontSize: 40,
    //           fontWeight: FontWeight.bold,
    //         ),),
    //       SizedBox(height: 20,),
    //       Container(
    //         decoration: BoxDecoration(
    //           // border: Border.all(color: Colors.black38),
    //           borderRadius: BorderRadius.circular(20),
    //           // color: Colors.gr,
    //         ),
    //         width: MediaQuery.of(context).size.width / 2,
    //         child: Form(
    //           key: _formKey,
    //           child: Padding(
    //             padding:
    //             const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
    //             child: Column(
    //               children: [

    //                 height16,
    //                 SizedBox(height: 30,),
    //                 buildCreateAccountButton(context),
    //                 height16,
    //                 SizedBox(height: 30,),
    //                 buildCreateAccountButton2(context)
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),

    //     ],
    //   ),
    // ),
  }

  addStudent() async {
    if (firstnameController.text == "" ||
        secondnameController.text == "" ||
        thirdnameController.text == "" ||
        lastnameController.text == "" ||
        addressstudentController.text == "" ||
        familyphoneController.text == "" ||
        dateinput.text == "") {
      Navigator.of(context, rootNavigator: true).pop();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('الرجاء تعبئه جميع الفراغات'),
            actions: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'حسنا',
                  style: TextStyle(color: Color(0xff34568B)),
                ),
              ),
            ],
          );
        },
      );
    } else {
      var url = 'http://10.7.4.183/Avocadbmt-main/Avocadbmt-main/lib/add_student.php';

      final response = await http.post(
        Uri.parse(url),
        body: {
          'firstname': firstnameController.text,
          'secname': secondnameController.text,
          'thirdname': thirdnameController.text,
          'familyname': lastnameController.text,
          'DOB': dateinput.text,
          'Gender': _characterstudent.toString().split('.').last,
          'Address': addressstudentController.text,
          'phone': familyphoneController.text,
          'Students_Id': IDstudentController.text,
          'ptype': pro.toString().split('.').last,
        },
      );
      
      var data = jsonDecode(response.body);
     
      if (data == 'Success') {
        Navigator.of(context, rootNavigator: true).pop();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text("هل تريد بالتأكيد حفظ البيانات ؟ "),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Fluttertoast.showToast(msg: "تم اضافه الطالب بنجاح");
                          Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const MyApp();
                }));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            height: 40,
                            width: 100,
                            child: Center(
                                child: Text(
                              "نعم",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
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
                            child: Center(
                                child: Text(
                              "لا",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )))),
                  ],
                ),
              ],
            );
          },
        );
      } else {
       Navigator.of(context, rootNavigator: true).pop();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text("هل تريد بالتأكيد حفظ البيانات ؟ "),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Fluttertoast.showToast(msg: "تم اضافه الطالب بنجاح");
                          Navigator.pop(context);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            height: 40,
                            width: 100,
                            child: Center(
                                child: Text(
                              "نعم",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
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
                            child: Center(
                                child: Text(
                              "لا",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )))),
                  ],
                ),
              ],
            );
          },
        );
      }
    }
  }

  addTeacher() async {
    if (nameController.text == "" ||
        accountnumberController.text == "" ||
        phoneController.text == "" ||
        emailController.text == "" ||
        specificController.text == "") {
      Navigator.of(context, rootNavigator: true).pop();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('الرجاء تعبئه جميع الفراغات'),
            actions: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'حسنا',
                  style: TextStyle(color: Color(0xff34568B)),
                ),
              ),
            ],
          );
        },
      );
    } else {
      var url = 'http://10.7.4.183/Avocadbmt-main/Avocadbmt-main/lib/add_teacher.php';

      final response = await http.post(
        Uri.parse(url),
        body: {
          'name': nameController.text,
          'email': emailController.text,
          'gender': _character.toString().split('.').last,
          'spec': specificController.text,
          'phone': phoneController.text,
          'accountnumber': accountnumberController.text,
          'teachers_id': IDTeacherController.text,
        },
      );

      var data = jsonDecode(response.body);

      if (data == 'Success') {
        Navigator.of(context, rootNavigator: true).pop();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text("هل تريد بالتأكيد حفظ البيانات ؟ "),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Fluttertoast.showToast(msg: "تم اضافه المعلم بنجاح");
                          Navigator.pop(context);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            height: 40,
                            width: 100,
                            child: Center(
                                child: Text(
                              "نعم",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
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
                            child: Center(
                                child: Text(
                              "لا",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )))),
                  ],
                ),
              ],
            );
          },
        );
      } else {
        Navigator.of(context, rootNavigator: true).pop();
        // print('fsdsdfs');
      }
    }
  }

  // Controllers for Teachers
  var nameController = TextEditingController();
  var IDTeacherController = TextEditingController();
  var accountnumberController = TextEditingController();
  var phoneController = TextEditingController();
  // var fathernameController = TextEditingController();
  // var addressController = TextEditingController();
  var emailController = TextEditingController();
  var specificController = TextEditingController();

  //Controllers for Strudents
  var firstnameController = TextEditingController();
  var secondnameController = TextEditingController();
  var thirdnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var IDstudentController = TextEditingController();
  var emailstudentController = TextEditingController();
  var fathernameController = TextEditingController();
  var addressstudentController = TextEditingController();
  var familyphoneController = TextEditingController();
  var dateinput = TextEditingController();

  SingingCharacterTeacher? _character = SingingCharacterTeacher.Female;
  SingingCharacterStudent? _characterstudent = SingingCharacterStudent.Female;
  SingingCharacterProblem? pro = SingingCharacterProblem.hear;

  Widget teacherwidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        namefield(field: "اسم المعلم"),
        textfieldwidget(
          type: TextInputType.name,
          ontap: () {},
          wid: 300,
          hei: 40,
          nameController: nameController,
          text: "أسم المعلم",
        ),
        namefield(field: "رقم الهويه"),
        textfieldwidget(
          type: TextInputType.name,
          ontap: () {},
          wid: 300,
          hei: 40,
          nameController: IDTeacherController,
          text: "رقم الهويه",
        ),
        namefield(field: "رقم الحساب"),
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, top: 5),
          child: Container(
            height: 40,
            width: 300,
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
              ],
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              onTap: () {},
              textAlign: TextAlign.right,
              controller: accountnumberController,
              obscureText: false,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff34568B), width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: backgreen),
                ),
                hintText: "رقم الحساب",
              ),
            ),
          ),
        ),
        namefield(field: "رقم الهاتف"),
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, top: 5),
          child: Container(
            height: 40,
            width: 300,
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
              ],
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              onTap: () {},
              textAlign: TextAlign.right,
              controller: phoneController,
              obscureText: false,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff34568B), width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: backgreen),
                ),
                hintText: "رقم الهاتف",
              ),
            ),
          ),
        ),
        namefield(field: "البريد الالكتروني"),
        textfieldwidget(
          type: TextInputType.emailAddress,
          ontap: () {},
          wid: 300,
          hei: 40,
          nameController: emailController,
          text: "البريد الالكتروني",
        ),
        namefield(field: "التخصص"),
        textfieldwidget(
          type: TextInputType.text,
          ontap: () {},
          wid: 300,
          hei: 40,
          nameController: specificController,
          text: "التخصص",
        ),
        namefield(field: "الجنس"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 200,
              child: RadioListTile(
                  activeColor: backgreen,
                  title: Text("ذكر"),
                  value: SingingCharacterTeacher.Male,
                  groupValue: _character,
                  selected: _character == SingingCharacterTeacher.Male,
                  onChanged: (SingingCharacterTeacher? value) {
                    setState(() {
                      _character = value;
                    });
                  }),
            ),
            SizedBox(
              height: 50,
              width: 150,
              child: Center(
                child: RadioListTile(
                    activeColor: backgreen,
                    title: Text("انثى"),
                    value: SingingCharacterTeacher.Female,
                    groupValue: _character,
                    selected: _character == SingingCharacterTeacher.Female,
                    onChanged: (SingingCharacterTeacher? value) {
                      setState(() {
                        _character = value;
                      });
                    }),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: SizedBox(
                        height: 100,
                        width: 100,
                        child: Center(child: CircularProgressIndicator())),
                  );
                },
              );
              addTeacher();
            },
            child: Container(
              width: 200,
              height: 40,
              child: Center(
                child: Text(
                  "اضافه معلم",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                  color: backgreen, borderRadius: BorderRadius.circular(10)),
            ),
          ),
        )
      ],
    );
  }

  _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        dateinput.text = formattedDate; //set output date to TextField value.
      });
    } else {
      // print("Date is not selected");
    }
  }

  Widget studentwidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                namefield(field: "الأسم الأخير"),
                textfieldwidget(
                  type: TextInputType.name,
                  ontap: () {},
                  wid: 150,
                  hei: 40,
                  nameController: lastnameController,
                  text: "الأسم الأخير",
                ),
              ],
            ),
            Column(
              children: [
                namefield(field: "الأسم الثالث"),
                textfieldwidget(
                  type: TextInputType.name,
                  ontap: () {},
                  wid: 150,
                  hei: 40,
                  nameController: thirdnameController,
                  text: "الأسم الثالث",
                ),
              ],
            ),
            Column(
              children: [
                namefield(field: "الأسم الثاني"),
                textfieldwidget(
                  type: TextInputType.name,
                  ontap: () {},
                  wid: 150,
                  hei: 40,
                  nameController: secondnameController,
                  text: "الأسم الثاني",
                ),
              ],
            ),
            Column(
              children: [
                namefield(field: "الأسم الأول"),
                textfieldwidget(
                  type: TextInputType.name,
                  ontap: () {},
                  wid: 150,
                  hei: 40,
                  nameController: firstnameController,
                  text: "الأسم الأول",
                ),
              ],
            ),
          ],
        ),
        namefield(field: "رقم هويه الطالب"),
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, top: 5),
          child: Container(
            height: 40,
            width: 300,
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
              ],
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              onTap: () {},
              textAlign: TextAlign.right,
              controller: IDstudentController,
              obscureText: false,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff34568B), width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: backgreen),
                ),
                hintText: "رقم هويه الطالب",
              ),
            ),
          ),
        ),
        namefield(field: "العنوان"),
        textfieldwidget(
          type: TextInputType.number,
          ontap: () {},
          wid: 300,
          hei: 40,
          nameController: addressstudentController,
          text: "العنوان",
        ),
        namefield(field: "رقم هاتف الأهل"),
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, top: 5),
          child: Container(
            height: 40,
            width: 300,
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
              ],
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              onTap: () {},
              textAlign: TextAlign.right,
              controller: familyphoneController,
              obscureText: false,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff34568B), width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: backgreen),
                ),
                hintText: "رقم هاتف الأهل",
              ),
            ),
          ),
        ),
        namefield(field: "تاريخ الميلاد"),
        textfieldwidget(
          type: TextInputType.datetime,
          ontap: () {
            _pickDate();
          },
          nameController: dateinput,
          wid: 300,
          hei: 40,
          text: "تاريخ الميلاد",
        ),
        namefield(field: "الجنس"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 200,
              child: RadioListTile(
                  activeColor: backgreen,
                  title: Text("ذكر"),
                  value: SingingCharacterStudent.Male,
                  groupValue: _characterstudent,
                  selected: _characterstudent == SingingCharacterStudent.Male,
                  onChanged: (SingingCharacterStudent? value) {
                    setState(() {
                      _characterstudent = value;
                    });
                  }),
            ),
            SizedBox(
              height: 50,
              width: 150,
              child: Center(
                child: RadioListTile(
                    activeColor: backgreen,
                    title: Text("انثى"),
                    value: SingingCharacterStudent.Female,
                    groupValue: _characterstudent,
                    selected:
                        _characterstudent == SingingCharacterStudent.Female,
                    onChanged: (SingingCharacterStudent? value) {
                      setState(() {
                        _characterstudent = value;
                      });
                    }),
              ),
            ),
          ],
        ),
        namefield(field: "المشكله لديه"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 200,
              child: RadioListTile(
                  activeColor: backgreen,
                  title: Text("سمع"),
                  value: SingingCharacterProblem.hear,
                  groupValue: pro,
                  selected: pro == SingingCharacterProblem.hear,
                  onChanged: (SingingCharacterProblem? value) {
                    setState(() {
                      pro = value;
                    });
                  }),
            ),
            SizedBox(
              height: 50,
              width: 150,
              child: Center(
                child: RadioListTile(
                    activeColor: backgreen,
                    title: Text("نطق"),
                    value: SingingCharacterProblem.pron,
                    groupValue: pro,
                    selected: pro == SingingCharacterProblem.pron,
                    onChanged: (SingingCharacterProblem? value) {
                      setState(() {
                        pro = value;
                      });
                    }),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: SizedBox(
                        height: 100,
                        width: 100,
                        child: Center(child: CircularProgressIndicator())),
                  );
                },
              );
              addStudent();
            },
            child: Container(
              width: 200,
              height: 40,
              child: Center(
                child: Text(
                  "اضافه طالب",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                  color: backgreen, borderRadius: BorderRadius.circular(10)),
            ),
          ),
        )
      ],
    );
  }

  Widget namefield({String field = ""}) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 15, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            field,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class textfieldwidget extends StatelessWidget {
  textfieldwidget({
    Key? key,
    required this.nameController,
    required this.ontap,
    required this.text,
    required this.wid,
    required this.hei,
    required this.type,
  }) : super(key: key);

  final TextEditingController nameController;
  final text;
  Function ontap;
  final wid;
  final hei;
  final type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 5),
      child: Container(
        height: hei,
        width: wid,
        child: TextField(
          keyboardType: type,
          onTap: () {
            ontap();
          },
          textAlign: TextAlign.right,
          controller: nameController,
          obscureText: false,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff34568B), width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: backgreen),
            ),
            hintText: text,
          ),
        ),
      ),
    );
  }
}
