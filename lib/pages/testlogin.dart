import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/widgets/manage_accounts.dart';
import 'package:flutter_application_1/pages/widgets/societies.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'forgetpass.dart';
import 'mainpage.dart';
import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Characters/characters.dart';
import 'package:flutter_application_1/pages/Profile/teacher_profile.dart';
import 'package:flutter_application_1/pages/chat.dart';
import 'package:flutter_application_1/pages/face.dart';
import 'package:flutter_application_1/pages/result.dart';
import 'package:flutter_application_1/resetpass.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/pages/faceexpl.dart';
import 'package:flutter_application_1/pages/latterexpl.dart';
import 'package:flutter_application_1/pages/voiceexpl.dart';
import 'package:flutter_application_1/scroll.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Profile/profile.dart';
import 'Profile/teacher_profile.dart';
import 'dic.dart';
import 'mainpage.dart';
String TeacherName='';
String image='';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 0;
bool dropOpen = false;
Image? _imageWidget;
// final name = getname(TeacherProfileState().nameController.text);
var list1 = [

  DropdownMenuItem(
    alignment: Alignment.centerRight,
    value: 1,
    child: Text("تدريبات نطق الحروف"),
  ),
  DropdownMenuItem(
    alignment: Alignment.centerRight,
    value: 2,
    child: Text("التدريبات الصوتية"),
  ),
  DropdownMenuItem(
    alignment: Alignment.centerRight,
    value: 3,
    child: Text("تدريبات الوجه"),
  )
];

bool ShowMsg = false;
bool ShowMs = false;
class testlog extends StatefulWidget {
  testlog({Key? key}) : super(key: key);


  @override
  State<testlog> createState() => _testlogState();
}

