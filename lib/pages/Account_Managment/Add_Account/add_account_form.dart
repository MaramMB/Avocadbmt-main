// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/models/person.dart';
import 'package:flutter_application_1/pages/widgets/custom_text_field.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

const backgreen = Color.fromRGBO(131, 190, 99, 1);

enum SingingCharacterStudent { Male, Female }

enum SingingCharacterProblem { hear, pron }

class AddAccountForm extends StatefulWidget {
  final bool isUpdateForm;
  final Person? user;

  const AddAccountForm({Key? key, this.isUpdateForm = false, this.user})
      : super(key: key);

  @override
  State<AddAccountForm> createState() => _AddAccountFormState();
}

class _AddAccountFormState extends State<AddAccountForm> {
  String gender = '';
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

  SingingCharacterStudent get _genderType =>
      widget.user?.gender.name.toLowerCase() == "female"
          ? SingingCharacterStudent.Female
          : SingingCharacterStudent.Male;

  SingingCharacterProblem get _probType => widget.user?.ptype == "hear"
      ? SingingCharacterProblem.hear
      : SingingCharacterProblem.pron;

  @override
  void initState() {
    super.initState();
    widget.isUpdateForm ? setUserData() : setCurrentDate();
    _passwordVisible = true;
  }

  void setUserData() {
    firstnameController.text = widget.user?.name ?? '';
    secondnameController.text = widget.user?.fatherName ?? '';
    thirdnameController.text = widget.user?.grandName ?? '';
    lastnameController.text = widget.user?.familyname ?? '';
    dateinput.text = widget.user?.date ?? '';
    _characterstudent = _genderType;
    pro = _probType;
    addressstudentController.text = widget.user?.address ?? '';
    familyphoneController.text = widget.user?.phoneNumber ?? '';
    emailController.text = widget.user?.email ?? '';
    teatcherIdController = widget.user?.teatcherId ?? '';
    fatherJobController.text = widget.user?.fatherjob ?? '';
    fatherDobController.text = widget.user?.fatherDob ?? '';
    motherNameController.text = widget.user?.motherName ?? '';
  }

