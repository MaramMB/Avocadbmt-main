import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/forgetpass.dart';
import 'package:flutter_application_1/pages/mainpage.dart';
import 'package:flutter_application_1/pages/mobile/adminmobile.dart';
import 'package:flutter_application_1/pages/mobile/mainmobailepage.dart';
import 'package:flutter_application_1/pages/mobile/managemobile.dart';
import 'package:flutter_application_1/pages/widgets/manage_accounts.dart';
import 'package:flutter_application_1/pages/widgets/societies.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
const backgreen = Color.fromRGBO(131, 190, 99, 1);
bool ShowMsg = false;
bool ShowMs = false;
class mobilelogin extends StatefulWidget {
  mobilelogin({Key? key}) : super(key: key);


  @override
  State<mobilelogin> createState() => _mobileloginState();
}

class _mobileloginState extends State<mobilelogin> {
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];
  void initState() {
    _focusNodes.forEach((node){
      node.addListener(() {
        setState(() {});
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
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  managemobile(),),);
            // print(user['Kind']);
            // print(user['active']);
          } else if (user['Kind'] == 'admin') {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const adminmob(),),);
            // print(user['Kind']);
          } else if (user['Kind'] == 'student') {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const mainmobile(),),);
            // print(user['Kind']);
          } else {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const mainmobile(),),);
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(131, 190, 99, 1),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: backgreen,
    ),

        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              const Text(
                "تسجيل الدخول",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "DroidKufi",
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 18,),
              Container(
                width:MediaQuery.of(context).size.width/1.2,
                decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.green,width: 4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    textDirection: TextDirection.rtl,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
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
                      // const SizedBox(height: 50,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
