// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/widgets/custom_text_field.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
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
  var backgreen = const Color.fromRGBO(131, 190, 99, 1);
  var height16 = const SizedBox(height: 16);
  bool _passwordVisible = true;

  @override
  void initState() {
    super.initState();
    setCurrentDate();
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: Center(
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.1,
                width: MediaQuery.of(context).size.width / 1.6,
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
                        const Text("اضافه طالب",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 35,
                                fontFamily: "DroidKufi",
                                fontWeight: FontWeight.w700)),

                       Padding(
                         padding: const EdgeInsets.only(right: 20.0,left: 20),
                         child: studentwidget(),
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
            content: const Text('الرجاء تعبئه جميع الفراغات'),
            actions: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'حسنا',
                  style: TextStyle(color: Color(0xff34568B)),
                ),
              ),
            ],
          );
        },
      );
    } else {
      var url = 'http://localhost/add_student.php';
      final requestBody = {
        "firstname": firstnameController.text,
        "secname": secondnameController.text,
        "thirdname": thirdnameController.text,
        "familyname": lastnameController.text,
        "DOB": dateinput.text,
        "Gender": _characterstudent.toString().split('.').last,
        "Address": addressstudentController.text,
        "phone": familyphoneController.text,
        "Students_Id": IDstudentController.text,
        "ptype": pro.toString().split('.').last,
        "img": "",
        "email": emailController.text,
        "password": passController.text,
      };

      final response = await http.post(Uri.parse(url), body: requestBody);

      var data = jsonDecode(response.body);

      if (data == 'Success') {
        Navigator.of(context, rootNavigator: true).pop();
        clearData();
        Fluttertoast.showToast(
            msg: "تم اضافه الطالب بنجاح", timeInSecForIosWeb: 1);
      } else {
        Navigator.of(context, rootNavigator: true).pop();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: const Text("هل تريد بالتأكيد حفظ البيانات ؟ "),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context, rootNavigator: true).pop();
                          Fluttertoast.showToast(msg: "تم اضافه الطالب بنجاح");
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            height: 40,
                            width: 100,
                            child: const Center(
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
                            child: const Center(
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

  void confirmDialog({isTeacher = true}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text("هل تريد بالتأكيد حفظ البيانات ؟ "),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                       addStudent();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        height: 40,
                        width: 100,
                        child: const Center(
                            child: Text(
                              "نعم",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.white),
                            )))),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        height: 40,
                        width: 100,
                        child: const Center(
                            child: Text(
                              "لا",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.white),
                            )))),
              ],
            ),
          ],
        );
      },
    );
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

  var passController = TextEditingController();
  var confirmPassController = TextEditingController();
  var dateAppliedController = TextEditingController();

  void clearData() {
    setState(() {
      nameController.clear();
      firstnameController.clear();
      secondnameController.clear();
      thirdnameController.clear();
      lastnameController.clear();
      passController.clear();
      IDstudentController.clear();
      emailstudentController.clear();
      fathernameController.clear();
      addressstudentController.clear();
      familyphoneController.clear();
      dateinput.clear();
      accountnumberController.clear();
      emailController.clear();
      specificController.clear();
      dateAppliedController.clear();
      IDTeacherController.clear();
      confirmPassController.clear();
      phoneController.clear();
    });
  }

  SingingCharacterTeacher? _character = SingingCharacterTeacher.Female;
  SingingCharacterStudent? _characterstudent = SingingCharacterStudent.Female;
  SingingCharacterProblem? pro = SingingCharacterProblem.hear;
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

  void msgDialog(String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(msg),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'حسنا',
                style: TextStyle(color: Color(0xff34568B)),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget get _email => Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      const Padding(
        padding:  EdgeInsets.only(right: 18.0,top: 25),
        child: Text("البريد الالكتروني",style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 18,
          color: Colors.black87,
          fontFamily: 'DroidKufi',
        ),),
      ),
      customTextFieldWidget(
        type: TextInputType.name,
        ontap: () {},
        wid: 320,
        hei: 50,
        validation: (Val) => validateEmail(emailController.text),
        nameController: emailController,
        text: "bara@gmail.com :مثال", readOnly: false,
      ),
    ],
  );

  Widget get _password => Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      const Padding(
        padding:  EdgeInsets.only(right: 18.0,top: 25),
        child: Text("كلمة المرور",style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 18,
          color: Colors.black87,
          fontFamily: 'DroidKufi',
        ),),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          visibleIcon,
          customTextFieldWidget(
            type: TextInputType.name,
            ontap: () {},
            wid: 250,
            hei: 40,
            hideShow: _passwordVisible,
            nameController: passController,
            text: "مكونة من 8 أحرف و أرقام", readOnly: false,
          ),
        ],
      ),
    ],
  );

  Widget get visibleIcon => IconButton(
    icon: Icon(
      // Based on passwordVisible state choose the icon
      !_passwordVisible ? Icons.visibility : Icons.visibility_off,
      color: Theme.of(context).primaryColorDark,
    ),
    onPressed: () {
      // Update the state i.e. toogle the state of passwordVisible variable
      setState(() {
        _passwordVisible = !_passwordVisible;
      });
    },
  );

  Widget get _dateApplied => Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      const Padding(
        padding:  EdgeInsets.only(right: 18.0,top: 25),
        child: Text("تاريخ الانضمام",style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 18,
          color: Colors.black87,
          fontFamily: 'DroidKufi',
        ),),
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: setCurrentDate,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(6)),
              child: const Icon(
                Icons.calendar_month,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          const SizedBox(
            width: 2.0,
          ),
          customTextFieldWidget(
            type: TextInputType.name,
            ontap: setCurrentDate,
            wid: 250,
            hei: 40,
            readOnly: true,
            nameController: dateAppliedController,
            text: "تاريخ الانضمام",
          ),
        ],
      ),
    ],
  );

  Widget get _confirmPassword => Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      const Padding(
        padding:  EdgeInsets.only(right: 18.0,top: 25),
        child: Text("تأكيد كلمة المرور",style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 18,
          color: Colors.black87,
          fontFamily: 'DroidKufi',
        ),),
      ),
      customTextFieldWidget(
        type: TextInputType.name,
        ontap: () {},
        wid: 300,
        hei: 40,
        validation: (Val) => passValidation(),
        hideShow: _passwordVisible,
        nameController: confirmPassController,
        text: "", readOnly: false,
      ),
    ],
  );
  void setCurrentDate() {
    setState(() {
      dateAppliedController.text =
          DateFormat('yyyy-MM-dd').format(DateTime.now());
    });
  }

  String? validateEmail(String value) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regex.hasMatch(value)
        ? null
        : "InValid Email, Please enter in Right Form";
  }

  String? passValidation() {
    RegExp regex = RegExp(r'^(.{0,7}|[^0-9]*|[^A-Z]*|[^a-z]*|[a-zA-Z0-9]*)$');
    return !regex.hasMatch(passController.text) &&
        passController.text == confirmPassController.text
        ? null
        : "كلمة المرور خاطئة, الرجاء ادخال كلمة مطابقة و صحيحة";
  }

  Widget studentwidget() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding:  EdgeInsets.only(right: 18.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Text('الأسم الأخير',style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black87,
                fontFamily: 'DroidKufi',
              ),),
            ),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Column(
                children: [
                  textfieldwidget(
                    type: TextInputType.name,
                    ontap: () {},
                    wid: 155,
                    hei: 40,
                    nameController: lastnameController,
                    text: "الأسم الأخير",
                  ),
                ],
              ),
              Column(
                children: [
                  textfieldwidget(
                    type: TextInputType.name,
                    ontap: () {},
                    wid: 155,
                    hei: 40,
                    nameController: thirdnameController,
                    text: "الأسم الثالث",
                  ),
                ],
              ),
              Column(
                children: [
                  textfieldwidget(
                    type: TextInputType.name,
                    ontap: () {},
                    wid: 155,
                    hei: 40,
                    nameController: secondnameController,
                    text: "الأسم الثاني",
                  ),
                ],
              ),
              Column(
                children: [
                  textfieldwidget(
                    type: TextInputType.name,
                    ontap: () {},
                    wid: 155,
                    hei: 40,
                    nameController: firstnameController,
                    text: "الأسم الأول",
                  ),
                ],
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  const Padding(
                    padding:  EdgeInsets.only(right: 18.0,top: 25),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text('العنوان',style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Colors.black87,
                        fontFamily: 'DroidKufi',
                      ),),
                    ),
                  ),
                  textfieldwidget(
                    type: TextInputType.number,
                    ontap: () {},
                    wid: 340,
                    hei: 45,
                    nameController: addressstudentController,
                    text: "العنوان",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Padding(
                    padding:  EdgeInsets.only(right: 18.0,top: 25),
                    child: Text('رقم هويه الطالب',style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Colors.black87,
                      fontFamily: 'DroidKufi',
                    ),),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15, top: 5),
                      child: Container(
                        height: 45,
                        width: 340,
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                          ],
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          onTap: () {},
                          textAlign: TextAlign.right,
                          controller: IDstudentController,
                          obscureText: false,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'DroidKufi',
                            fontSize: 15,
                          ),
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'DroidKufi',
                              fontSize: 15,
                              color:Colors.black38,
                            ),
                            focusedBorder:  OutlineInputBorder(
                                borderSide: BorderSide(color:Colors.black38, width: 2.0),
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1.5, color:Colors.black38),
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            hintText: "رقم هويه الطالب",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                   Padding(
                    padding:  EdgeInsets.only(right: 35.0,top: 25),
                    child: Text('الجنس',style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Colors.black87,
                      fontFamily: 'DroidKufi',
                    ),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: RadioListTile(
                            activeColor: backgreen,
                            title: const Text("ذكر",style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: Colors.black87,
                              fontFamily: 'DroidKufi',
                            )),
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
                              title: const Text("انثى",style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                color: Colors.black87,
                                fontFamily: 'DroidKufi',
                              ),),
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
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Padding(
                    padding:  EdgeInsets.only(right: 18.0,top: 25),
                    child: Text('تاريخ الميلاد',style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Colors.black87,
                      fontFamily: 'DroidKufi',
                    ),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: _pickDate,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(3)),
                          child: const Icon(
                            Icons.calendar_month,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   width: 2.0,
                      // ),
                      textfieldwidget(
                        type: TextInputType.datetime,
                        ontap: () {
                          _pickDate();
                        },
                        nameController: dateinput,
                        wid: 280,
                        hei: 40,
                        text: "تاريخ الميلاد",
                      ),
                    ],
                  ),
                ],
              )

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Padding(
                    padding:  EdgeInsets.only(right: 18.0,top: 25),
                    child: Text('المشكله لديه',style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Colors.black87,
                      fontFamily: 'DroidKufi',
                    ),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: RadioListTile(
                            activeColor: backgreen,
                            title: const Text("سمع",style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: Colors.black87,
                              fontFamily: 'DroidKufi',
                            )),
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
                              title: const Text("نطق",style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                color: Colors.black87,
                                fontFamily: 'DroidKufi',
                              )),
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
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Padding(
                    padding:  EdgeInsets.only(right: 18.0,top: 25),
                    child: Text('رقم هاتف الأهل',style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Colors.black87,
                      fontFamily: 'DroidKufi',
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15, top: 5),
                    child: Container(
                      height: 45,
                      width: 340,
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                        ],
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        onTap: () {},
                        textAlign: TextAlign.right,
                        controller: familyphoneController,
                        obscureText: false,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'DroidKufi',
                          fontSize: 15,
                        ),
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'DroidKufi',
                            fontSize: 15,
                            color:Colors.black38,
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color:Colors.black38, width: 2.0),
                              borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1.5, color:Colors.black38),
                              borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          hintText: "رقم هاتف الأهل",
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _confirmPassword,
              _password,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _dateApplied,
              _email,
            ],
          ),


          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      content: SizedBox(
                          height: 100,
                          width: 100,
                          child: Center(child: CircularProgressIndicator())),
                    );
                  },
                );
                confirmDialog(isTeacher: false);
              },
              child: Container(
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                    color: backgreen, borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    "اضافه طالب",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
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
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
        height: 45,
        width: wid,
        child: TextField(
          keyboardType: type,
          onTap: () {
            ontap();
          },
          textAlign: TextAlign.right,
          controller: nameController,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: 'DroidKufi',
            fontSize: 15,
          ),
          obscureText: false,
          decoration: InputDecoration(
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'DroidKufi',
              fontSize: 15,
              color:Colors.black38,
            ),

            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color:Colors.black38, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1.5, color:Colors.black38),
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            hintText: text,

          ),
        ),
      ),
    );
  }
}