class _testlogState extends State<testlog> {
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  void initState() {
    _focusNodes.forEach((node){
      node.addListener(() {
       name();

      });
    });
    super.initState();
  }
  bool _visible = false;
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  void _toggle(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();

  // String error = '';
  login()async {
    const url="http://localhost/log.php";

    final response =await http.post(Uri.parse(url),body:{
      "Email":email.text,
      "pass":pass.text,
    });
    var user = json.decode(response.body);

    if (response.statusCode == 200) {
      print(user);
      if (user == "Error") {
        setState((){
          ShowMs=true;
          ShowMsg=false;
        });
        return;
      }
      else {
       final SharedPreferences prefs = await SharedPreferences.getInstance();
        if(user['active'] == 'active') {
          await prefs.setString('userKind',user['Kind']);
          await prefs.setString('userId',user['Id_Num']);
          if (user['Kind'] == 'manager') {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  managepage(),),);
            // print(user['Kind']);
            // print(user['active']);
          } else if (user['Kind'] == 'admin') {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Socieites(),),);
            // print(user['Kind']);
          } else if (user['Kind'] == 'student') {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const mainpage(),),);
            // print(user['Kind']);
          } else {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const mainpage(),),);
            // print(user['Kind']);
          }
        }
        else{
          setState((){
            ShowMsg=true;
            ShowMs=false;
          });
          return;
        }
      }
      setState(() {
        ShowMsg=false;
        ShowMs=false;
      });
    }

  }
  name() async {

      const url="http://localhost/log.php";

      final response =await http.post(Uri.parse(url),body:{
        "Email":email.text,
        "pass":pass.text,
      });
      var user = json.decode(response.body);
      if (user['Kind'] == 'student'){
        await getstuname();
      }
      else if(user['Kind']=='teacher')
      {
        await getteachname();
      }
      else{
        print('بتهون');
      }
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: Column(
        children: [
          Row(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top:15.0,right: 40,bottom: 15),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return  scrollhome();
                      }));
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 50,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('img/loginback.jpeg'),
                  fit: BoxFit.cover,
                )),

            child: Center(
              child: Container(
                width:MediaQuery.of(context).size.width/2.6,
                child: Column(

                  textDirection: TextDirection.rtl,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: _visible,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        //kk
                        child: const LinearProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      "تسجيل الدخول",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "DroidKufi",
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                    // Text("يرجى كتابة البريد الالكتروني الخاص بك هنا",style: TextStyle( fontFamily: "DroidKufi", fontSize: 20,fontWeight: FontWeight.bold)),
                    const SizedBox(height: 100,),
                    Container(

                      decoration: const BoxDecoration(
                        color:  Color.fromRGBO(255, 255, 255, 0.85),
                        borderRadius: BorderRadius.all(Radius.circular(15),
                        ),),
                      child:
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: FadeInLeft(
                                child: TextFormField(
                                  focusNode: _focusNodes[0],
                                  controller: email,
                                  textAlign: TextAlign.right,
                                  decoration:  InputDecoration(
                                    fillColor: Colors.white,
                                    icon: Icon( Icons.email,size: 35,color: _focusNodes[0].hasFocus? Colors.green : Colors.grey),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide(
                                        color: Colors.green,
                                        width: 1.0,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Colors.green,
                                          width: 2.5
                                      ),

                                    ),
                                    // icon: Icon(Icons.email),
                                    hintText: 'البريد الالكتروني',
                                    // labelText: 'Message',
                                    errorBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 1.0,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    String pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regExp = new RegExp(pattern);
                                    if (value!.isEmpty) {
                                      return "يرجى تعبئة حقل البريد الالكتروني ";
                                    } else if (!regExp.hasMatch(value!)) {
                                      return "يرجى ادخال بريد الكتروني صالح";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 30,),
                            Container(
                              decoration: const BoxDecoration(
                                color:  Color.fromRGBO(255, 255, 255, 0.85),
                                borderRadius: BorderRadius.all(Radius.circular(15),
                                ),),
                              child:
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: FadeInRight(
                                  child: TextFormField(
                                    focusNode: _focusNodes[1],
                                    textAlign: TextAlign.right,
                                    obscureText: _obscureText,
                                    controller: pass,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(15))
                                      ),
                                      icon:  Icon(Icons.lock,size: 35,color: _focusNodes[1].hasFocus? Colors.green : Colors.grey,),
                                      hintText: 'كلمة المرور',
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureText ?Icons.visibility_outlined: Icons.visibility_off_outlined  ,
                                          color: _focusNodes[1].hasFocus? Colors.green : Colors.grey,
                                        ),
                                        onPressed: _toggle,

                                      ),
                                      errorBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                          width: 1.0,
                                          style: BorderStyle.solid,
                                        ),

                                      ),

                                      focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                        borderSide: BorderSide(
                                            color: Colors.green,
                                            width: 2.5
                                        ),

                                      ),
                                    ),
                                    validator: (value) {
                                      String patttern = r'(^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$)';
                                      RegExp regExp = new RegExp(patttern);
                                      if (value!.isEmpty) {
                                        return "يرجى تعبئة كلمة المرور ";
                                      }
                                      else if (value.length < 8) {
                                        return "يجب أن لا تقل كلمة المرور عن ستة أرقام";
                                      }

                                      return null;
                                    },

                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 15,),
                    Container(
                      child:        TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return  forgetpassw();
                          }));
                        },
                        child: const Text(
                          "هل نسيت كلمة المرور ؟",
                          style: TextStyle(
                              color: Colors.black87, fontFamily: "DroidKufi"),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40,),
                    Center(
                      child: FadeInUp(
                        child: ElevatedButton(
                          onPressed: ()=>{
                            if (_formKey.currentState!.validate()) {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  _visible = false;
                                }),
                                login(),
    }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            elevation: 2.0,
                            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),),
                          child: const Text("تسجيل الدخول",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "DroidKufi",
                                fontSize: 18.0,
                              )),
                        ),
                      ),

                    ),
                    const SizedBox(height: 30,),
                    Visibility(
                        visible: ShowMsg ,
                        child: Text(" * الحساب الذي تحاول الدخول اليه معطل " ,textDirection: TextDirection.rtl, style: TextStyle(
                          color: Colors.red[900],
                          fontFamily: "DroidKufi",
                        ),)
                    ),
                    Visibility(
                        visible: ShowMs ,
                        child: Text(" * عنوان البريد الالكتروني او كلمة المرور التي ادخلتها غير صالحة " ,textDirection: TextDirection.rtl, style: TextStyle(
                          color: Colors.red[900],
                          fontFamily: "DroidKufi",
                        ),)
                    ),
                    const SizedBox(height: 50,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }

  Future getteachname() async {
    const urll="http://localhost/log.php";

    final responseee =await http.post(Uri.parse(urll),body:{
      "Email":email.text,
      "pass":pass.text,
    });
    var userr = json.decode(responseee.body);
    var url = 'http://localhost/getname.php';
    var response = await http.post(Uri.parse(url), body: {
      "Id_Num":userr['Id_Num'],
    });
    print(userr['Id_Num']);
    var user = json.decode(response.body);

    if (response.statusCode == 200) {
      // print(user);
      if (user == "Error") {
        return 'h';
      }
      else {
        TeacherName= await user['Name']+' '+user['familyname'];
        image=user['image'];
      }
    }
  }
  getstuname() async {
    const urll="http://localhost/log.php";

    final responseee =await http.post(Uri.parse(urll),body:{
      "Email":email.text,
      "pass":pass.text,
    });
    var userr = json.decode(responseee.body);
    var url = 'http://localhost/readdata.php';
    var response = await http.post(Uri.parse(url), body: {
      "Id_Num":userr['Id_Num'],
    });
      print(userr['Id_Num']);
    var user = json.decode(response.body);

    if (response.statusCode == 200) {
      // print(user);
      if (user == "Error") {
        return 'h';
      }
      else {
        //print(user['firstname']+' '+user['familyname']);
        TeacherName = await user['firstname']+' '+user['familyname'];
        image=user['image'];
      }
    }
  }

}