  Future<void> _updateSociety() async {
    if (firstnameController.text == "" ||
        secondnameController.text == "" ||
        thirdnameController.text == "" ||
        lastnameController.text == "" ||
        addressstudentController.text == "" ||
        familyphoneController.text == "" ||
        motherNameController.text == "" ||
        fatherDobController.text == "" ||
        fatherJobController.text == "" ||
        emailController.text == "" ||
        dateinput.text == "") {
      msgDialog('الرجاء تعبئه جميع الفراغات');
    } else {
      var url =
          'http://localhost/update_student.php';

      final response = await http.post(
        Uri.parse(url),
        body: {
          "firstname": firstnameController.text,
          "secname": secondnameController.text,
          "thirdname": thirdnameController.text,
          "familyname": lastnameController.text,
          "DOB": dateinput.text,
          "Gender": _characterstudent.toString().split('.').last,
          "Address": addressstudentController.text,
          "phone": familyphoneController.text,
          "Students_Id": widget.user!.id,
          "ptype": pro.toString().split('.').last,
          "email": emailController.text,
          "teatcher_id": teatcherIdController,
          "father_job": fatherJobController.text,
          "father_dob": fatherDobController.text,
          "mother_name": motherNameController.text,
        },
      );

      var data = jsonDecode(response.body);

      if (data == 'Success') {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        clearData();
        Fluttertoast.showToast(msg: "تم تعديل الجمعية بنجاح");
      } else if (data == 'email') {
        msgDialog(
            'الايميل الذي تحاول التسجيل فيه موجود مسبقاً, الرجاء اختيار ايميل اخر');
      } else {
        msgDialog('حدثت مشكلة اثناء تعديل جمعية');
      }
    }
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("اضافه طالب",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 35,
                                  fontFamily: "DroidKufi",
                                  fontWeight: FontWeight.w700)),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 20.0, left: 20),
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
      ),
    );
  }

  addStudent() async {
    if (firstnameController.text == "" ||
        secondnameController.text == "" ||
        thirdnameController.text == "" ||
        lastnameController.text == "" ||
        passController.text == "" ||
        IDstudentController.text == "" ||
        confirmPassController.text == "" ||
        addressstudentController.text == "" ||
        motherNameController.text == "" ||
        fatherDobController.text == "" ||
        fatherJobController.text == "" ||
        emailController.text == "" ||
        familyphoneController.text == "" ||
        dateinput.text == "") {
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
      final SharedPreferences pref = await SharedPreferences.getInstance();
      String? socId = pref.getString('userId');

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
        "teatcher_id": teatcherIdController,
        "Society_Id": socId,
        "father_job": fatherJobController.text,
        "father_dob": fatherDobController.text,
        "mother_name": motherNameController.text,
      };

      final response = await http.post(Uri.parse(url), body: requestBody);

      var data = jsonDecode(response.body);

      if (data == 'Success') {
        clearData();
        Fluttertoast.showToast(
            msg: "تم اضافه الطالب بنجاح", timeInSecForIosWeb: 1);
      } else if (data == 'email') {
        msgDialog(
            'الايميل الذي تحاول التسجيل فيه موجود مسبقاً, الرجاء اختيار ايميل اخر');
      } else {
        msgDialog('حدثت مشكلة اثناء اضافة طالب');
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
                      Navigator.of(context, rootNavigator: true).pop();
                      widget.isUpdateForm ? _updateSociety() : addStudent();
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
  String teatcherIdController = "اختر معلم لهذا الطالب";
  var accountnumberController = TextEditingController();
  var phoneController = TextEditingController();
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
  var motherNameController = TextEditingController();
  var fatherJobController = TextEditingController();
  var parentPhoneController = TextEditingController();

  var passController = TextEditingController();
  var confirmPassController = TextEditingController();
  var dateAppliedController = TextEditingController();
  var fatherDobController = TextEditingController();

  void clearData() {
    setState(() {
      nameController.clear();
      motherNameController.clear();
      fatherJobController.clear();
      parentPhoneController.clear();
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
      teatcherIdController = '';
      confirmPassController.clear();
      phoneController.clear();
    });
  }

  SingingCharacterStudent? _characterstudent = SingingCharacterStudent.Female;
  SingingCharacterProblem? pro = SingingCharacterProblem.hear;
  _pickDate({bool isParent = false}) async {
    int start = isParent ? 1920 : 2000;
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(start),
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        if (!isParent) {
          dateinput.text = formattedDate; //set output date to TextField value.
          return;
        }
        fatherDobController.text = formattedDate;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 18.0, top: 25),
            child: Text(
              "البريد الالكتروني",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black87,
                fontFamily: 'DroidKufi',
              ),
            ),
          ),
          customTextFieldWidget(
            type: TextInputType.name,
            ontap: () {},
            wid: 320,
            hei: 50,
            validation: (Val) => validateEmail(emailController.text),
            nameController: emailController,
            text: "bara@gmail.com :مثال",
            readOnly: false,
          ),
        ],
      );

  Widget get _password => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 18.0, top: 25),
            child: Text(
              "كلمة المرور",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black87,
                fontFamily: 'DroidKufi',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customTextFieldWidget(
                type: TextInputType.name,
                ontap: () {},
                wid: 230,
                hei: 40,
                hideShow: _passwordVisible,
                nameController: passController,
                text: "مكونة من 8 أحرف و أرقام",
                readOnly: false,
              ),
              visibleIcon,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 18.0, top: 25),
            child: Text(
              "تاريخ الانضمام",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black87,
                fontFamily: 'DroidKufi',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customTextFieldWidget(
                type: TextInputType.name,
                ontap: setCurrentDate,
                wid: 240,
                hei: 40,
                nameController: dateAppliedController,
                text: "تاريخ الانضمام",
              ),
              const SizedBox(
                width: 2.0,
              ),
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
            ],
          ),
        ],
      );

  Widget get _confirmPassword => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 18.0, top: 25),
            child: Text(
              "تأكيد كلمة المرور",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black87,
                fontFamily: 'DroidKufi',
              ),
            ),
          ),
          customTextFieldWidget(
            type: TextInputType.name,
            ontap: () {},
            wid: 300,
            hei: 40,
            validation: (Val) => passValidation(),
            hideShow: _passwordVisible,
            nameController: confirmPassController,
            text: "",
            readOnly: false,
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
    // RegExp regex = RegExp(r'^(.{0,7}|[^0-9]*|[^A-Z]*|[^a-z]*|[a-zA-Z0-9]*)$');
    // return !regex.hasMatch(passController.text) &&
    //     passController.text == confirmPassController.text
    //     ? null
    //     : "كلمة المرور خاطئة, الرجاء ادخال كلمة مطابقة و صحيحة";
  }

  Widget studentwidget() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                    nameController: lastnameController,
                    text: "الأسم الأخير",
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          _parentForm,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 18.0, top: 25),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'العنوان',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          color: Colors.black87,
                          fontFamily: 'DroidKufi',
                        ),
                      ),
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
              widget.isUpdateForm
                  ? Container()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 18.0, top: 25),
                          child: Text(
                            'رقم هويه الطالب',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: Colors.black87,
                              fontFamily: 'DroidKufi',
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 15, left: 15, top: 5),
                            child: Container(
                              height: 45,
                              width: 340,
                              child: TextField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9.,]')),
                                ],
                                keyboardType:
                                    const TextInputType.numberWithOptions(
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
                                    color: Colors.black38,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black38, width: 2.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1.5, color: Colors.black38),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 35.0, top: 25),
                    child: Text(
                      'الجنس',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Colors.black87,
                        fontFamily: 'DroidKufi',
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: RadioListTile(
                            activeColor: backgreen,
                            title: const Text("ذكر",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontFamily: 'DroidKufi',
                                )),
                            value: SingingCharacterStudent.Male,
                            groupValue: _characterstudent,
                            selected: _characterstudent ==
                                SingingCharacterStudent.Male,
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
                              title: const Text(
                                "انثى",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontFamily: 'DroidKufi',
                                ),
                              ),
                              value: SingingCharacterStudent.Female,
                              groupValue: _characterstudent,
                              selected: _characterstudent ==
                                  SingingCharacterStudent.Female,
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
              const SizedBox(
                width: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 18.0, top: 25),
                    child: Text(
                      'تاريخ الميلاد',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Colors.black87,
                        fontFamily: 'DroidKufi',
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                    ],
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 18.0, top: 25),
                    child: Text(
                      'المشكله لديه',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Colors.black87,
                        fontFamily: 'DroidKufi',
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: RadioListTile(
                            activeColor: backgreen,
                            title: const Text("سمع",
                                style: TextStyle(
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
                              title: const Text("نطق",
                                  style: TextStyle(
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
              const SizedBox(
                width: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 18.0, top: 25),
                    child: Text(
                      'رقم هاتف الأهل',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Colors.black87,
                        fontFamily: 'DroidKufi',
                      ),
                    ),
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
                            color: Colors.black38,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black38, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1.5, color: Colors.black38),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          hintText: "رقم هاتف الأهل",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          _teacherDropDowList,
          widget.isUpdateForm
              ? Container()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _password,
                    _confirmPassword,
                  ],
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _email,
              widget.isUpdateForm ? Container() : _dateApplied,
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (widget.isUpdateForm) {
                      confirmDialog(isTeacher: false);
                      return;
                    }

                    final isValid = _formKey.currentState!.validate();
                    if (!isValid ||
                        confirmPassController.text != passController.text) {
                      return;
                    }

                    confirmDialog(isTeacher: false);
                  },
                  child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                        color: backgreen,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        widget.isUpdateForm ? "تعديل الطالب" : "اضافه طالب",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: backgreen,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
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
          )
        ],
      ),
    );
  }

  Future<List> getTeachers() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? userId = pref.getString('userId');

    var url =
        'http://localhost/get_teachers.php?id=$userId';
    var response = await http.get(Uri.parse(url));
    var res = jsonDecode(response.body);
    return res;
  }

  Widget get _teacherDropDowList => Column(
        children: [
          namefield(field: "اختر معلم"),
          SizedBox(
            width: 300,
            child: FutureBuilder(
              future: getTeachers(),
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
                  if (snapshot.hasData) {
                    var teachers = snapshot.data;
                    return DropdownButton<String>(
                        hint: Text(teatcherIdController),
                        isExpanded: true,
                        items: List.generate(
                            teachers.length,
                            (index) => DropdownMenuItem(
                                  value: teachers[index]["Id_Num"],
                                  child: Text(
                                    teachers[index]["name"],
                                  ),
                                )),
                        onChanged: (String? newValue) {
                          setState(() {
                            teatcherIdController = newValue ?? '';
                          });
                        });
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
        ],
      );

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

  Widget get _parentForm => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              textfieldwidget(
                type: TextInputType.name,
                ontap: () {},
                wid: 155,
                hei: 40,
                nameController: fatherJobController,
                text: "وظيفة الأب",
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  textfieldwidget(
                    type: TextInputType.datetime,
                    ontap: () {
                      _pickDate(isParent: true);
                    },
                    nameController: fatherDobController,
                    wid: 280,
                    hei: 40,
                    text: " تاريخ ميلاد الأب",
                  ),
                  InkWell(
                    onTap: () => _pickDate(isParent: true),
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
                ],
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
                nameController: motherNameController,
                text: "اسم الأم",
              ),
            ],
          ),
        ],
      );
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
              color: Colors.black38,
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black38, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: Colors.black38),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            hintText: text,
          ),
        ),
      ),
    );
  }
}
