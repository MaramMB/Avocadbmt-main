import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/fade.dart';
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



  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color.fromRGBO(131, 190, 99, 1),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
                  height: MediaQuery.of(context).size.height/1.5,
                  width: MediaQuery.of(context).size.width/3,
              margin: EdgeInsets.only(top:MediaQuery.of(context).size.height/5.5),
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: he * 0.05,
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
                          height: he * 0.04,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: we * 0.9,
                            height:he * 0.071,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: selected == Gender.password ? enabled : backgroundColor
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onTap: (){
                                setState(() {
                                  selected = Gender.password;
                                });
                              },
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border:InputBorder.none,
                                  prefixIcon: Icon(Icons.lock_open_outlined,color: selected == Gender.password ? enabledtxt : deaible,),
                                  suffixIcon: IconButton(
                                    icon: ispasswordev ?  Icon(Icons.visibility_off,color: selected == Gender.password ? enabledtxt : deaible,): Icon(Icons.visibility,color: selected == Gender.password ? enabledtxt : deaible,) ,
                                    onPressed: () => setState(() => ispasswordev = !ispasswordev ),
                                  ),
                                  hintText: 'كلمة المرور',
                                  hintStyle: TextStyle(
                                      color: selected == Gender.password ? enabledtxt : deaible
                                  )
                              ),
                              obscureText: ispasswordev ,
                              style:  TextStyle(color: selected == Gender.password ? enabledtxt : deaible,fontWeight:FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: he * 0.02,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: we * 0.9,
                            height:he * 0.071,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: selected == Gender.password ? enabled : backgroundColor
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onTap: (){
                                setState(() {
                                  selected = Gender.password;
                                });
                              },
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border:InputBorder.none,
                                  prefixIcon: Icon(Icons.lock_open_outlined,color: selected == Gender.password ? enabledtxt : deaible,),
                                  suffixIcon: IconButton(
                                    icon: ispasswordev ?  Icon(Icons.visibility_off,color: selected == Gender.password ? enabledtxt : deaible,): Icon(Icons.visibility,color: selected == Gender.password ? enabledtxt : deaible,) ,
                                    onPressed: () => setState(() => ispasswordev = !ispasswordev ),
                                  ),
                                  hintText: 'كلمة المرور',
                                  hintStyle: TextStyle(
                                      color: selected == Gender.password ? enabledtxt : deaible
                                  )
                              ),
                              obscureText: ispasswordev ,
                              style:  TextStyle(color: selected == Gender.password ? enabledtxt : deaible,fontWeight:FontWeight.bold),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: he * 0.02,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: we * 0.9,
                            height:he * 0.071,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: selected == Gender.password ? enabled : backgroundColor
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onTap: (){
                                setState(() {
                                  selected = Gender.password;
                                });
                              },
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border:InputBorder.none,
                                  prefixIcon: Icon(Icons.lock_open_outlined,color: selected == Gender.password ? enabledtxt : deaible,),
                                  suffixIcon: IconButton(
                                    icon: ispasswordev ?  Icon(Icons.visibility_off,color: selected == Gender.password ? enabledtxt : deaible,): Icon(Icons.visibility,color: selected == Gender.password ? enabledtxt : deaible,) ,
                                    onPressed: () => setState(() => ispasswordev = !ispasswordev ),
                                  ),
                                  hintText: 'كلمة المرور',
                                  hintStyle: TextStyle(
                                      color: selected == Gender.password ? enabledtxt : deaible
                                  )
                              ),
                              obscureText: ispasswordev ,
                              style:  TextStyle(color: selected == Gender.password ? enabledtxt : deaible,fontWeight:FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: he * 0.02,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: TextButton(
                              onPressed: (){},
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
        )
    );
  }}