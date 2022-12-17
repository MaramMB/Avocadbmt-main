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
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;
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
              Row(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top:15.0,right: 40,bottom: 15),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return  mainpage();
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
              Center(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                        height: MediaQuery.of(context).size.height/1.45,
                        width: MediaQuery.of(context).size.width/2.8,
                    margin: EdgeInsets.only(top:MediaQuery.of(context).size.height/8),
                    child: Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: he * 0.03,
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
                                height: he * 0.01,
                              ),
                              FadeAnimation(
                                delay: 1,
                                child: Container(
                                  width: we * 0.9,
                                  height:he * 0.101,
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
                                      hintText: 'كلمة المرور',
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
                              SizedBox(
                                height: he * 0.01,
                              ),
                              FadeAnimation(
                                delay: 1,
                                child: Container(
                                  width: we * 0.9,
                                  height:he * 0.101,
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
                                      hintText: 'كلمة المرور',
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
                              SizedBox(
                                height: he * 0.01,
                              ),
                              FadeAnimation(
                                delay: 1,
                                child: Container(
                                  width: we * 0.9,
                                  height:he * 0.101,
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
                                      hintText: 'كلمة المرور',
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

                                      return null;
                                    },

                                  ),
                                ),
                              ),
                              SizedBox(
                                height: he * 0.02,
                              ),
                              FadeAnimation(
                                delay: 1,
                                child: TextButton(
                                    onPressed: (){
                                    //   if (_formKey.currentState!.validate()) {
                                    // }
                                      if(Form.of(context)?.validate()?? false){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>mainpage()));
                                      }
                                      else
                                        {
                                       Fluttertoast.showToast(msg: 'يرجى تعبئة كلمة المرور');
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
                                height: he * 0.01,
                              ),

                            ],
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
  }}