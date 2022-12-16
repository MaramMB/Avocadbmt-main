// ignore_for_file: unused_local_variable, use_build_context_synchronously, non_constant_identifier_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/models/person.dart';
import 'package:flutter_application_1/pages/widgets/custom_text_field.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/manage_accounts.dart';

enum SingingCharacterTeacher { Male, Female }

const backgreen = Color.fromRGBO(131, 190, 99, 1);

enum SingingCharacterStudent { Male, Female }

enum SingingCharacterProblem { hear, pron }

class AddTeacheAccount extends StatefulWidget {
  final bool isUpdateForm;
  final Person? user;

  const AddTeacheAccount({Key? key, this.isUpdateForm = false, this.user})
      : super(key: key);

  @override
  State<AddTeacheAccount> createState() => _AddTeacheAccountState();
}

class _AddTeacheAccountState extends State<AddTeacheAccount> {
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

  SingingCharacterTeacher get _genderType =>
      widget.user?.gender.name == "female"
          ? SingingCharacterTeacher.Female
          : SingingCharacterTeacher.Male;

  @override
  void initState() {
    super.initState();
    widget.isUpdateForm ? setUserData() : setCurrentDate();
    _passwordVisible = true;
  }

  void setUserData() {
    nameController.text = widget.user?.name ?? '';
    secondnameController.text = widget.user?.fatherName ?? '';
    thirdnameController.text = widget.user?.grandName ?? '';
    lastnameController.text = widget.user?.familyname ?? '';
    _character = _genderType;
    accountnumberController.text = widget.user?.accountNumber ?? '';
    specificController.text = widget.user?.specific ?? '';
    emailController.text = widget.user?.email ?? '';
    phoneController.text = widget.user?.phoneNumber ?? '';
  }

