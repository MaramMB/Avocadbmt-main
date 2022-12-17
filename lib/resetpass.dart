import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/fade.dart';
import 'package:flutter_application_1/pages/mainpage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



enum Gender{
  Email,
  password,
}
bool ShowMsg = false;
bool ShowMs = false;
class reset extends StatefulWidget {
  const reset({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  State<reset> createState() => _resetState();
}

class _resetState extends State<reset> {
  Color enabled = const Color(0xFF827F8A);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Gender? selected;
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  void initState() {
    _focusNodes.forEach((node){
      node.addListener(() {
        setState(() {
          getpass();
          ShowMsg=false;
          ShowMs=false;
        });
      });
    });
    super.initState();
  }
  bool _visible = false;
  bool _obscureText = true;
  bool _obscureTt = true;
  bool _obscureTe = true;
  final _formKey = GlobalKey<FormState>();
  void _toggle(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  void _togg(){
    setState(() {
     _obscureTe = !_obscureTe;
    });
  }  void _tog(){
    setState(() {
      _obscureTt = !_obscureTt;
    });
  }
  TextEditingController passw=TextEditingController();
  TextEditingController passwrd=TextEditingController();
  TextEditingController pass=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color.fromRGBO(131, 190, 99, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return  mainpage();
                    }));
                  },
            icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 50,
                  color: Colors.white,
            )),
                ),
              ),
              Center(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                        height: MediaQuery.of(context).size.height/1.42,
                        width: MediaQuery.of(context).size.width/2.8,
                    margin: EdgeInsets.only(top:MediaQuery.of(context).size.height/9),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0,left: 25,right: 20),
                      child: Expanded(
                        flex: 1,
                        child: Container(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: he * 0.005,
                                ),
                                // FadeAnimation(delay: 0.8,child: CachedNetworkImage(imageUrl: "https://cdni.iconscout.com/illustration/premium/thumb/job-starting-date-2537382-2146478.png",width: we * 0.6,height: he * 0.2,),),
                                FadeAnimation(
                                  delay: 1,
                                  child: Container(
                                    child: Text("تغيير كلمة المرور",style:TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 32,
                                        // letterSpacing: 2,
                                        fontFamily: "DroidKufi",
                                    ),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: he * 0.008,
                                ),
                                FadeAnimation(
                                  delay: 1,
                                  child: Container(
                                    width: we * 0.9,
                                    height:he * 0.126,
                                    decoration: const BoxDecoration(
                                      color:  Color.fromRGBO(255, 255, 255, 0.85),
                                      borderRadius: BorderRadius.all(Radius.circular(15),
                                      ),),
                                    // decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.circular(20.0),
                                    //     color: selected == Gender.password ? enabled : backgroundColor
                                    // ),
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      focusNode: _focusNodes[0],
                                      textAlign: TextAlign.right,
                                      obscureText: _obscureTe,
                                      controller: passw,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(15))
                                        ),
                                        icon:  Icon(Icons.lock,size: 35,color: _focusNodes[0].hasFocus? Colors.green : Colors.grey,),
                                        hintText: ' كلمة المرور الحالية',
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _obscureTe ?Icons.visibility_outlined: Icons.visibility_off_outlined  ,
                                            color: _focusNodes[0].hasFocus? Colors.green : Colors.grey,
                                          ),
                                          onPressed: _togg,

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
                                          // Fluttertoast.showToast(msg: "تم تعديل بيانات الحساب بنجاح");

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

                                FadeAnimation(
                                  delay: 1,
                                  child: Container(
                                    width: we * 0.9,
                                    height:he * 0.126,
                                    decoration: const BoxDecoration(
                                      color:  Color.fromRGBO(255, 255, 255, 0.85),
                                      borderRadius: BorderRadius.all(Radius.circular(15),
                                      ),),
                                    // decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.circular(20.0),
                                    //     color: selected == Gender.password ? enabled : backgroundColor
                                    // ),
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      focusNode: _focusNodes[1],
                                      textAlign: TextAlign.right,
                                      obscureText: _obscureTt,
                                      controller: passwrd,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(15))
                                        ),
                                        icon:  Icon(Icons.lock,size: 35,color: _focusNodes[1].hasFocus? Colors.green : Colors.grey,),
                                        hintText: ' كلمة المرور الجديدة',
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _obscureTt ?Icons.visibility_outlined: Icons.visibility_off_outlined  ,
                                            color: _focusNodes[1].hasFocus? Colors.green : Colors.grey,
                                          ),
                                          onPressed: _tog,

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

                                FadeAnimation(
                                  delay: 1,
                                  child: Container(
                                    width: we * 0.9,
                                    height:he * 0.126,
                                    decoration: const BoxDecoration(
                                      color:  Color.fromRGBO(255, 255, 255, 0.85),
                                      borderRadius: BorderRadius.all(Radius.circular(15),
                                      ),),
                                    // decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.circular(20.0),
                                    //     color: selected == Gender.password ? enabled : backgroundColor
                                    // ),
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      focusNode: _focusNodes[2],
                                      textAlign: TextAlign.right,
                                      obscureText: _obscureText,
                                      controller: pass,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(15))
                                        ),
                                        icon:  Icon(Icons.lock,size: 35,color: _focusNodes[2].hasFocus? Colors.green : Colors.grey,),
                                        hintText: 'تأكيد كلمة المرور',
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _obscureText ?Icons.visibility_outlined: Icons.visibility_off_outlined  ,
                                            color: _focusNodes[2].hasFocus? Colors.green : Colors.grey,
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
                                        else if (value!=passwrd.text) {
                                          return "كلمة المرور غير متطابقة";
                                        }

                                        return null;
                                      },

                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: he * 0.015,
                                ),
                                FadeAnimation(
                                  delay: 1,
                                  child: TextButton(
                                      onPressed: (){
                                        // _formKey.currentState!.validate();
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            _visible = true;
                                          });
                                          showDialog(context: context, builder: (context)=>AlertDialog(
                                            title: Container(
                                              color: Colors.white,
                                              child: Column(
                                                children: [
                                                  Text('هذا انت متأكد من تغيير كلمة مرورك ؟', style: TextStyle(
                                                    fontFamily: "DroidKufi",
                                                    fontSize: 18,
                                                  ),),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () async {
                                                          Navigator.pop(context);
                                                          updatepass();
                                                          passwrd.text="";
                                                          passw.text="";
                                                          pass.text="";
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
                                                              horizontal: 30, vertical: 5),
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

                                      },
                                      child: Text("ارسال",style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 0.5,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "DroidKufi",
                                      ),),
                                      style:  TextButton.styleFrom(
                                          backgroundColor: Colors.green,
                                          padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 80),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30.0)
                                          )
                                      )
                                  ),
                                ),
                                SizedBox(
                                  height: he * 0.005,
                                ),
                                Visibility(
                                    visible: ShowMsg ,
                                    child: Text(" * كلمة المرور التي ادخلتها غير صالحة " ,textDirection: TextDirection.rtl, style: TextStyle(
                                      color: Colors.red[900],
                                      fontFamily: "DroidKufi",
                                    ),)
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
    getpass() async {
      var url = 'http://localhost/pass.php';
      var response = await http.post(Uri.parse(url), body: {
        "Id_Num":widget.userId,
        "Passward":passw.text,
      });
      var user = json.decode(response.body);

      if (response.statusCode == 200) {
        // print(user);
        if (user == "Error") {
          return 'h';
        }
        else {
            print(user['Passward']);
            if(passw.text!=''){
          if(user['Passward'] != passw.text) {
            setState(() {
              ShowMsg=true;
              ShowMs=false;
            });
          }
          else{
            setState(() {
              ShowMsg=false;
              ShowMs=false;
            });
          }
            }
          else{
            setState(() {
              ShowMsg=false;
              ShowMs=false;
            });
          }

        }
      }

    }
  updatepass() async {
    var url = 'http://localhost/updatepass.php';
    var response = await http.post(Uri.parse(url), body: {
      "Id_Num":widget.userId,
      "Passward":passwrd.text,
    });
    var user = json.decode(response.body);
    if (response.statusCode == 200) {
      // print(user);
      if (user == "Error") {
        return 'h';
      }
      else {
        Fluttertoast.showToast(msg: "تم تحديث كلمة المرور بنجاح");
      }
    }

  }
}