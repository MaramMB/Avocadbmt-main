// ignore_for_file: prefer_final_fields, use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/models/person.dart';
import 'package:flutter_application_1/pages/widgets/custom_text_field.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class AddScociety extends StatefulWidget {
  final bool isUpdateForm;
  final Person? user;

  const AddScociety({Key? key, this.isUpdateForm = false, this.user})
      : super(key: key);

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
    widget.isUpdateForm ? setUserData() : setCurrentDate();
    _passwordVisible = true;
  }

  void setUserData() {
    nameController.text = widget.user?.name ?? '';
    phoneController.text = widget.user?.phoneNumber ?? '';
    addressController.text = widget.user?.address ?? '';
    managerController.text = widget.user?.managerName ?? '';
    emailController.text = widget.user?.email ?? '';
  }

  Future<void> _updateSociety() async {
    if (nameController.text == "" ||
        phoneController.text == "" ||
        emailController.text == "" ||
        addressController.text == "" ||
        managerController.text == "") {
      msgDialog('الرجاء تعبئه جميع الفراغات');
    } else {
      var url =
          'http://localhost/update_society.php';

      final response = await http.post(
        Uri.parse(url),
        body: {
          "name": nameController.text,
          "sid": widget.user!.id,
          "manager": managerController.text,
          "email": emailController.text,
          "phone": phoneController.text,
          "address": addressController.text,
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
        msgDialog('حدثت مشكلة اثناء تعديل بيانات جمعية');
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
                          Text(
                              widget.isUpdateForm
                                  ? "تعديل الجمعية"
                                  : "اضافه جمعيه",
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 30,
                                  fontFamily: "DroidKufi",
                                  fontWeight: FontWeight.w700)),

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
                    onTap: () async {
                      Navigator.of(context, rootNavigator: true).pop();
                      if (widget.isUpdateForm) {
                        await _updateSociety();
                        return;
                      }
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
      addressController.clear();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 18.0, top: 25),
                  child: Text(
                    "اسم الجمعيه",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
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
                  nameController: nameController,
                  text: "أسم الجمعيه",
                  readOnly: false,
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
                    "رقم الترخيص",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
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
                        nameController: idController,
                        text: "رقم الترخيص",
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 18.0, top: 25),
                  child: Text(
                    "العنوان",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
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
                  nameController: addressController,
                  text: "العنوان",
                  readOnly: false,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 18.0, top: 25),
                  child: Text(
                    "رقم الهاتف",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black87,
                      fontFamily: 'DroidKufi',
                    ),
                  ),
                ),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 18.0, top: 25),
                  child: Text(
                    "اسم المدير الشخصي",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black87,
                      fontFamily: 'DroidKufi',
                    ),
                  ),
                ),
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
                onTap: () async {
                  final isValid = _form.currentState!.validate();
                  if (!isValid ||
                      confirmPassController.text != passController.text) {
                    return;
                  }

                  confirm();
                },
                child: Container(
                  width: 140,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      widget.isUpdateForm ? "تعديل الجمعية" : "اضافه جمعيه",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: "DroidKufi",
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
                  backgroundColor: Colors.green,
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
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
          const Padding(
            padding: EdgeInsets.only(right: 18.0, top: 25),
            child: Text(
              "البريد الالكتروني",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
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
            validation: (Val) => validateEmail(emailController.text),
            nameController: emailController,
            text: "مثال : rakan@gmail.com ",
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
            fontWeight: FontWeight.w600,
            fontSize: 16,
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
                wid: 250,
                hei: 40,
                hideShow: _passwordVisible,
                nameController: passController,
                text: "مكونة من 8 أحرف و أرقام",
                readOnly: false,
                validation: (value) {
                  String patttern = r'(^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$)';
                  RegExp regExp = new RegExp(patttern);
                  if (value!.isEmpty) {
                    return "يرجى تعبئة كلمة المرور ";
                  }
                  else if (value.length < 8) {
                    return "يجب أن لا تقل كلمة المرور عن ثمانية أرقام او حروف";
                  }

                  return null;
                },
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
            fontWeight: FontWeight.w600,
            fontSize: 16,
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
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(right: 18.0, top: 25),
        child: Text(
          "تأكيد كلمة المرور",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
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
