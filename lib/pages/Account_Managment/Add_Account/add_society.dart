// ignore_for_file: prefer_final_fields, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/personal.dart';
import 'package:flutter_application_1/pages/widgets/custom_text_field.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import '../../rowbar.dart';

// ignore: constant_identifier_names
enum SingingCharacterGender { Male, Female }

enum SingingCharacterProblem { hear, pron }

class AddScociety extends StatefulWidget {
  const AddScociety({Key? key}) : super(key: key);

  @override
  State<AddScociety> createState() => _AddScocietyState();
}

class _AddScocietyState extends State<AddScociety> {
  String gender = '';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: Column(
        children: [
          const SelectionButton(),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.2,
            width: MediaQuery.of(context).size.width / 1.8,
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
          )
        ],
      ),
    );
  }

<<<<<<< Updated upstream
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
      var url = 'http://localhost/lib/add_student.php';

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
=======
  void confirm() {
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
>>>>>>> Stashed changes
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
        dateController.text == "" ||
        dateAppliedController.text == "" ||
        managerController.text == "") {
      Navigator.of(context, rootNavigator: true).pop();
      msgDialog('الرجاء تعبئه جميع الفراغات');
    } else {
<<<<<<< Updated upstream
      var url = 'http://localhost/lib/add_teacher.php';

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
=======
      var urll = 'http://localhost/donia_code/add_user.php';
>>>>>>> Stashed changes

      var emailValidation = validateEmail(emailController.text);

      if (emailValidation != null) {
        msgDialog(emailValidation);
        return;
      }

      String? passMsg = passValidation();

      if (passMsg != null) {
        msgDialog(passMsg);
        return;
      }

      final req = await http.post(Uri.parse(urll), body: {
        "email": emailController.text,
        "password": passController.text
      });

      var userResponse = jsonDecode(req.body);

      if (userResponse == 'Success') {
        var url = 'http://localhost/donia_code/add_society.php';

        final response = await http.post(
          Uri.parse(url),
          body: {
            "name": nameController.text,
            "Society_Manager": managerController.text,
            "Society_Phone": phoneController.text,
            "Society_Address": addressController.text,
            "Participation_Date": dateController.text,
          },
        );

        var data = jsonDecode(response.body);

        if (data == 'Success') {
          Fluttertoast.showToast(msg: "تم اضافه المعلم بنجاح");
        }
      } else {
        Navigator.of(context, rootNavigator: true).pop();
        // print('fsdsdfs');
      }
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

  Widget societieWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        namefield(field: "اسم الجمعيه"),
        customTextFieldWidget(
          type: TextInputType.name,
          ontap: () {},
          wid: 300,
          hei: 40,
          nameController: nameController,
          text: "أسم الجمعيه",
        ),
        namefield(field: "العنوان"),
        customTextFieldWidget(
          type: TextInputType.name,
          ontap: () {},
          wid: 300,
          hei: 40,
          nameController: addressController,
          text: "العنوان",
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
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              onTap: () {},
              textAlign: TextAlign.right,
              controller: phoneController,
              obscureText: false,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
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
        namefield(field: "تاريخ الجمعيه"),
        customTextFieldWidget(
          type: TextInputType.datetime,
          ontap: () => _pickDate(),
          nameController: dateController,
          wid: 300,
          hei: 40,
          text: "تاريخ الجمعيه",
        ),
        namefield(field: "أسم المدير"),
        customTextFieldWidget(
          type: TextInputType.text,
          ontap: () {},
          wid: 300,
          hei: 40,
          nameController: managerController,
          text: "أسم المدير",
        ),
        _email,
        _password,
        _confirmPassword,
        _dateApplied,
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
              confirm();
            },
            child: Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                  color: backgreen, borderRadius: BorderRadius.circular(10)),
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
        )
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
            nameController: emailController,
            text: "donia@gmail.com :مثال",
          ),
        ],
      );

  Widget get _password => Column(
        children: [
          namefield(field: "كلمة المرور"),
          customTextFieldWidget(
            type: TextInputType.name,
            ontap: () {},
            wid: 300,
            hei: 40,
            nameController: passController,
            text: "مكونة من 8 أحرف و أرقام",
          ),
        ],
      );

  Widget get _dateApplied => Column(
        children: [
          namefield(field: "تاريخ الانضمام"),
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
                nameController: dateAppliedController,
                text: "مكونة من 8 أحرف و أرقام",
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
            nameController: confirmPassController,
            text: "",
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
