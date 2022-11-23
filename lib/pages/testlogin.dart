import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/widgets/manage_accounts.dart';
import 'package:flutter_application_1/pages/widgets/societies.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'forgetpass.dart';
import 'mainpage.dart';
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
    if (response.statusCode == 200) {
      var user = json.decode(response.body);
      print(user);
      if (user == "Error") {
        setState((){
          ShowMs=true;
          ShowMsg=false;
        });
        return;
      } else {
        if(user['active'] == 'active') {
          if (user['Kind'] == 'manager') {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  managepage(),),);
            print(user['Kind']);
            print(user['active']);
          } else if (user['Kind'] == 'admin') {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Socieites(),),);
            print(user['Kind']);
          } else if (user['Kind'] == 'student') {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const mainpage(),),);
            print(user['Kind']);
          } else {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const mainpage(),),);
            print(user['Kind']);
          }
        }
        else{
          setState((){
            ShowMsg=true;
            ShowMs=false;
          });
          return;
          // Fluttertoast.showToast(
          //   msg: "الحساب الذي تحاول الدخول اليه معطل",
          //   toastLength: Toast.LENGTH_LONG,
          //   // gravity: ToastGravity.CENTER,
          //   timeInSecForIosWeb: 1,
          //   backgroundColor: Colors.red,
          //   textColor: Colors.white70,
          //   fontSize: 30,
          // );
        }
      }
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                        const SizedBox(height: 30,),
                        Container(
                          decoration: const BoxDecoration(
                            color:  Color.fromRGBO(255, 255, 255, 0.85),
                            borderRadius: BorderRadius.all(Radius.circular(15),
                            ),),
                          child:
                          Directionality(
                            textDirection: TextDirection.rtl,
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
                                    _obscureText ? Icons.visibility_off : Icons.visibility,
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
                                else if (value.length < 6) {
                                  return "يجب أن لا تقل كلمة المرور عن ستة أرقام";
                                }
                                // else if (!regExp.hasMatch(value)) {
                                //   return "يجب ان تحتوي كلمة المرور على حر كبير وحرف صغير على الاقل";
                                // }
                                return null;
                              },

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
                        return const forgetpassw();
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

    );
  }
}
