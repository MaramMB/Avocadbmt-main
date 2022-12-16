import 'dart:convert';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/dic.dart';
import 'package:flutter_application_1/pages/mobile/diccmob.dart';
import 'package:flutter_application_1/pages/mobile/homemob.dart';
import 'package:flutter_application_1/resetpass.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/expl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:html' as html;
import 'dart:async';
import 'package:flutter_application_1/pages/models/students.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
var green = HexColor("#7BC155");
const backgreen = Color.fromRGBO(131, 190, 99, 1);
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
class mainmobile extends StatelessWidget {
  const mainmobile({Key? key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom NavBar Demo',
      theme: ThemeData(
        primaryColor: const Color(0xff2F8D46),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: const mobile(),
    );
  }
}

class mobile extends StatefulWidget {
  const mobile({Key? key}) : super(key: key);

  @override
  _mobileState createState() => _mobileState();
}

class _mobileState extends State<mobile> {
  int pageIndex = 0;

  final pages = [
    const Page1(),
    Page3(userId:'20',),
    resultmob(userId: '20',),
    dicmob(),
    reset(userId: '20',),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xffC4DFCB),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
      endDrawer: Directionality(
        textDirection: TextDirection.rtl,
        child: Drawer(
          width: MediaQuery.of(context).size.width/1.8,
          child: ListView(
            // Remove padding
            padding: EdgeInsets.zero,
            children: [
              ExpansionTile(
                trailing: Icon(
                  Icons.keyboard_arrow_down,
                  size: 30.0,
                  color: Colors.black,
                ),
                title: Row(
                  children: [
                    CircleAvatar(
                      child: ClipOval(
                        child: Image.asset(
                          "avocado.png",
                          fit: BoxFit.cover,
                          width: 120,
                          height: 120,
                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      "الاسم",
                      style: TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: "DroidKufi"),
                    ),
                  ],
                ),
                children: <Widget>[
                  ListTile(
                   leading: Icon(Icons.person_outline_rounded,color: Colors.black,size: 40,),
                    title: Text('الملف الشخصي',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: "DroidKufi"),),
                      onTap: () {
                        setState(() {
                          pageIndex = 1;
                          scaffoldKey.currentState!.closeEndDrawer();
                        });
                      }                  ),
                  ListTile(
                    leading: Icon(Icons.settings_rounded,color: Colors.black,size: 40,),
                    title: Text('إعدادات الحساب',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: "DroidKufi"),),
                      onTap: () {
                        setState(() {
                          pageIndex = 4;
                          scaffoldKey.currentState!.closeEndDrawer();
                        });
                      }
                  ),
                ],
              ),
              Divider(),

              ListTile(
                leading: Icon(Icons.home_outlined,color: Colors.black,size: 40,),
                title: Text('الصفحة الرئيسية',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: "DroidKufi"),),
                onTap: () {
                  setState(() {
                    pageIndex = 0;
                    scaffoldKey.currentState!.closeEndDrawer();

                  });
                     }

              ),
              Divider(),
              ExpansionTile(
                trailing: Icon(
                  Icons.keyboard_arrow_down,
                  size: 30.0,
                  color: Colors.black,
                ),
                title: Text('قائمة التدريبات',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: "DroidKufi"),),
                leading: Icon(Icons.track_changes,color: Colors.black,size: 40,),
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.record_voice_over_outlined,color: Colors.black,size: 40,),
                    title: Text('تدريبات نطق الحروف',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: "DroidKufi"),),
                    onTap: () => null,
                  ),
                  ListTile(
                    leading: Icon(Icons.headphones_outlined,color: Colors.black,size: 40,),
                    title: Text('التدريبات الصوتية',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: "DroidKufi"),),
                    onTap: () => null,
                  ),
                  ListTile(
                    leading: Icon(Icons.face_unlock_outlined,color: Colors.black,size: 40,),
                    title: Text('تدريبات الوحه',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: "DroidKufi"),),
                    onTap: () => null,
                  ),
                ],
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.sign_language_outlined,color: Colors.black,size: 40,),
                title: Text('قاموس لغة الاشارة',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: "DroidKufi"),),
                  onTap: () {
                    setState(() {
                      pageIndex = 3;
                      scaffoldKey.currentState!.closeEndDrawer();

                    });
                  }
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.stacked_line_chart_outlined,color: Colors.black,size: 40,),
                title: Text('النتائج والتقدم',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: "DroidKufi"),),
                // onTap: () {
                //   Navigator.of(context)
                //       .push(MaterialPageRoute(builder: (context) {
                //   return  resultmob(userId: '20',);}));
                // },
                  onTap: () {
                    setState(() {
                      pageIndex = 2;
                      scaffoldKey.currentState!.closeEndDrawer();
                    });
                  }
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.people_outline,color: Colors.black,size: 40,),
                title: Text('المجتمع',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: "DroidKufi"),),
                onTap: () => null,
              ),
              Divider(),
              ListTile(
                title: Text('تسجيل الخروج',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: "DroidKufi"),),
                leading: Icon(Icons.exit_to_app,color: Colors.black,size: 40,),
                onTap:(){
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return  scrollmobile();
                  }));
                } ,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      // height: 70,
      decoration: BoxDecoration(
        // color: Theme.of(context).primaryColor,
        color: Colors.white70,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              enableFeedback: false,
              // onPressed: _openEndDrawer,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                Icons.person,
                color: Colors.black,
                size: 45,
              )
                  : const Icon(
                Icons.person_outline,
                color: Colors.black,
                size: 45,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;

                });
              },
              icon: pageIndex == 0
                  ? const Icon(
                Icons.home_filled,
                color: Colors.black,
                size: 45,
              )
                  : const Icon(
                Icons.home_outlined,
                color: Colors.black,
                size: 45,
              ),
            ),

            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  // pageIndex = 1;
                  // Scaffold.of(context).openDrawer();
                  scaffoldKey.currentState!.openEndDrawer();

                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                Icons.menu_rounded,
                color: Colors.black,
                size: 45,
              )
                  : const Icon(
                Icons.menu_outlined,
                color: Colors.black,
                size: 45,
              ),
            ),

          ],
        ),
      ),
    );
  }
}