  Future<void> _updateTeatcher() async {
    if (nameController.text == "" ||
        secondnameController.text == "" ||
        thirdnameController.text == "" ||
        lastnameController.text == "" ||
        accountnumberController.text == "" ||
        specificController.text == "" ||
        phoneController.text == "" ||
        emailController.text == "") {
      msgDialog('الرجاء تعبئه جميع الفراغات');
    } else {
      var url =
          'http://localhost/Update_teacher.php';

      final response = await http.post(
        Uri.parse(url),
        body: {
          "Name": nameController.text,
          "secname": secondnameController.text,
          "thirdname": thirdnameController.text,
          "familyname": lastnameController.text,
          "gender": _character.toString().split('.').last,
          "specialization": specificController.text,
          "Phone_Num": phoneController.text,
          "accountnum": accountnumberController.text,
          "Id_Num": widget.user!.id,
          "email": emailController.text,
        },
      );

      var data = jsonDecode(response.body);

      if (data == 'Success') {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        clearData();
        Fluttertoast.showToast(msg: "تم تعديل المعلم بنجاح");
      } else if (data == 'email') {
        msgDialog(
            'الايميل الذي تحاول تحديثه فيه موجود مسبقاً, الرجاء اختيار ايميل اخر');
      } else {
        msgDialog('حدثت مشكلة اثناء تعديل المعلم');
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
                          Text(
                              widget.isUpdateForm ? "تعديل معلم" : "اضافه معلم",
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 35,
                                  fontFamily: "DroidKufi",
                                  fontWeight: FontWeight.w700)),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 20.0, left: 20),
                            child: teacherwidget(),
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

  addTeacher() async {
    if (nameController.text == "" ||
        secondnameController.text == "" ||
        thirdnameController.text == "" ||
        lastnameController.text == "" ||
        accountnumberController.text == "" ||
        phoneController.text == "" ||
        IDTeacherController.text == "" ||
        passController.text == "" ||
        confirmPassController.text == "" ||
        emailController.text == "" ||
        specificController.text == "") {
      msgDialog('الرجاء تعبئه جميع الفراغات');
    } else {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      String? socId = pref.getString('userId');

      var url = 'http://localhost/add_teacher.php';

      final response = await http.post(
        Uri.parse(url),
        body: {
          "Name": nameController.text,
          "secname": secondnameController.text,
          "thirdname": thirdnameController.text,
          "familyname": lastnameController.text,
          "gender": _character.toString().split('.').last,
          "specialization": specificController.text,
          "Phone_Num": phoneController.text,
          "accountnum": accountnumberController.text,
          "Id_Num": IDTeacherController.text,
          "Society_Id": socId,
          "email": emailController.text,
          "password": passController.text,
        },
      );

      var data = jsonDecode(response.body);

      if (data == 'Success') {
        clearData();
        Fluttertoast.showToast(msg: "تم اضافه المعلم بنجاح");
      } else if (data == 'email') {
        msgDialog(
            'الايميل الذي تحاول التسجيل فيه موجود مسبقاً, الرجاء اختيار ايميل اخر');
      } else {
        msgDialog('حدثت مشكلة اثناء اضافة معلم');
      }
    }
  }

  void clearData() {
    setState(() {
      nameController.clear();
      secondnameController.clear();
      thirdnameController.clear();
      lastnameController.clear();
      dateinput.clear();
      accountnumberController.clear();
      emailController.clear();
      specificController.clear();
      dateAppliedController.clear();
      IDTeacherController.clear();
      passController.clear();
      confirmPassController.clear();
      phoneController.clear();
    });
  }

  // Controllers for Teachers
  var nameController = TextEditingController();
  var IDTeacherController = TextEditingController();
  var accountnumberController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var specificController = TextEditingController();
  var dateinput = TextEditingController();
  var passController = TextEditingController();
  var confirmPassController = TextEditingController();
  var dateAppliedController = TextEditingController();
  var secondnameController = TextEditingController();
  var thirdnameController = TextEditingController();
  var lastnameController = TextEditingController();

  SingingCharacterTeacher? _character = SingingCharacterTeacher.Female;

  Widget teacherwidget() {
    return Form(
      key: _formKey,
      child: Column(
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
                    nameController: nameController,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.isUpdateForm
                  ? Container()
                  : Column(
                      children: [
                        namefield(field: "رقم الهويه"),
                        textfieldwidget(
                          type: TextInputType.name,
                          ontap: () {},
                          wid: 300,
                          hei: 40,
                          nameController: IDTeacherController,
                          text: "رقم الهويه",
                        ),
                      ],
                    ),
              Column(
                children: [
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
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        onTap: () {},
                        textAlign: TextAlign.right,
                        controller: accountnumberController,
                        obscureText: false,
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
                          hintText: "رقم الحساب",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
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
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        onTap: () {},
                        textAlign: TextAlign.right,
                        controller: phoneController,
                        obscureText: false,
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
                          hintText: "رقم الهاتف",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  namefield(field: "التخصص"),
                  textfieldwidget(
                    type: TextInputType.text,
                    ontap: () {},
                    wid: 300,
                    hei: 40,
                    nameController: specificController,
                    text: "التخصص",
                  ),
                ],
              ),
            ],
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
                    title: const Text("ذكر"),
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
                      title: const Text("انثى"),
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
          widget.isUpdateForm
              ? Container()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _password,
                    _confirmPassword,
                  ],
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                      confirmDialog();
                      return;
                    }
                    final isValid = _formKey.currentState!.validate();
                    if (!isValid ||
                        confirmPassController.text != passController.text) {
                      return;
                    }
                    confirmDialog();
                  },
                  child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                        color: backgreen,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        widget.isUpdateForm ? "تعديل معلم" : "اضافه معلم",
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => managepage()));
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

  void confirmDialog() {
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
                      widget.isUpdateForm ? _updateTeatcher() : addTeacher();
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
        children: [
          namefield(field: "البريد الالكتروني"),
          customTextFieldWidget(
            type: TextInputType.name,
            ontap: () {},
            wid: 300,
            hei: 40,
            validation: (Val) => validateEmail(emailController.text),
            nameController: emailController,
            text: "مثال : rakan@gmail.com ",
            readOnly: false,
          ),
        ],
      );

  Widget get _password => Column(
        children: [
          namefield(field: "كلمة المرور"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customTextFieldWidget(
                type: TextInputType.name,
                ontap: () {},
                wid: 240,
                hei: 35,
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
        children: [
          namefield(field: "تاريخ الانضمام"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customTextFieldWidget(
                type: TextInputType.name,
                ontap: setCurrentDate,
                wid: 250,
                hei: 35,
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
        children: [
          namefield(field: "تأكيد كلمة المرور"),
          customTextFieldWidget(
            type: TextInputType.name,
            ontap: () {},
            wid: 300,
            hei: 35,
            hideShow: _passwordVisible,
            validation: (Val) => passValidation(),
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
    RegExp regex = RegExp(r'^(.{0,7}|[^0-9]|[^A-Z]|[^a-z]|[a-zA-Z0-9])$');
    return !regex.hasMatch(passController.text) &&
            passController.text == confirmPassController.text
        ? null
        : "كلمة المرور خاطئة, الرجاء ادخال كلمة مطابقة و صحيحة";
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
        height: 40,
        width: wid,
        child: TextField(
            keyboardType: type,
            onTap: () {
              ontap();
            },
            textAlign: TextAlign.right,
            controller: nameController,
            obscureText: false,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'DroidKufi',
              fontSize: 15,
            ),
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
            )),
      ),
    );
  }
}
