// ignore_for_file: prefer_final_fields, use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/widgets/custom_text_field.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class AddScociety extends StatefulWidget {
  const AddScociety({Key? key}) : super(key: key);

  @override
  State<AddScociety> createState() => _AddScocietyState();
}

class _AddScocietyState extends State<AddScociety> {
  TextStyle unselectedTypeTextStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  TextStyle selectedTypeTextStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  // Controllers for Teachers
  var nameController = TextEditingController();
  var idController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  var dateController = TextEditingController();
  var managerController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var confirmPassController = TextEditingController();
  var dateAppliedController = TextEditingController();

  var backgreen = const Color.fromRGBO(131, 190, 99, 1);
  var height16 = const SizedBox(height: 16);
  final _form = GlobalKey<FormState>();
  bool _passwordVisible = true;

  @override
  void initState() {
    super.initState();
    setCurrentDate();
    _passwordVisible = true;
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
        body: Column(
          children: [
            // const SelectionButton(),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.1,
                width: MediaQuery.of(context).size.width / 1.6,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _form,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("اضافه جمعيه",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 30,
                                  fontFamily: "DroidKufi",
                                  fontWeight: FontWeight.w700)),
                          const SizedBox(
                            height: 20,
                          ),
                          societieWidget()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void confirm() {
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
                      addSocietie();
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

  void addSocietie() async {
    if (nameController.text == "" ||
        phoneController.text == "" ||
        emailController.text == "" ||
        addressController.text == "" ||
        passController.text == "" ||
        confirmPassController.text == "" ||
        dateAppliedController.text == "" ||
        managerController.text == "") {
      msgDialog('الرجاء تعبئه جميع الفراغات');
    } else {
      var url = 'http://localhost/add_society.php';

      final response = await http.post(
        Uri.parse(url),
        body: {
          "name": nameController.text,
          "sid": idController.text,
          "Society_Manager": managerController.text,
          "email": emailController.text,
          "pass": passController.text,
          "phone": phoneController.text,
          "address": addressController.text,
          "date": dateController.text,
        },
      );

      var data = jsonDecode(response.body);

      if (data == 'Success') {
        clearData();
        Fluttertoast.showToast(msg: "تم اضافة الجمعية بنجاح");
      } else if (data == 'email') {
        msgDialog(
            'الايميل الذي تحاول التسجيل فيه موجود مسبقاً, الرجاء اختيار ايميل اخر');
      } else {
        msgDialog('حدثت مشكلة اثناء اضافة جمعية');
      }
    }
  }

  void clearData() {
    setState(() {
      nameController.clear();
      idController.clear();
      managerController.clear();
      dateController.clear();
      emailController.clear();
      passController.clear();
      confirmPassController.clear();
      phoneController.clear();
    });
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

  Widget societieWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                namefield(field: "اسم الجمعيه"),
                customTextFieldWidget(
                  type: TextInputType.name,
                  ontap: () {},
                  wid: 300,
                  hei: 40,
                  nameController: nameController,
                  text: "أسم الجمعيه",
                  readOnly: false,
                ),
              ],
            ),
            Column(
              children: [
                namefield(field: "رقم الجمعيه"),
                customTextFieldWidget(
                  type: TextInputType.name,
                  ontap: () {},
                  wid: 300,
                  hei: 40,
                  nameController: idController,
                  text: "رقم الجمعيه",
                  readOnly: false,
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
                namefield(field: "العنوان"),
                customTextFieldWidget(
                  type: TextInputType.name,
                  ontap: () {},
                  wid: 300,
                  hei: 40,
                  nameController: addressController,
                  text: "العنوان",
                  readOnly: false,
                ),
              ],
            ),
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
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                namefield(field: "اسم المدير الشخصي"),
                customTextFieldWidget(
                  type: TextInputType.text,
                  ontap: () {},
                  wid: 300,
                  hei: 40,
                  nameController: managerController,
                  text: "اسم المدير الشخصي",
                ),
              ],
            ),
          ],
        ),
        Row(
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
            _dateApplied,
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  final isValid = _form.currentState!.validate();
                  if (!isValid ||
                      confirmPassController.text != passController.text) {
                    return;
                  }

                  confirm();
                },
                child: Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                      color: backgreen,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      "اضافه جمعيه",
                      style: TextStyle(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
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
            text: "bara@gmail.com :مثال",
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
                wid: 250,
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
        children: [
          namefield(field: "تاريخ الانضمام"),
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
        children: [
          namefield(field: "تأكيد كلمة المرور"),
          customTextFieldWidget(
            type: TextInputType.name,
            ontap: () {},
            wid: 300,
            hei: 40,
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

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        dateController.text =
            formattedDate; //set output date to TextField value.
      });
    } else {
      // print("Date is not selected");
    }
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