const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
int _value = 1;
class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String? userKind;
  String userId = '';
  // bool show=false;
  bool showbtn  (){
    if (userKind == 'student'){
      return false;
    }
    else
    {
      return true;
    }
  }
  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userKind = prefs.getString('userKind') ?? '';
      userId = prefs.getString('userId') ?? '';
    });
  }
  void initState() {
    super.initState();
    getUserData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: const Text(
              "الرئيسية",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "DroidKufi",
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.3,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FadeIn(
                              child: const Text("اختبار النطق الأولي",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                      fontFamily: "DroidKufi",
                                      fontWeight: FontWeight.w700)),
                            ),
                            FadeIn(
                              duration: Duration(milliseconds: 800),
                              child: const Text(
                                "هو اختبار يقوم المعلم بعمله للطالب ليستطيع معرفة مدى النطق السليم لدى الطفل  ومعرفة نقاط الضعف لديه حيث يتم عرض عدد من الكلمات ويجب على الطفل نطقها بالشكل الصحيح.",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(fontFamily: "DroidKufi",)

                                ,),
                            ),

                            FadeIn(
                              child: const Text("تدريب نطق الحروف",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                      fontFamily: "DroidKufi",
                                      fontWeight: FontWeight.w700)),
                            ),
                            FadeIn(
                              duration: Duration(milliseconds: 800),
                              child: const Text(
                                  textDirection: TextDirection.rtl,
                                  "في هذا التدريب يقوم الطفل بنطق كلمة معينة لكل حرف ويقوم النظام بمعرفة ما اذا نطق بشكل سليم أم لا ثم يقوم \n بتخزين نتيجة نطق الحروف على حسب مخرجها.",
                                  style: TextStyle(fontFamily: "DroidKufi")),
                            ),

                            FadeIn(
                              child: const Text("التدريبات الصوتية",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                      fontFamily: "DroidKufi",
                                      fontWeight: FontWeight.w700)),
                            ),
                            FadeIn(
                              duration: Duration(milliseconds: 800),
                              child: const Text(
                                  textDirection: TextDirection.rtl,
                                  "يتعرف الطفل على العديد من الاصوات مقسمة \n الى قسمين الاصوات البيئية والاصوات الاستيعابية ثم\n يقوم المعلم أو ولي الامر بعمل اختبار للطفل ",
                                  style: TextStyle(fontFamily: "DroidKufi")),
                            ),
                            FadeIn(
                              child: const Text("تدريبات الوجه",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                      fontFamily: "DroidKufi",
                                      fontWeight: FontWeight.w700)),
                            ),
                            FadeIn(
                              duration: Duration(milliseconds: 800),
                              child: const Text(
                                  textDirection: TextDirection.rtl,
                                  "وهي تدريبات لتحسين حركة الفم والوجه والتي بدورها\n تساعد على نطق الحروف تكون هذه التدريبات على\n شكل مجموعة من الفيديوهات يقوم الطفل بتقليدها",
                                  style: TextStyle(fontFamily: "DroidKufi")),
                            ),
                            FadeIn(
                              child: const Text("التدريبات الصوتية",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                      fontFamily: "DroidKufi",
                                      fontWeight: FontWeight.w700)),
                            ),
                            FadeIn(
                              duration: Duration(milliseconds: 800),
                              child: const Text(
                                  textDirection: TextDirection.rtl,
                                  "يتعرف الطفل على العديد من الاصوات مقسمة الى \nقسمين الاصوات البيئية والاصوات الاستيعابية ثم يقوم\n المعلم أو ولي الامر بعمل اختبار للطفل ",
                                  style: TextStyle(fontFamily: "DroidKufi")),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Visibility(
                              visible: showbtn(),
                              child: Center(
                                child: SlideInUp(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (context) {
                                        return  expage(exid: "1",);
                                      }));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      alignment: Alignment.bottomCenter,
                                      backgroundColor: Colors.green,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                      elevation: 2.0,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 8),
                                    ),
                                    child: const Text("بدأ الاختبار الاولي للنطق",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "DroidKufi",
                                          fontSize: 16.0,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Stack(alignment: Alignment.bottomLeft, children: [
                      FadeInLeft(
                        duration: Duration(milliseconds: 800),
                        child: Image.asset("img/boywavecut.png",
                            alignment: Alignment.bottomLeft,
                            height: MediaQuery.of(context).size.height / 2.5),
                      )
                    ]),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  getResult(String id , String tid) async {
    var url = 'http://localhost/getResult.php';
    var response = await http.post(Uri.parse(url), body: {
      'sid':userId,
      'exid':'1',
    });
    var res = jsonDecode(response.body);
  }
}
class Page3 extends StatefulWidget {
  const Page3({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  State<Page3> createState() => _Page3State();
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
var EcodeController = TextEditingController();


// Booleans for check if edit or view
bool email = true;
bool phone = true;
bool image = true;
bool date = true;

html.File? _cloudFile;
var _fileBytes;
Image? _imageWidget;
bool errCode=false;
bool emailError=false;
String code = '';

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                height: MediaQuery.of(context).size.height / 1.15,
                width: MediaQuery.of(context).size.width / 1.1,
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
                          height: 10,
                        ),
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
                                        3,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                    // mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
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
                                          const Text("سنوات",
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
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 20.0, top: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                        const SizedBox(
                          height: 15,
                        ),
                        Visibility(
                          visible: image && phone && email ? false : true,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () async {
                                if(!email)
                                {
                                  ChangeEmail();

                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return  StatefulBuilder(
                                        builder: (context,setState){
                                          return AlertDialog(
                                            title: Center(
                                              child: Container(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Center(child:
                                                    Text('تم إرسال رمز تحقق الى البريد الالكتروني الجديد',style: TextStyle(fontFamily: 'DroidKufi',fontSize: 15),)),
                                                    Text(' يرجى إدخال الرمز المكون من 6 ارقام لتأكيد البريد الالكتروني',style: TextStyle(fontFamily: 'DroidKufi',fontSize: 15),),
                                                    SizedBox(height: 20,),
                                                    SizedBox(
                                                      width: 200,
                                                      child: Directionality(
                                                        textDirection: TextDirection.rtl,
                                                        child: TextField(
                                                          textDirection: TextDirection.rtl,
                                                          style: TextStyle(
                                                            fontFamily: "DroidKufi",
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                          controller: EcodeController,
                                                          autofocus: true,
                                                          maxLength: 6,
                                                          decoration: InputDecoration(
                                                            hintText: '• • • • •',
                                                            enabledBorder:OutlineInputBorder(
                                                              borderSide: const BorderSide(color: Colors.green, width: 2),
                                                            ),
                                                            border: OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),

                                                    Visibility(
                                                        visible: errCode,
                                                        child: Text('خطأ في رمز التأكيد ! تحقق من الرمز',style: TextStyle(color: Colors.red,fontFamily: 'DroidKufi',fontSize: 15),)),
                                                    SizedBox(height: 10,),
                                                    Visibility(
                                                        visible: emailError,
                                                        child: Text('خطأ ، البريد موجود مسبقاً',style: TextStyle(color: Colors.red,fontFamily: 'DroidKufi',fontSize: 15),)),
                                                    SizedBox(height: 10,),

                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        SizedBox(
                                                          height: 50,
                                                          child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                                              onPressed: (){
                                                                setState(() {
                                                                  errCode = false;
                                                                });
                                                                Navigator.pop(context);

                                                              }, child: Text('الغاء',style: TextStyle(fontFamily: 'DroidKufi'),)),
                                                        ),
                                                        SizedBox(width: 30,),
                                                        SizedBox(
                                                          height: 50,
                                                          child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                                              onPressed: (){
                                                                if (EcodeController.text==code)
                                                                {
                                                                  updateStudent();
                                                                  setState(() {
                                                                    errCode = false;
                                                                  });
                                                                }
                                                                else
                                                                {
                                                                  setState(() {
                                                                    errCode = true;
                                                                  });
                                                                }



                                                              }, child: Text('تأكيد البريد الإلكتروني',style: TextStyle(fontFamily: 'DroidKufi'),)),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },

                                      );
                                    },
                                  );
                                }
                                else
                                {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return  AlertDialog(
                                        content: Text( 'الايميل الذي تحاول إضافته موجود مسبقاً, الرجاء اختيار ايميل اخر'),
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
                                  await updateStudent();

                                }
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
      if (data == 'error') {
        setState(() {
          emailError=true;

        });}
      if (data == 'Success') {
        setState(() {
          email = true;
          phone = true;

        });
        Navigator.of(context, rootNavigator: true).pop();
        Fluttertoast.showToast(msg: "تم تعديل بيانات الطالب بنجاح");
      } else {

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
      var Age = dateController.text.substring(0,4);
      var AgeCalc = DateTime.now().year-int.parse(Age);
      print(AgeCalc);
      ageController.text = AgeCalc.toString();
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
  ChangeEmail()async{
    print(emailController.text);
    var url = 'http://localhost/changeEmail.php';
    var response = await http.post(Uri.parse(url), body :{
      'Email':emailController.text
    });
    var data = await response.body;
    code = data;

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



var SearchController = TextEditingController();
String StName="اسم الطالب";
String problem = "المشكلة";
IconData SearchIcon = Icons.search;
bool isClicked= false;
var  resList;
double firstResult = 0.0;
double spellResult = 0.0;
double beResult = 0.0;
double asResult = 0.0;
double homeAs = 0.0;
double homeBe = 0.0;
int idx=0;
bool studentChoose = false;
var resBe ;
var resAs ;
var resSp;
var resSt;

List<Students> ulist = [];
List<Students> userLists = [];

// void main() => runApp(const MyApp());

class resultmob extends StatefulWidget {
  const resultmob({Key? key, required this.userId}) : super(key: key);
  final String userId;
  @override
  State<resultmob> createState() => _resultmobState();
}
class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class _resultmobState extends State<resultmob> {
  final _debouncer = Debouncer();

  List<Students> ulist = [];
  List<Students> userLists = [];
  TextStyle unselectedAccountTypeTextStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  TextStyle selectedAccountTypeTextStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  var searchBarController = TextEditingController();
  @override
  late  Future <List<Students>?> list;
  void initState() {
    super.initState();
    print('init state');
    ulist = [];
    userLists = [];
    getStudents(widget.userId).then((val) {

      setState(() {
        ulist = val;
        userLists = ulist;
      });
    });
  }

  String query='';



  @override
  Widget build(BuildContext context) {
    if (ulist.isEmpty)
    {
      return Scaffold(
        backgroundColor: green,
        body:Center(
            child: Column(
              children: [
                SizedBox(height: 10,),
                Container(
                  height: MediaQuery.of(context).size.height / 1.25,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Center(
                      child: Column
                        (
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.question_mark_rounded , size: 100, color: Colors.grey,),
                          Text('لم يتم إضافة طلاب ',style: TextStyle( fontFamily: "DroidKufi", fontWeight: FontWeight.bold, fontSize: 30,color: Colors.grey,),),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
        ),
      );
    }
    else
    {
      return Scaffold(
        backgroundColor: backgreen,
        body:  Column(
          children: [

            const SizedBox(
              height: 5,
            ),
            Center(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.12,
                  width: MediaQuery.of(context).size.width / 1.05,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0.0, top: 10),
                    child: Center(
                      child: ListView(

                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(right:8.0),
                            child: Align(
                              alignment:Alignment.topRight ,
                              child: Text('النتائج والتقدم',
                                  style: TextStyle(
                                      color: HexColor("#7BC155"),
                                      fontSize: 25,
                                      fontFamily: "DroidKufi",
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),

                          Directionality(

                            textDirection: TextDirection.rtl,
                            child: Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: RichText(
                                text:  TextSpan(text: 'يمكنك في هذه الصفحة الإطلاع على سجلات التقدم ونتائج الطلاب الذين تشرف عليهم . \nتعرض النتائج المدرسية ',
                                    style: TextStyle(
                                        color: blak,
                                        fontFamily: "DroidKufi",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    children:[
                                      TextSpan(text: 'باللون الأخضر',style: TextStyle(color: HexColor("#7BC155"),fontWeight: FontWeight.w600)),
                                      TextSpan(text: ' أما النتائج البيتية تعرض'),
                                      TextSpan(text: ' باللون الأزرق',style: TextStyle(color: Colors.blue[700], fontWeight: FontWeight.w600),),
                                    ] ),

                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              // color: Colors.black38,
                              height: 420,
                              width: 200,
                              // padding: const EdgeInsets.only(top: 10),
                              child: Stack(
                                fit: StackFit.loose,
                                children: [
                                  Row(
                                    children: [
                                      Spacer(),
                                      Directionality(

                                        textDirection: TextDirection.rtl,
                                        child: SizedBox(
                                          width: 350,
                                          height: 45,
                                          child: TextField(
                                            onChanged: (value){
                                              _debouncer.run(() {
                                                setState(() {
                                                  userLists = ulist
                                                      .where(
                                                        (u) => (u.fname.toLowerCase().contains(
                                                      value.toLowerCase(),
                                                    )),
                                                  )
                                                      .toList();
                                                });
                                              });
                                            },

                                            onTap: (){
                                              setState(() {
                                                if (isClicked){
                                                  isClicked=false;
                                                  SearchIcon=Icons.search;
                                                  SearchController.text='';

                                                }
                                                else{
                                                  isClicked=true;
                                                  SearchIcon=Icons.cancel_outlined;


                                                }
                                              });
                                            },
                                            controller: SearchController,
                                            decoration: InputDecoration(
                                                hintStyle: TextStyle(
                                                  fontFamily: 'Tajawal',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                  borderSide:  BorderSide(color: green , width: 2),

                                                ),
                                                suffixIconColor: green,
                                                suffixIcon: Icon(SearchIcon , color: green,),
                                                hintText: 'ابحث عن طالب ...',
                                                enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(15),
                                                    borderSide:  BorderSide(color: Colors.grey , width: 1.5)

                                                )
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),


                                    ],
                                  ),


                                  Column(
                                    children: [


                                      const SizedBox(height: 60),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(problem,textDirection: TextDirection.rtl, style: TextStyle(fontFamily: "DroidKufi",fontWeight: FontWeight.bold,color: blak),),
                                          Text('مشكلة الطالب : ',textDirection: TextDirection.rtl, style: TextStyle(fontFamily: "DroidKufi",fontWeight: FontWeight.bold,color: HexColor("#7BC155")),),
                                          Spacer(),
                                          Text(StName,textDirection: TextDirection.rtl, style: TextStyle(fontFamily: "DroidKufi",fontWeight: FontWeight.bold,color: blak),),
                                          Text('الاسم : ', textDirection: TextDirection.rtl,style: TextStyle(fontFamily: "DroidKufi",fontWeight: FontWeight.bold,color: HexColor("#7BC155")),),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,

                                        child: Center(
                                          child: Container(

                                            height: 1,
                                            color: Colors.black26,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,

                                                  children: [

                                                    Text('الاختبار الاولي ', style: TextStyle(fontFamily: "DroidKufi",fontWeight: FontWeight.bold,fontSize: 17,color: HexColor("#7BC155")),),
                                                    SizedBox(width: 80,)
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 25,

                                                      decoration: BoxDecoration(
                                                          border: Border.all(color: HexColor("#7BC155"),style: BorderStyle.solid,width: 2),
                                                          borderRadius: BorderRadius.circular(15)
                                                      ),
                                                      child: LinearPercentIndicator(
                                                        animation: true,
                                                        progressColor: HexColor("#7BC155"),
                                                        backgroundColor: Colors.transparent,
                                                        center: Text(studentChoose ? (firstResult*84).toString() : "0"
                                                          ,style: TextStyle(color: blak , fontSize: 12, fontWeight: FontWeight.bold),),// if half or more change color to white
                                                        isRTL: true,

                                                        percent: firstResult,
                                                        lineHeight: 16,
                                                        width: 190,
                                                        barRadius: Radius.circular(10),
                                                      ),
                                                    ),
                                                    SizedBox(width: 5,),
                                                    Text('84'
                                                      , style: TextStyle(fontFamily: "DroidKufi",fontSize: 16,color: Colors.black),),

                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    TextButton(
                                                        onPressed: (){
                                                          if(studentChoose){
                                                            showDialog(context: context, builder: (context)=>AlertDialog(
                                                              title: Column(
                                                                children: [
                                                                  Container(
                                                                    width: 400,
                                                                    child: Text(resSt[0]['note'] , style: TextStyle(
                                                                      fontFamily: "DroidKufi",
                                                                      fontSize: 17,

                                                                    ),),
                                                                  ),
                                                                  ElevatedButton(
                                                                    onPressed: () {
                                                                      Navigator.pop(context);
                                                                    },
                                                                    style: ElevatedButton.styleFrom(
                                                                      backgroundColor: Colors.green,
                                                                      shape: const RoundedRectangleBorder(
                                                                          borderRadius:
                                                                          BorderRadius.all(Radius.circular(10))),
                                                                      elevation: 2.0,
                                                                      padding: const EdgeInsets.symmetric(
                                                                          horizontal: 25, vertical: 5),
                                                                    ),
                                                                    child:  Text( 'العودة',
                                                                        style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontFamily: "DroidKufi",
                                                                          fontSize: 18.0,
                                                                        )),
                                                                  ),
                                                                ],
                                                              ),

                                                            ));
                                                          }else return;

                                                        }
                                                        , child: Text("عرض الأخطاء",style: TextStyle(fontFamily: "DroidKufi",fontSize: 14))),
                                                    SizedBox(width: 30,),
                                                    TextButton(
                                                        onPressed: (){
                                                          if(studentChoose)
                                                          {
                                                            showDialog(context: context, builder: (context)=>AlertDialog(
                                                              title: Container(
                                                                color: Colors.white,
                                                                child: Column(
                                                                  children: [
                                                                    Text('أنت الان على وشك تصفير النتيجة ، هل تريد المتابعة ؟', style: TextStyle(
                                                                      fontFamily: "DroidKufi",
                                                                      fontSize: 20,
                                                                    ),),
                                                                    SizedBox(
                                                                      height: 15,
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: [
                                                                        ElevatedButton(
                                                                          onPressed: () {
                                                                            resetResult(idx.toString(), '1',0);
                                                                            print('gdsgss');
                                                                            SearchController.text='';
                                                                            problem = 'المشكلة';
                                                                            StName="اسم الطالب";
                                                                            setState((){
                                                                              firstResult = 0.0;
                                                                              spellResult = 0.0;
                                                                              beResult = 0.0;
                                                                              asResult = 0.0;
                                                                              homeAs=0.0;
                                                                              homeBe=0.0;
                                                                              studentChoose=false;

                                                                            });

                                                                            Navigator.push(context, MaterialPageRoute (
                                                                              builder: (BuildContext context) => resultmob(userId: widget.userId),
                                                                            ),).then((value) => initState());
                                                                          },
                                                                          style: ElevatedButton.styleFrom(
                                                                            backgroundColor: Colors.green,
                                                                            shape: const RoundedRectangleBorder(
                                                                                borderRadius:
                                                                                BorderRadius.all(Radius.circular(10))),
                                                                            elevation: 2.0,
                                                                            padding: const EdgeInsets.symmetric(
                                                                                horizontal: 25, vertical: 5),
                                                                          ),
                                                                          child:  Text( 'نعم',
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontFamily: "DroidKufi",
                                                                                fontSize: 18.0,
                                                                              )),
                                                                        ),
                                                                        SizedBox(width: 30,),
                                                                        ElevatedButton(
                                                                          onPressed: () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          style: ElevatedButton.styleFrom(
                                                                            backgroundColor: Colors.red,
                                                                            shape: const RoundedRectangleBorder(
                                                                                borderRadius:
                                                                                BorderRadius.all(Radius.circular(10))),
                                                                            elevation: 2.0,
                                                                            padding: const EdgeInsets.symmetric(
                                                                                horizontal: 25, vertical: 5),
                                                                          ),
                                                                          child:  Text( 'لا',
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontFamily: "DroidKufi",
                                                                                fontSize: 18.0,
                                                                              )),
                                                                        ),


                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ));
                                                          }
                                                          else {
                                                            return;
                                                          }
                                                          setState(() {

                                                          });



                                                        }, child: Text("إعادة التعيين",style: TextStyle(fontFamily: "DroidKufi",fontSize: 14))),

                                                  ],
                                                ),

                                              ],
                                            ),
                                            // SizedBox(width: 10,),
                                            Spacer(flex: 1,),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,

                                                  children: [

                                                    Text('نطق الحروف', style: TextStyle(fontFamily: "DroidKufi",fontWeight: FontWeight.bold,fontSize: 17,color: HexColor("#7BC155")),),
                                                    SizedBox(width: 100,)
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 25,

                                                      decoration: BoxDecoration(
                                                          border: Border.all(color: HexColor("#7BC155"),style: BorderStyle.solid,width: 2),
                                                          borderRadius: BorderRadius.circular(15)
                                                      ),
                                                      child: LinearPercentIndicator(
                                                        animation: true,
                                                        progressColor: HexColor("#7BC155"),
                                                        backgroundColor: Colors.transparent,
                                                        center: Text( studentChoose ? (spellResult*28).toString() : "0"
                                                          ,style: TextStyle(color: blak , fontSize: 12, fontWeight: FontWeight.bold),),// if half or more change color to white
                                                        isRTL: true,

                                                        percent: spellResult,
                                                        lineHeight: 16,
                                                        width: 185,
                                                        barRadius: Radius.circular(10),
                                                      ),
                                                    ),
                                                    SizedBox(width: 5),
                                                    Text('28', style: TextStyle(fontFamily: "DroidKufi",fontSize: 16,color: Colors.black),),

                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(width: 50,),
                                                    TextButton(onPressed: (){
                                                      if(studentChoose)
                                                      {
                                                        showDialog(context: context, builder: (context)=>AlertDialog(
                                                          title: Container(
                                                            color: Colors.white,
                                                            child: Column(
                                                              children: [
                                                                Text('أنت الان على وشك تصفير النتيجة ، هل تريد المتابعة ؟', style: TextStyle(
                                                                  fontFamily: "DroidKufi",
                                                                  fontSize: 20,
                                                                ),),
                                                                SizedBox(
                                                                  height: 15,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    ElevatedButton(
                                                                      onPressed: () {
                                                                        resetResult(idx.toString(), '6',0);
                                                                        SearchController.text='';
                                                                        problem = 'المشكلة';
                                                                        StName="اسم الطالب";
                                                                        setState((){
                                                                          firstResult = 0.0;
                                                                          spellResult = 0.0;
                                                                          beResult = 0.0;
                                                                          asResult = 0.0;
                                                                          homeAs=0.0;
                                                                          homeBe=0.0;
                                                                          studentChoose=false;


                                                                        });
                                                                        Navigator.push(context, MaterialPageRoute (
                                                                          builder: (BuildContext context) => resultmob(userId: widget.userId),
                                                                        ),).then((value) => initState());

                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                        backgroundColor: Colors.green,
                                                                        shape: const RoundedRectangleBorder(
                                                                            borderRadius:
                                                                            BorderRadius.all(Radius.circular(10))),
                                                                        elevation: 2.0,
                                                                        padding: const EdgeInsets.symmetric(
                                                                            horizontal: 25, vertical: 5),
                                                                      ),
                                                                      child:  Text( 'نعم',
                                                                          style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontFamily: "DroidKufi",
                                                                            fontSize: 18.0,
                                                                          )),
                                                                    ),
                                                                    SizedBox(width: 30,),
                                                                    ElevatedButton(
                                                                      onPressed: () {
                                                                        Navigator.pop(context);
                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                        backgroundColor: Colors.red,
                                                                        shape: const RoundedRectangleBorder(
                                                                            borderRadius:
                                                                            BorderRadius.all(Radius.circular(10))),
                                                                        elevation: 2.0,
                                                                        padding: const EdgeInsets.symmetric(
                                                                            horizontal: 25, vertical: 5),
                                                                      ),
                                                                      child:  Text( 'لا',
                                                                          style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontFamily: "DroidKufi",
                                                                            fontSize: 18.0,
                                                                          )),
                                                                    ),


                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ));
                                                      }
                                                      else {
                                                        return;
                                                      }
                                                      setState(() {

                                                      });

                                                    }, child: Text("إعادة التعيين",style: TextStyle(fontFamily: "DroidKufi",fontSize: 14))),

                                                  ],
                                                ),

                                              ],
                                            ),




                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,

                                                  children: [

                                                    Text('الاصوات البيئية', style: TextStyle(fontFamily: "DroidKufi",fontWeight: FontWeight.bold,fontSize: 17,color: HexColor("#7BC155")),),
                                                    SizedBox(width: 90,)
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 25,

                                                      decoration: BoxDecoration(
                                                          border: Border.all(color: HexColor("#7BC155"),style: BorderStyle.solid,width: 2),
                                                          borderRadius: BorderRadius.circular(15)
                                                      ),
                                                      child: LinearPercentIndicator(
                                                        animation: true,
                                                        progressColor: HexColor("#7BC155"),
                                                        backgroundColor: Colors.transparent,
                                                        center: Text(studentChoose ? (beResult*20).toString() : "0"
                                                          ,style: TextStyle(color: blak , fontSize: 12, fontWeight: FontWeight.bold),),// if half or more change color to white
                                                        isRTL: true,

                                                        percent: beResult,
                                                        lineHeight: 16,
                                                        width: 185,
                                                        barRadius: Radius.circular(10),
                                                      ),
                                                    ),
                                                    SizedBox(width: 5,),
                                                    Text('20', style: TextStyle(fontFamily: "DroidKufi",fontSize: 16,color: Colors.black),),

                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(width: 80,),
                                                    TextButton(onPressed: (){
                                                      if(studentChoose)
                                                      {
                                                        showDialog(context: context, builder: (context)=>AlertDialog(
                                                          title: Container(
                                                            color: Colors.white,
                                                            child: Column(
                                                              children: [
                                                                Text('أنت الان على وشك تصفير النتيجة ، هل تريد المتابعة ؟', style: TextStyle(
                                                                  fontFamily: "DroidKufi",
                                                                  fontSize: 20,
                                                                ),),
                                                                SizedBox(
                                                                  height: 15,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    ElevatedButton(
                                                                      onPressed: () {
                                                                        resetResult(idx.toString(), '4',0);
                                                                        SearchController.text='';
                                                                        problem = 'المشكلة';
                                                                        StName="اسم الطالب";
                                                                        setState((){
                                                                          firstResult = 0.0;
                                                                          spellResult = 0.0;
                                                                          beResult = 0.0;
                                                                          asResult = 0.0;
                                                                          homeAs=0.0;
                                                                          homeBe=0.0;
                                                                          studentChoose=false;


                                                                        });
                                                                        Navigator.push(context, MaterialPageRoute (
                                                                          builder: (BuildContext context) => resultmob(userId: widget.userId),
                                                                        ),).then((value) => initState());

                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                        backgroundColor: Colors.green,
                                                                        shape: const RoundedRectangleBorder(
                                                                            borderRadius:
                                                                            BorderRadius.all(Radius.circular(10))),
                                                                        elevation: 2.0,
                                                                        padding: const EdgeInsets.symmetric(
                                                                            horizontal: 25, vertical: 5),
                                                                      ),
                                                                      child:  Text( 'نعم',
                                                                          style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontFamily: "DroidKufi",
                                                                            fontSize: 18.0,
                                                                          )),
                                                                    ),
                                                                    SizedBox(width: 30,),
                                                                    ElevatedButton(
                                                                      onPressed: () {
                                                                        Navigator.pop(context);
                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                        backgroundColor: Colors.red,
                                                                        shape: const RoundedRectangleBorder(
                                                                            borderRadius:
                                                                            BorderRadius.all(Radius.circular(10))),
                                                                        elevation: 2.0,
                                                                        padding: const EdgeInsets.symmetric(
                                                                            horizontal: 25, vertical: 5),
                                                                      ),
                                                                      child:  Text( 'لا',
                                                                          style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontFamily: "DroidKufi",
                                                                            fontSize: 18.0,
                                                                          )),
                                                                    ),


                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ));
                                                      }
                                                      else {
                                                        return;
                                                      }
                                                      setState(() {

                                                      });

                                                    }, child: Text("إعادة التعيين",style: TextStyle(fontFamily: "DroidKufi",fontSize: 14))),

                                                  ],
                                                ),

                                              ],
                                            ),
                                            SizedBox(width: 5,),
                                            // Spacer(flex: 1,),

                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,

                                                  children: [

                                                    Text('الاصوات الاستيعابية', style: TextStyle(fontFamily: "DroidKufi",fontWeight: FontWeight.bold,fontSize: 17,color: HexColor("#7BC155")),),

                                                    SizedBox(width: 80,)
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 25,

                                                      decoration: BoxDecoration(
                                                          border: Border.all(color: HexColor("#7BC155"),style: BorderStyle.solid,width: 2),
                                                          borderRadius: BorderRadius.circular(15)
                                                      ),
                                                      child: LinearPercentIndicator(
                                                        animation: true,
                                                        progressColor: HexColor("#7BC155"),
                                                        backgroundColor: Colors.transparent,
                                                        center: Text(studentChoose ? (asResult*20).toString() : "0"
                                                          ,style: TextStyle(color: blak , fontSize: 12, fontWeight: FontWeight.bold),),// if half or more change color to white
                                                        isRTL: true,

                                                        percent: asResult,
                                                        lineHeight: 16,
                                                        width: 185,
                                                        barRadius: Radius.circular(10),
                                                      ),
                                                    ),
                                                    SizedBox(width: 5,),
                                                    Text('20', style: TextStyle(fontFamily: "DroidKufi",fontSize: 16,color: Colors.black),),

                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(width: 80,),
                                                    TextButton(onPressed: (){
                                                      if(studentChoose)
                                                      {
                                                        showDialog(context: context, builder: (context)=>AlertDialog(
                                                          title: Container(
                                                            color: Colors.white,
                                                            child: Column(
                                                              children: [
                                                                Text('أنت الان على وشك تصفير النتيجة ، هل تريد المتابعة ؟', style: TextStyle(
                                                                  fontFamily: "DroidKufi",
                                                                  fontSize: 20,
                                                                ),),
                                                                SizedBox(
                                                                  height: 15,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    ElevatedButton(
                                                                      onPressed: () {
                                                                        resetResult(idx.toString(), '5',0);
                                                                        SearchController.text='';
                                                                        problem = 'المشكلة';
                                                                        StName="اسم الطالب";
                                                                        setState((){
                                                                          firstResult = 0.0;
                                                                          spellResult = 0.0;
                                                                          beResult = 0.0;
                                                                          asResult = 0.0;
                                                                          homeAs=0.0;
                                                                          homeBe=0.0;
                                                                          studentChoose=false;


                                                                        });
                                                                        Navigator.push(context, MaterialPageRoute (
                                                                          builder: (BuildContext context) => resultmob(userId: widget.userId),
                                                                        ),).then((value) => initState());

                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                        backgroundColor: Colors.green,
                                                                        shape: const RoundedRectangleBorder(
                                                                            borderRadius:
                                                                            BorderRadius.all(Radius.circular(10))),
                                                                        elevation: 2.0,
                                                                        padding: const EdgeInsets.symmetric(
                                                                            horizontal: 25, vertical: 5),
                                                                      ),
                                                                      child:  Text( 'نعم',
                                                                          style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontFamily: "DroidKufi",
                                                                            fontSize: 18.0,
                                                                          )),
                                                                    ),
                                                                    SizedBox(width: 30,),
                                                                    ElevatedButton(
                                                                      onPressed: () {
                                                                        Navigator.pop(context);
                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                        backgroundColor: Colors.red,
                                                                        shape: const RoundedRectangleBorder(
                                                                            borderRadius:
                                                                            BorderRadius.all(Radius.circular(10))),
                                                                        elevation: 2.0,
                                                                        padding: const EdgeInsets.symmetric(
                                                                            horizontal: 25, vertical: 5),
                                                                      ),
                                                                      child:  Text( 'لا',
                                                                          style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontFamily: "DroidKufi",
                                                                            fontSize: 18.0,
                                                                          )),
                                                                    ),


                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ));
                                                      }
                                                      else {
                                                        return;
                                                      }
                                                      setState(() {

                                                      });

                                                    }, child: Text("إعادة التعيين",style: TextStyle(fontFamily: "DroidKufi",fontSize: 14))),

                                                  ],
                                                ),

                                              ],
                                            ),




                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0,

                                        child: Center(
                                          child: Container(

                                            height: 1,
                                            color: Colors.black26,
                                          ),
                                        ),
                                      ),

                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,

                                                  children: [

                                                    Text('الاصوات البيئية', style: TextStyle(fontFamily: "DroidKufi",fontWeight: FontWeight.bold,fontSize: 17,color: Colors.blue[500] ),),
                                                    SizedBox(width: 85,)
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 25,

                                                      decoration: BoxDecoration(
                                                          border: Border.all(color: Colors.blue,style: BorderStyle.solid,width: 2),
                                                          borderRadius: BorderRadius.circular(15)
                                                      ),
                                                      child: LinearPercentIndicator(
                                                        animation: true,
                                                        progressColor: Colors.blue[500],
                                                        backgroundColor: Colors.transparent,
                                                        center: Text(studentChoose ? (homeBe*20).toString() : "0"
                                                          ,style: TextStyle(color: blak , fontSize: 12, fontWeight: FontWeight.bold),),// if half or more change color to white
                                                        isRTL: true,

                                                        percent: homeBe,
                                                        lineHeight: 16,
                                                        width: 185,
                                                        barRadius: Radius.circular(10),
                                                      ),
                                                    ),
                                                    SizedBox(width: 5,),
                                                    Text('20', style: TextStyle(fontFamily: "DroidKufi",fontSize: 16,color: Colors.black),),

                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(width: 60,),
                                                    TextButton(onPressed: (){
                                                      if(studentChoose)
                                                      {
                                                        showDialog(context: context, builder: (context)=>AlertDialog(
                                                          title: Container(
                                                            color: Colors.white,
                                                            child: Column(
                                                              children: [
                                                                Text('أنت الان على وشك تصفير النتيجة ، هل تريد المتابعة ؟', style: TextStyle(
                                                                  fontFamily: "DroidKufi",
                                                                  fontSize: 20,
                                                                ),),
                                                                SizedBox(
                                                                  height: 15,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    ElevatedButton(
                                                                      onPressed: () {
                                                                        resetResult(idx.toString(), '4',1);
                                                                        SearchController.text='';
                                                                        problem = 'المشكلة';
                                                                        StName="اسم الطالب";
                                                                        setState((){
                                                                          firstResult = 0.0;
                                                                          spellResult = 0.0;
                                                                          beResult = 0.0;
                                                                          asResult = 0.0;
                                                                          homeAs=0.0;
                                                                          homeBe=0.0;
                                                                          studentChoose=false;


                                                                        });
                                                                        Navigator.push(context, MaterialPageRoute (
                                                                          builder: (BuildContext context) => resultmob(userId: widget.userId),
                                                                        ),).then((value) => initState());

                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                        backgroundColor: Colors.green,
                                                                        shape: const RoundedRectangleBorder(
                                                                            borderRadius:
                                                                            BorderRadius.all(Radius.circular(10))),
                                                                        elevation: 2.0,
                                                                        padding: const EdgeInsets.symmetric(
                                                                            horizontal: 25, vertical: 5),
                                                                      ),
                                                                      child:  Text( 'نعم',
                                                                          style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontFamily: "DroidKufi",
                                                                            fontSize: 18.0,
                                                                          )),
                                                                    ),
                                                                    SizedBox(width: 30,),
                                                                    ElevatedButton(
                                                                      onPressed: () {
                                                                        Navigator.pop(context);
                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                        backgroundColor: Colors.red,
                                                                        shape: const RoundedRectangleBorder(
                                                                            borderRadius:
                                                                            BorderRadius.all(Radius.circular(10))),
                                                                        elevation: 2.0,
                                                                        padding: const EdgeInsets.symmetric(
                                                                            horizontal: 25, vertical: 5),
                                                                      ),
                                                                      child:  Text( 'لا',
                                                                          style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontFamily: "DroidKufi",
                                                                            fontSize: 18.0,
                                                                          )),
                                                                    ),


                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ));
                                                      }
                                                      else {
                                                        return;
                                                      }
                                                      setState(() {

                                                      });

                                                    }, child: Text("إعادة التعيين",style: TextStyle(fontFamily: "DroidKufi",fontSize: 14))),

                                                  ],
                                                ),

                                              ],
                                            ),
                                            // Spacer(flex: 1,),

                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,

                                                  children: [

                                                    Text('الاصوات الاستيعابية', style: TextStyle(fontFamily: "DroidKufi",fontWeight: FontWeight.bold,fontSize: 17,color: Colors.blue[500]),),

                                                    SizedBox(width: 86,)
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 25,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(color: Colors.blue,style: BorderStyle.solid,width: 2),
                                                          borderRadius: BorderRadius.circular(15)
                                                      ),
                                                      child: LinearPercentIndicator(
                                                        animation: true,
                                                        progressColor: Colors.blue[500],
                                                        backgroundColor: Colors.transparent,
                                                        center: Text(studentChoose ? (homeAs*20).toString() : "0"
                                                          ,style: TextStyle(color: blak , fontSize: 12, fontWeight: FontWeight.bold),),// if half or more change color to white
                                                        isRTL: true,

                                                        percent: homeAs,
                                                        lineHeight: 16,
                                                        width: 180,
                                                        barRadius: Radius.circular(10),
                                                      ),
                                                    ),
                                                    SizedBox(width: 5,),
                                                    Text('20', style: TextStyle(fontFamily: "DroidKufi",fontSize: 16,color: Colors.black),),

                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(width: 100,),
                                                    TextButton(onPressed: (){
                                                      if(studentChoose)
                                                      {
                                                        showDialog(context: context, builder: (context)=>AlertDialog(
                                                          title: Container(
                                                            color: Colors.white,
                                                            child: Column(
                                                              children: [
                                                                Text('أنت الان على وشك تصفير النتيجة ، هل تريد المتابعة ؟', style: TextStyle(
                                                                  fontFamily: "DroidKufi",
                                                                  fontSize: 20,
                                                                ),),
                                                                SizedBox(
                                                                  height: 15,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    ElevatedButton(
                                                                      onPressed: () {
                                                                        resetResult(idx.toString(), '5', 1);
                                                                        SearchController.text='';
                                                                        problem = 'المشكلة';
                                                                        StName="اسم الطالب";
                                                                        setState((){
                                                                          firstResult = 0.0;
                                                                          spellResult = 0.0;
                                                                          beResult = 0.0;
                                                                          asResult = 0.0;
                                                                          studentChoose=false;


                                                                        });
                                                                        Navigator.push(context, MaterialPageRoute (
                                                                          builder: (BuildContext context) => resultmob(userId: widget.userId),
                                                                        ),).then((value) => initState());

                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                        backgroundColor: Colors.green,
                                                                        shape: const RoundedRectangleBorder(
                                                                            borderRadius:
                                                                            BorderRadius.all(Radius.circular(10))),
                                                                        elevation: 2.0,
                                                                        padding: const EdgeInsets.symmetric(
                                                                            horizontal: 25, vertical: 5),
                                                                      ),
                                                                      child:  Text( 'نعم',
                                                                          style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontFamily: "DroidKufi",
                                                                            fontSize: 18.0,
                                                                          )),
                                                                    ),
                                                                    SizedBox(width: 10,),
                                                                    ElevatedButton(
                                                                      onPressed: () {
                                                                        Navigator.pop(context);
                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                        backgroundColor: Colors.red,
                                                                        shape: const RoundedRectangleBorder(
                                                                            borderRadius:
                                                                            BorderRadius.all(Radius.circular(10))),
                                                                        elevation: 2.0,
                                                                        padding: const EdgeInsets.symmetric(
                                                                            horizontal: 25, vertical: 5),
                                                                      ),
                                                                      child:  Text( 'لا',
                                                                          style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontFamily: "DroidKufi",
                                                                            fontSize: 18.0,
                                                                          )),
                                                                    ),


                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ));
                                                      }
                                                      else {
                                                        return;
                                                      }
                                                      setState(() {

                                                      });

                                                    }, child: Text("إعادة التعيين",style: TextStyle(fontFamily: "DroidKufi",fontSize: 14))),

                                                  ],
                                                ),

                                              ],
                                            ),




                                          ],
                                        ),
                                      ),


                                    ],
                                  ),
                                  Visibility(
                                    visible: isClicked,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 45 , left: 40),
                                      child: SizedBox(
                                        width: 360,
                                        child: ListView.builder(itemCount: userLists.length,itemBuilder: (BuildContext context, int index)
                                        {
                                          String Fname =userLists[index].fname+' '+userLists[index].sname+' '+userLists[index].tname+' '+userLists[index].lname;
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border(bottom: BorderSide(color: Colors.black26)),
                                            ),
                                            child: Directionality(
                                              textDirection: TextDirection.rtl,
                                              child:ListTile(

                                                onTap: ()async{
                                                  idx=int.parse(userLists[index].stdId);
                                                  print(userLists[index].stdId);
                                                  isClicked = false;
                                                  resAs = await getResult(userLists[index].stdId.toString(),'5');
                                                  resBe = await getResult(userLists[index].stdId.toString(),'4');
                                                  resSt = await getResult(userLists[index].stdId.toString(),'1');
                                                  resSp = await getResult(userLists[index].stdId.toString(),'6');
                                                  firstResult = resSt != null? int.parse(resSt[0]['result'])/84 : 0;
                                                  spellResult = resSp != null? int.parse(resSp[0]['result'])/28 : 0;
                                                  beResult = resBe != null? int.parse(resBe[0]['result'])/20 : 0;
                                                  asResult = resAs != null? int.parse(resAs[0]['result'])/20 : 0;
                                                  homeAs = resAs != null? int.parse(resAs[0]['homeResult'])/20 : 0;
                                                  homeBe = resAs != null? int.parse(resBe[0]['homeResult'])/20 : 0;
                                                  setState(() {

                                                    studentChoose =true;
                                                    SearchController.text = Fname;
                                                    isClicked = false;
                                                    StName = ' '+Fname+' ';
                                                    if(userLists[index].problem=='hear'){
                                                      problem = 'سمع ';
                                                    }
                                                    else
                                                    {
                                                      problem = ' نطق ';

                                                    }

                                                  });
                                                },
                                                leading: ClipOval(child: Image.memory(base64Decode(userLists[index].image), width: 50, height: 50,)),
                                                title: Text(Fname, style: TextStyle(
                                                  color: blak,
                                                  fontFamily: "DroidKufi",
                                                  fontSize: 15,
                                                ),),
                                              ),
                                            ),
                                          );
                                        },),
                                      ),
                                    ),
                                  ),
                                ],

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }


  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
List<Students> parseAgents(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Students>((json) => Students.fromJson(json)).toList();
}

Future<List<Students>> getStudents(String id) async {
  var url = 'http://localhost/getStudents.php';
  try{ var response = await http.post(Uri.parse(url), body: {
    'id':id,
  });
  List<Students> res = parseAgents(response.body);
  return res;
  }catch(e){
    throw Exception(e.toString());
  }
}
getResult(String id , String tid) async {
  var url = 'http://localhost/getResult.php';
  var response = await http.post(Uri.parse(url), body: {
    'sid':id,
    'exid':tid,
  });
  var res = jsonDecode(response.body);

  resList = res;
  return res;

}
resetResult(String id , String tid , int isHome) async {
  var url = 'http://localhost/resetResult.php';
  var response = await http.post(Uri.parse(url), body: {
    'sid':id,
    'exid':tid,
    'home':isHome.toString(),
  });

}