class SelectionButton extends StatefulWidget {
  const SelectionButton({super.key});

  @override
  State<SelectionButton> createState() => SelectionButtonState();

}
class SelectionButtonState extends State<SelectionButton> {
  List list=[];
  var IDController = TextEditingController();
  String? userKind;
  String userId = '';
  getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // setState(() {
    userKind = prefs.getString('userKind') ?? '';
    userId = prefs.getString('userId') ?? '';
    // });
  }
  bool showbtn  (){
    if (userKind == 'teacher'){
      return true;
    }
    // else if(userKind == 'student')
    // {
    //   return false;
    // }
    else
      {
      return false;
      }
  }
  @override
  void initState() {
    super.initState();
    getUserData();
    image=image;
    TeacherName;
    // name();
  }
  // name() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   userKind = prefs.getString('userKind') ?? '';
  //   if (userKind == 'student'){
  //     await getstuname();
  //   }
  //   else if(userKind=='teacher')
  //   {
  //     await getteachname();
  //   }
  //   else{
  //     print('بتهون');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 7.3,
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor:
              MaterialStateColor.resolveWith((states) => Colors.white),
              padding: MaterialStateProperty.all(const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 15.0)),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(25)))),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return  chat(userId: userId, userKind: userKind,);
              }));
            },
            child: const Text(
              "المشاركة والتواصل",
              style: TextStyle(color: blak, fontFamily: "DroidKufi"),
            ),
          ),
          Visibility(
            // visible: showbtn(),
            visible : userKind=='teacher'?true:false,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(left: BorderSide(color: Colors.black12,width: 0.5),right: BorderSide(color: Colors.black12,width: 0.5)),
              ),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                  padding: MaterialStateProperty.all(const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15.0, bottom: 15.0)),
                  shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(0.1)))),
                ),
                onPressed: () {
                  setState(() {
                    _value = 0;
                  });
                  (context as Element).reassemble();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return  result(userId: userId,);
                  }));
                },
                child: const Text(
                  "النتائج والتقدم",
                  style: TextStyle(color: blak, fontFamily: "DroidKufi"),
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                  left: BorderSide(color: Colors.black12, width: 0.5),
                  right: BorderSide(color: Colors.black12, width: 0.5)),
            ),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white),
                padding: MaterialStateProperty.all(const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15.0, bottom: 15.0)),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(0.1)))),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const dic();
                }));
              },
              child: const Text(
                "قاموس لغة الاشارة",
                style: TextStyle(color: blak, fontFamily: "DroidKufi"),
              ),
            ),
          ),
          Container(
            width: 185,
            padding:
            const EdgeInsets.only(left: 0.0, right: 0.0, top: 0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius:
              BorderRadius.only(bottomRight: Radius.circular(0.1)),
            ),
            height: 41,
            child:
            Directionality(
              textDirection: TextDirection.rtl,

              child: DropdownButtonHideUnderline(

                child: DropdownButton2(
                  hint: Row(
                    children: const [
                      Text('قائمة التدريبات', style: TextStyle(
                          decoration: TextDecoration.none,
                          color: blak,
                          fontFamily: "DroidKufi"),),
                    ],
                  ),

                  alignment: Alignment.center ,
                  style: const TextStyle(
                      decoration: TextDecoration.none,
                      color: blak,
                      fontFamily: "DroidKufi"),
                  value: _value == 0 ? null : _value,
                  items: list1,
                  onChanged: (value) {
                    setState(() {
                      _value = value!;
                      switch(value) {
                        case 1: {
                          (context as Element).reassemble();

                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return  latterexp(userId: userId, userKind: userKind,);

                          }));
                        }
                        break;

                        case 2: {
                          (context as Element).reassemble();

                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return  voiceexp(UserID: userId, UserKind: userKind,);

                          }));
                        }
                        break;
                        case 3: {
                          (context as Element).reassemble();

                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return  faceex();

                          }));
                        }
                        break;

                        default: {
                          //statements;
                        }
                        break;
                      }
                    });
                  },



                  // underline:ButtonBar(),
                ),
              ),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor:
              MaterialStateColor.resolveWith((states) => Colors.white),
              padding: MaterialStateProperty.all(const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 15.0)),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(25)))),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const mainpage();
              }));
            },
            child: const Text(
              "الرئيسية",
              style: TextStyle(color: blak, fontFamily: "DroidKufi"),
            ),
          ),
          const Spacer(),
          Directionality(
            textDirection: TextDirection.ltr,
            child: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: const [
                      Icon(
                        Icons.account_box_outlined,
                        color: Colors.black87,
                        size: 20,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "الملف الشخصي",
                        style: TextStyle(
                            fontSize: 14, color: blak, fontFamily: "DroidKufi"),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 3,
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: const [
                      Icon(
                        Icons.settings,
                        color: Colors.black87,
                        size: 20,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "اعدادات كلمة المرور",
                        style: TextStyle(
                            fontSize: 14, color: blak, fontFamily: "DroidKufi"),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: const [
                      Icon(
                        Icons.logout,
                        color: Colors.black87,
                        size: 20,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "الخروج من الموقع",
                        style: TextStyle(
                            fontSize: 14, color: blak, fontFamily: "DroidKufi"),
                      ),
                    ],
                  ),
                )
              ],
              offset: const Offset(0, 35),
              // color: Colors.grey,
              elevation: 2,
              // on selected we show the dialog box
              onSelected: (value) async {
                // if value 1 show dialog
                if (value == 1) {
                  print(userId);
                  print(userKind);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return userKind == 'student'
                        ? personal(userId: userId)
                        : TeacherProfile(
                      userId: userId,
                    );
                  }));
                } else if (value == 2) {
                  // await AuthClient.internal().signOut();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (c) => scrollhome()),
                          (r) => false);
                } else if (value == 3) {
                  // await AuthClient.internal().signOut();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (c) => reset(userId: userId)),
                          (r) => false);
                }
              },

              child: SizedBox(
                width: 185,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:  [
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      TeacherName,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: "DroidKufi"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      // backgroundImage: Image.memory(base64Decode(base64Decode(list[0].['image']))),
                      // child: Image.memory(base64Decode(list[0].image)),
                      child: ClipRRect(child: Image.memory(base64.decode(image)),borderRadius: BorderRadius.circular(20)),
                      radius: 17.7,
                      backgroundColor: Colors.transparent,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6,
                        // vertical: 20
                      ),
                    ),
                    // Image.asset("img/avocado.png",width: 30,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  //
  // Future getteachname() async {
  //   var url = 'http://localhost/getname.php';
  //   var response = await http.post(Uri.parse(url), body: {
  //     "Id_Num":userId,
  //   });
  //   var user = json.decode(response.body);
  //
  //   if (response.statusCode == 200) {
  //     // print(user);
  //     if (user == "Error") {
  //       return 'h';
  //     }
  //     else {
  //       // print(user['Name']+' '+user['familyname']);
  //       TeacherName= await user['Name']+' '+user['familyname'];
  //       image=user['image'];
  //     }
  //   }
  // }
  // getstuname() async {
  //   var url = 'http://localhost/readdata.php';
  //   var response = await http.post(Uri.parse(url), body: {
  //     "Id_Num":userId,
  //   });
  //   var user = json.decode(response.body);
  //
  //   if (response.statusCode == 200) {
  //     // print(user);
  //     if (user == "Error") {
  //       return 'h';
  //     }
  //     else {
  //       //print(user['firstname']+' '+user['familyname']);
  //       TeacherName = await user['firstname']+' '+user['familyname'];
  //       image=user['image'];
  //     }
  //   }
  // }

}
