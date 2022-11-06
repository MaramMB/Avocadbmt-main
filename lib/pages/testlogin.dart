import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/logindb.dart';
import 'package:http/http.dart' as http;
// import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'forgetpass.dart';
import 'mainpage.dart';
  bool _passwordInVisible = true;
class testlog extends StatefulWidget {
  testlog({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<testlog> createState() => _testlogState();
}

class _testlogState extends State<testlog> {
  late TextEditingController emailInputController;
  late TextEditingController pwdInputController;
  late String email;
  bool _visible = false;
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  void _toggle(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    super.initState();
  }
  var userlist=[
     useracc(email: "mmb@gmail.com", passward: "12345678", type: userType.manager),
     useracc(email: "bara@gmail.com", passward: "12345678", type: userType.admin),
     useracc(email: "tasneem@gmail.com", passward: "12345678", type: userType.teacher),
     useracc(email: "donia@gmail.com", passward: "12345678", type: userType.student),
  ];

  // void validateLogin(){
  //   if(_formKey.currentState.validate()){
  //     _formKey.currentState.save();
  //     if(_emailID == _email && _password == _pass){
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
  //     }
  //   }
  // }
  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return "";
    }
  }



  Future userLogin() async {
    var url = "http://192.168.1.1/avocadbmt/login.php";
    
    // Showing LinearProgressIndicator.
    setState(() {
      _visible = true;
    });

    // Getting username and password from Controller
    var data = {
      'username': emailInputController.text,
      'password': pwdInputController.text,
    };

    //Starting Web API Call.
    var response = await http.post(Uri.parse(url), body: json.encode(data));
    // var response = await http.get(url);
    if (response.statusCode == 200) {
      //Server response into variable
      print(response.body);
      var msg = jsonDecode(response.body);
      if (msg['loginStatus'] == true) {
        setState(() {
          _visible = false;
        });
        Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const mainpage();
                      })
                      );
      } else {
        setState(() {
          _visible = false;
          //Show Error Message Dialog
          showMessage(msg["message"]);
        });
      }
    } else {
      setState(() {
        _visible = false;

        //Show Error Message Dialog
        showMessage("Error during connecting to Server.");
      });
    }
  }
  Future<dynamic> showMessage(String msg) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(msg),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  // final _formKey = GlobalKey<FormState>();
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
                            controller: emailInputController,
                            textAlign: TextAlign.right,
                            decoration:  const InputDecoration(
                              fillColor: Colors.white,
                              icon: Icon(Icons.email,size: 35,),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: Colors.green,
                                    width: 2.5
                                ),

                              ),
                              // icon: Icon(Icons.email),
                              hintText: 'البريد الالكتروني',
                              // labelText: 'Message',
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'يرجى تعبئة حقل البريد الالكتروني ';
                              }
                              if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                                return 'يرجى ادخال بريد الكتروني صالح';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
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
                    child: TextFormField(
                      textAlign: TextAlign.right,
                      obscureText: _obscureText,
                      controller: pwdInputController,
                      // validator: pwddValidator,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please Enter Password';
                      //   }
                      //   return null;
                      // },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          // addError(error: kPassNullError);
                          return "يرجى ادخال كلمة المرور";
                        } else if (value.length < 8) {
                          // addError(error: kShortPassError);
                          return "يرجى ادخال كلمة مرور اطول";
                        }
                        return null;
                      },
                      decoration: InputDecoration(

                        fillColor: Colors.white,

                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        icon: const Icon(Icons.lock,size: 35,),
                        hintText: 'كلمة المرور',
                        suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: _toggle,
                            ),

                        // suffixIcon: Icon(Icons.remove_red_eye),
                        // labelText: 'Message',

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
                      setState(() {
                           _visible = false;
                                  }),

                        }
                        else{
                          const Text("Not Found The Account"),
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
                const SizedBox(height: 90,),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
