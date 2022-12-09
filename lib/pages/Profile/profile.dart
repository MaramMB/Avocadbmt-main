import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart' as Path;

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);

class personal extends StatefulWidget {
  const personal({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  State<personal> createState() => _personalState();
}

var emailController = TextEditingController();
var ageController = TextEditingController();
var nameController = TextEditingController();
var fathernameController = TextEditingController();
var genderController = TextEditingController();
var dateboyController = TextEditingController();
var phoneController = TextEditingController();
var dateController = TextEditingController();
var problemController = TextEditingController();
var IDController = TextEditingController();

// Booleans for check if edit or view
bool email = true;
bool phone = true;
bool image = true;
bool date = true;

html.File? _cloudFile;
var _fileBytes;
Image? _imageWidget;

class _personalState extends State<personal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SelectionButton(),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.15,
              width: MediaQuery.of(context).size.width / 1.9,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              // child: Stack(
              //
              // ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Center(
                          child: Text("ملفك الشخصي",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 30,
                                  fontFamily: "DroidKufi",
                                  fontWeight: FontWeight.w700))),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 20.0, top: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.green, width: 5),
                                          borderRadius:
                                          BorderRadius.circular(30)),
                                      child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(25),
                                          child: imagevalue == null
                                              ? Image.asset(
                                            'img/avocado.png',
                                            width: MediaQuery.of(context)
                                                .size
                                                .width /
                                                5.7,
                                            fit: BoxFit.fill,
                                          )
                                              : _image()),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, right: 20),
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              image = false;
                                            });
                                            uploadImage();
                                          },
                                          icon: const Icon(
                                            Icons.camera_alt_rounded,
                                            size: 40,
                                            color: Colors.green,
                                            //colors.transparent
                                          )),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.green, width: 1.5),
                                          borderRadius:
                                          BorderRadius.circular(6)),
                                      child: const Icon(
                                        Icons.alternate_email,
                                        size: 25,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    email
                                        ? Text(
                                      emailController.text,
                                      style: const TextStyle(
                                          decoration: TextDecoration.none,
                                          color: Colors.black87,
                                          fontFamily: "Merienda",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    )
                                        : Padding(
                                      padding: const EdgeInsets.only(
                                          right: 15, left: 15, top: 5),
                                      child: Container(
                                        height: 50,
                                        width: 200,
                                        child: TextField(
                                          textAlign: TextAlign.right,
                                          controller: emailController,
                                          obscureText: false,
                                          decoration:
                                          const InputDecoration(
                                            focusedBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                  Color(0xff34568B),
                                                  width: 2.0),
                                            ),
                                            enabledBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2.0,
                                                  color: backgreen),
                                            ),
                                            hintText: "",
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            email = !email;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: backgreen,
                                          size: 25,
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.green, width: 1.5),
                                          borderRadius:
                                          BorderRadius.circular(6)),
                                      child: const Icon(
                                        Icons.phone,
                                        size: 25,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    phone
                                        ? Text(
                                      phoneController.text,
                                      style: const TextStyle(
                                          decoration: TextDecoration.none,
                                          color: Colors.black87,
                                          fontFamily: "Merienda",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    )
                                        : Padding(
                                      padding: const EdgeInsets.only(
                                          right: 15, left: 15, top: 5),
                                      child: Container(
                                        height: 50,
                                        width: 200,
                                        child: TextField(
                                          textAlign: TextAlign.right,
                                          controller: phoneController,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .allow(RegExp(r'[0-9]'))
                                          ],
                                          obscureText: false,
                                          decoration:
                                          const InputDecoration(
                                            focusedBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                  Color(0xff34568B),
                                                  width: 2.0),
                                            ),
                                            enabledBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2.0,
                                                  color: backgreen),
                                            ),
                                            hintText: "",
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            phone = !phone;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: backgreen,
                                          size: 25,
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   children: [
                                //     Container(
                                //       padding: const EdgeInsets.all(2),
                                //       decoration: BoxDecoration(
                                //           border: Border.all(
                                //               color: Colors.green, width: 1.5),
                                //           borderRadius:
                                //           BorderRadius.circular(6)),
                                //       child: const Icon(
                                //         Icons.person,
                                //         size: 25,
                                //       ),
                                //     ),
                                //     // Card(shape:BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(35),)),color: Colors.green, child: Icon(Icons.phone,size: 28)),
                                //     // Card(shape:Border(left: Border.fromBorderSide(side)), child: Icon(Icons.phone,size: 25)),
                                //
                                //     Text(
                                //       dateController.text,
                                //       style: const TextStyle(
                                //           decoration: TextDecoration.none,
                                //           color: Colors.black87,
                                //           fontFamily: "Merienda",
                                //           fontWeight: FontWeight.w600,
                                //           fontSize: 20),
                                //     ),
                                //   ],
                                // ),
                                // ,child: Image.asset("img/avocado.png",width: MediaQuery.of(context).size.width/4.8,fit:BoxFit.cover,))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  // mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      // textDirection: TextDirection.rtl,
                                      children: [
                                        Text(nameController.text,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                              fontFamily: "DroidKufi",
                                              fontSize: 19.0,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Text(fathernameController.text,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                              fontFamily: "DroidKufi",
                                              fontSize: 19.0,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Text(ageController.text,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                              fontFamily: "DroidKufi",
                                              fontSize: 19.0,
                                            )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text("سنين",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontFamily: "DroidKufi",
                                              fontSize: 19.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Text(genderController.text,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                              fontFamily: "DroidKufi",
                                              fontSize: 19.0,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Text(dateController.text,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                              fontFamily: "DroidKufi",
                                              fontSize: 19.0,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        const Text("",
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontFamily: "DroidKufi",
                                              fontSize: 19.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Text(IDController.text,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                              fontFamily: "DroidKufi",
                                              fontSize: 19.0,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Text(problemController.text,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                              fontFamily: "DroidKufi",
                                              fontSize: 19.0,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: const [
                                        Text(" : الاسم   ",
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontFamily: "DroidKufi",
                                              fontSize: 19.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: const [
                                        Text(" : اسم الأب   ",
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontFamily: "DroidKufi",
                                              fontSize: 19.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: const [
                                        Text(" : العمر   ",
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontFamily: "DroidKufi",
                                              fontSize: 19.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: const [
                                        Text(" : الجنس   ",
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontFamily: "DroidKufi",
                                              fontSize: 19.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: const [
                                        Text(" : تاريخ الميلاد   ",
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontFamily: "DroidKufi",
                                              fontSize: 19.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: const [
                                        Text(" : رقم الهوية   ",
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontFamily: "DroidKufi",
                                              fontSize: 19.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: const [
                                        Text("  : نقاط الضعف   ",
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontFamily: "DroidKufi",
                                              fontSize: 19.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Visibility(
                        visible: image && phone && email ? false : true,
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialog(
                                    content: SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Center(
                                            child:
                                            CircularProgressIndicator())),
                                  );
                                },
                              );

                              await updateStudent();
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
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return true;
    else
      return false;
  }

  Future<void> updateStudent() async {
    if (emailController.text == '' ||
        phoneController.text == '' ||
        validateEmail(emailController.text)) {
      Navigator.of(context, rootNavigator: true).pop();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text('الرجاء اضافه البريد الالكتروني '),
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
      var url = 'http://localhost/edit_student.php';
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          "id": widget.userId,
          "phone": phoneController.text,
          "email": emailController.text
        }),
      );

      var data = jsonDecode(response.body);
      if (data == 'Success') {
        setState(() {
          email = true;
          phone = true;
        });
        Navigator.of(context, rootNavigator: true).pop();
        Fluttertoast.showToast(msg: "تم تعديل بيانات الطالب بنجاح");
      } else {
        Navigator.of(context, rootNavigator: true).pop();
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setControllers();
    getUser();
  }

  getUser() async {
    var url = 'http://localhost/getUsers.php?id=${widget.userId}';

    var response = await http.get(Uri.parse(url));
    var res = jsonDecode(response.body);
    var bytes = base64Decode(res[0]["image"]);
    var ints = bytes.buffer.asUint8List();

    setState(() {
      emailController.text = res[0]["email"] ?? "";
      phoneController.text = res[0]["phone"] ?? "";
      dateController.text = res[0]["dob"] ?? "";
      imagevalue = ints.isEmpty ? null : ints;
      IDController.text = res[0]["student_id"] ?? "";
      nameController.text = res[0]["name"] ?? "";
      ageController.text = res[0]["age"].toString();
      fathernameController.text = res[0]["father_name"] ?? "";
      genderController.text = res[0]["gender"] == "male" ? "ذكر" : "انثى";
      problemController.text =
      res[0]["ptype"] == "hear" ? "مشكله بالسمع" : "مشكله بالنطق";
    });
  }

  Uint8List? imagevalue;

  uploadImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'svg', 'jpeg']);

    if (result != null) {
      PlatformFile file = result.files.first;

      var url = 'http://localhost/uploadImage.php';

      List<int> imageBytes = file.bytes!.toList();
      String Image = base64Encode(imageBytes);

      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          "id": widget.userId,
          "image": Image,
        }),
      );

      var data = jsonDecode(response.body);
      if (data == 'Success') {
        setState(() {
          imagevalue = file.bytes;
        });
      }
    } else {
      // User canceled the picker
      return;
    }
  }

  Widget _image() {
    return Image.memory(
      imagevalue!,
      width: MediaQuery.of(context).size.width / 5.7,
      fit: BoxFit.fill,
    );
  }

  setControllers() {
    setState(() {
      emailController.text = "Avo@gmail.com";
      phoneController.text = " +972 569209948";
      // emailController.text = "Avo@gmail.com";
    });
  }
}
