import 'dart:html';
import 'dart:convert';

import 'package:auto_reload/auto_reload.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/testlogin.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/expl.dart';
import 'package:flutter_application_1/pages/faceexpl.dart';
import 'package:flutter_application_1/pages/latervideo.dart';
import 'package:flutter_application_1/pages/latterexpl.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/speaktest.dart';
import 'package:flutter_application_1/pages/voiceexpl.dart';
import 'package:shared_preferences/shared_preferences.dart';


const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;
int point=0;
int groupCount=0;
class letterss extends StatefulWidget {
  late String L1,L2,L3,L4,L5,title;
  final String userId;// L = letter
  final String? UserKind;
  letterss({
    required this.L1,
    required this.L2,
    required this.L3,
    required this.L4,
    required this.L5,
    required this.title, required this.userId,  required this.UserKind,
  });
  @override
  State<letterss> createState() => _letterssState();
}

class _letterssState extends State<letterss> {
  String? userKind;
  String userId = '';

  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userKind = prefs.getString('userKind') ?? '';
      userId = prefs.getString('userId') ?? '';
    });
  }

  Future<List<dynamic>?> getData() async{
    var url = 'http://localhost/getSpell.php';
    http.Response response = await http.post(Uri.parse(url),body: {
      'id':widget.userId,
    });
    var data = jsonDecode(response.body);
    for ( var i=0 ; i<data.length;i++ )
    {
      if (data[i]['letter']==widget.L1 || data[i]['letter']==widget.L2|| data[i]['letter']==widget.L3|| data[i]['letter']==widget.L4|| data[i]['letter']==widget.L5)
        {
          groupCount++;
         if (data[i]['result']=='true')
           {
             point++;
           }
         print(widget.L1+widget.L2+widget.L3+widget.L4);
        }

    }
    print(data.toString());
    return data;

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
    });
  }
  initState()
  {
  super.initState;
  getUserData();
  groupCount=0;
  point=0;
  }
  late final check=getData();
  @override





  Widget build(BuildContext context) {
    print(widget.UserKind);
    if(widget.UserKind == 'teacher')
    {
      return Scaffold(
        backgroundColor: backgreen,
        body: Container(
          child: Column(
            children: [
              SelectionButton(),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.2,
                width: MediaQuery.of(context).size.width / 1.8,
                decoration: const BoxDecoration(
                  // color: Color(0x6BFFFFFF),
                  gradient:LinearGradient(
                    colors: [
                      Color(0x6BFFFFFF),
                      Color(0x5FC3FFC3),
                      Color(0xA65D86A6),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children:  [
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          SizedBox(width: 50,),
                          Spacer(),
                          Text(widget.title,
                              style: TextStyle(
                                  shadows:[Shadow(color: Colors.black, blurRadius: 5)],
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: "DroidKufi",
                                  fontWeight: FontWeight.w700)),
                          Spacer(),
                          GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_forward_ios_rounded, size: 40, color: Colors.white,)),
                        ],
                      ),
                      SizedBox(height: 5,),
                      const Text("اختر الحرف الذي تريد التدرب عليه ",
                          style: TextStyle(
                              shadows:[
                                Shadow(
                                    color: Colors.black,
                                    blurRadius: 5

                                )
                              ],
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: "DroidKufi",
                              fontWeight: FontWeight.w700)),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Visibility(
                            visible: widget.L4==''? false : true,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return  lettervideo(letter : widget.L4,userId: widget.userId, userKind: widget.UserKind,);
                                }));
                              },
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children:[
                                  Container(

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color:  const Color(0xFF357AB0),
                                    ),
                                    child:  Padding(
                                      padding:EdgeInsets.only(bottom: 10,left: 55,right: 55) ,
                                      child: Text( widget.L4,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 70,
                                              fontFamily: "DroidKufi",
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  ),
                                  Visibility(
                                    visible: false,
                                    child: Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(100),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.indigo,
                                                      spreadRadius: -5,
                                                      blurStyle: BlurStyle.solid,
                                                      blurRadius: 15,
                                                      offset: Offset(0, 5),


                                                    ),
                                                  ]
                                              ),

                                            ),
                                            Icon(
                                              Icons.check_circle_rounded,
                                              color: Colors.green[600],
                                              size: 50,
                                            ),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Visibility(
                            visible: widget.L3==''? false : true,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return lettervideo(letter : widget.L3, userId: widget.userId, userKind: widget.UserKind,);
                                }));
                              },
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Container(
                                    // width: MediaQuery.of(context).size.width / 10,
                                    // height: MediaQuery.of(context).size.height /5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color:  const Color(0xFF357AB0),
                                    ),
                                    child:  Padding(
                                      padding:EdgeInsets.only(bottom: 10,left: 55,right: 55) ,
                                      child: Text( widget.L3,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 70,
                                              fontFamily: "DroidKufi",
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  ),
                                  Visibility(
                                    visible: false,
                                    child: Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(100),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.indigo,
                                                      spreadRadius: -5,
                                                      blurStyle: BlurStyle.solid,
                                                      blurRadius: 15,
                                                      offset: Offset(0, 5),


                                                    ),
                                                  ]
                                              ),

                                            ),
                                            Icon(
                                              Icons.check_circle_rounded,
                                              color: Colors.green[600],
                                              size: 50,
                                            ),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Visibility(
                            visible: widget.L2==''? false : true,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return lettervideo(letter : widget.L2,userId: widget.userId, userKind: widget.UserKind,);
                                }));
                              },
                              child: Stack(
                                alignment: Alignment.bottomLeft,

                                children: [

                                  Container(
                                    // width: MediaQuery.of(context).size.width / 10,
                                    // height: MediaQuery.of(context).size.height /5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color:  const Color(0xFF357AB0),
                                    ),
                                    child:  Padding(
                                      padding:EdgeInsets.only(bottom: 10,left: 55,right: 55) ,
                                      child: Text( widget.L2,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 70,
                                              fontFamily: "DroidKufi",
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  ),
                                  Visibility(
                                    visible: false,
                                    child: Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(100),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.indigo,
                                                      spreadRadius: -5,
                                                      blurStyle: BlurStyle.solid,
                                                      blurRadius: 15,
                                                      offset: Offset(0, 5),


                                                    ),
                                                  ]
                                              ),

                                            ),
                                            Icon(
                                              Icons.check_circle_rounded,
                                              color: Colors.green[600],
                                              size: 50,
                                            ),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Visibility(
                            visible: widget.L1==''? false : true,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return lettervideo(letter : widget.L1,userId: widget.userId, userKind: widget.UserKind,);
                                }));
                              },
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Container(
                                    // width: MediaQuery.of(context).size.width / 10,
                                    // height: MediaQuery.of(context).size.height /5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color:  const Color(0xFF357AB0),
                                    ),
                                    child:  Padding(
                                      padding:EdgeInsets.only(bottom: 10,left: 55,right: 55) ,
                                      child: Text( widget.L1,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 70,
                                              fontFamily: "DroidKufi",
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  ),
                                  Visibility(
                                    visible: false,
                                    child: Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(100),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.indigo,
                                                      spreadRadius: -5,
                                                      blurStyle: BlurStyle.solid,
                                                      blurRadius: 15,
                                                      offset: Offset(0, 5),


                                                    ),
                                                  ]
                                              ),

                                            ),
                                            Icon(
                                              Icons.check_circle_rounded,
                                              color: Colors.green[600],
                                              size: 50,
                                            ),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),



                        ],
                      ),
                      SizedBox(height: 20,),
                      Visibility(
                        visible: widget.L5==''? false : true,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return  lettervideo(letter : widget.L5,userId: widget.userId, userKind: widget.UserKind,);
                            }));
                          },
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children:[
                              Container(

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:  const Color(0xFF357AB0),
                                ),
                                child:  Padding(
                                  padding:EdgeInsets.only(bottom: 10,left: 55,right: 55) ,
                                  child: Text( widget.L5,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 70,
                                          fontFamily: "DroidKufi",
                                          fontWeight: FontWeight.w700)),
                                ),
                              ),
                              Visibility(
                                visible: false,
                                child: Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(100),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.indigo,
                                                  spreadRadius: -5,
                                                  blurStyle: BlurStyle.solid,
                                                  blurRadius: 15,
                                                  offset: Offset(0, 5),


                                                ),
                                              ]
                                          ),

                                        ),
                                        Icon(
                                          Icons.check_circle_rounded,
                                          color: Colors.green[600],
                                          size: 50,
                                        ),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(flex: 2,),


                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
    else
      {
        return FutureBuilder<List<dynamic>?>(
          future: check,
          builder: (context, snapshot) {

            if (snapshot.hasData) {
              bool searchRes  (String s){
                int x=0;

                for ( var i=0 ; i<snapshot.data!.length;i++ )
                {
                  if (snapshot.data![i]['letter']==s){
                    x=i;
                  }
                }
                if (snapshot.data![x]['result']=='true')
                {
                  return true;
                }
                else
                {
                  return false;
                }
              }
              return Scaffold(
                backgroundColor: backgreen,
                body: Container(
                  child: Column(
                    children: [
                      SelectionButton(),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 1.2,
                        width: MediaQuery.of(context).size.width / 1.8,
                        decoration: const BoxDecoration(
                          // color: Color(0x6BFFFFFF),
                          gradient:LinearGradient(
                            colors: [
                              Color(0x6BFFFFFF),
                              Color(0x5FC3FFC3),
                              Color(0xA65D86A6),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children:  [
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  SizedBox(width: 50,),
                                  Spacer(),
                                  Text(widget.title,
                                      style: TextStyle(
                                          shadows:[Shadow(color: Colors.black, blurRadius: 5)],
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontFamily: "DroidKufi",
                                          fontWeight: FontWeight.w700)),
                                  Spacer(),
                                  GestureDetector(
                                      onTap: (){
                                        Navigator.pop(context);
                                        point=0;
                                        groupCount=0;


                                      },
                                      child: Icon(Icons.arrow_forward_ios_rounded, size: 40, color: Colors.white,)),
                                ],
                              ),
                              SizedBox(height: 5,),
                              const Text("اختر الحرف الذي تريد التدرب عليه ",
                                  style: TextStyle(
                                      shadows:[
                                        Shadow(
                                            color: Colors.black,
                                            blurRadius: 5

                                        )
                                      ],
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontFamily: "DroidKufi",
                                      fontWeight: FontWeight.w700)),
                              Spacer(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  SizedBox(width: 50 , height: 50,child: Image.asset('img/star.png')),
                                  SizedBox(width: 10,),
                                  Text(point.toString(), style: TextStyle(color: Colors.white,fontFamily: 'DroidKufi' ,fontSize: 30, fontWeight: FontWeight.bold),),
                                  Text(' / $groupCount', style: TextStyle(color: Colors.white,fontFamily: 'DroidKufi' ,fontSize: 30, fontWeight: FontWeight.bold)),
                                  SizedBox(width: 35,),
                                ],
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Visibility(
                                    visible: widget.L4==''? false : true,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(builder: (context) {
                                          return  lettervideo(letter : widget.L4,userId: widget.userId, userKind: widget.UserKind,);
                                        }));
                                      },
                                      child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        children:[
                                          Container(

                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color:  const Color(0xFF357AB0),
                                            ),
                                            child:  Padding(
                                              padding:EdgeInsets.only(bottom: 10,left: 55,right: 55) ,
                                              child: Text( widget.L4,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 70,
                                                      fontFamily: "DroidKufi",
                                                      fontWeight: FontWeight.w700)),
                                            ),
                                          ),
                                          Visibility(
                                            visible: searchRes(widget.L4),
                                            child: Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Container(
                                                      height: 35,
                                                      width: 35,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.circular(100),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.indigo,
                                                              spreadRadius: -5,
                                                              blurStyle: BlurStyle.solid,
                                                              blurRadius: 15,
                                                              offset: Offset(0, 5),


                                                            ),
                                                          ]
                                                      ),

                                                    ),
                                                    Icon(
                                                      Icons.check_circle_rounded,
                                                      color: Colors.green[600],
                                                      size: 50,
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Visibility(
                                    visible: widget.L3==''? false : true,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(builder: (context) {
                                          return lettervideo(letter : widget.L3, userId: widget.userId, userKind: widget.UserKind,);
                                        }));
                                      },
                                      child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          Container(
                                            // width: MediaQuery.of(context).size.width / 10,
                                            // height: MediaQuery.of(context).size.height /5,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color:  const Color(0xFF357AB0),
                                            ),
                                            child:  Padding(
                                              padding:EdgeInsets.only(bottom: 10,left: 55,right: 55) ,
                                              child: Text( widget.L3,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 70,
                                                      fontFamily: "DroidKufi",
                                                      fontWeight: FontWeight.w700)),
                                            ),
                                          ),
                                          Visibility(
                                            visible: searchRes(widget.L3),
                                            child: Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Container(
                                                      height: 35,
                                                      width: 35,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.circular(100),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.indigo,
                                                              spreadRadius: -5,
                                                              blurStyle: BlurStyle.solid,
                                                              blurRadius: 15,
                                                              offset: Offset(0, 5),


                                                            ),
                                                          ]
                                                      ),

                                                    ),
                                                    Icon(
                                                      Icons.check_circle_rounded,
                                                      color: Colors.green[600],
                                                      size: 50,
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Visibility(
                                    visible: widget.L2==''? false : true,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(builder: (context) {
                                          return lettervideo(letter : widget.L2,userId: widget.userId, userKind: widget.UserKind,);
                                        }));
                                      },
                                      child: Stack(
                                        alignment: Alignment.bottomLeft,

                                        children: [

                                          Container(
                                            // width: MediaQuery.of(context).size.width / 10,
                                            // height: MediaQuery.of(context).size.height /5,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color:  const Color(0xFF357AB0),
                                            ),
                                            child:  Padding(
                                              padding:EdgeInsets.only(bottom: 10,left: 55,right: 55) ,
                                              child: Text( widget.L2,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 70,
                                                      fontFamily: "DroidKufi",
                                                      fontWeight: FontWeight.w700)),
                                            ),
                                          ),
                                          Visibility(
                                            visible: searchRes(widget.L2),
                                            child: Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Container(
                                                      height: 35,
                                                      width: 35,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.circular(100),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.indigo,
                                                              spreadRadius: -5,
                                                              blurStyle: BlurStyle.solid,
                                                              blurRadius: 15,
                                                              offset: Offset(0, 5),


                                                            ),
                                                          ]
                                                      ),

                                                    ),
                                                    Icon(
                                                      Icons.check_circle_rounded,
                                                      color: Colors.green[600],
                                                      size: 50,
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Visibility(
                                    visible: widget.L1==''? false : true,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(builder: (context) {
                                          return lettervideo(letter : widget.L1,userId: widget.userId, userKind: widget.UserKind,);
                                        }));
                                      },
                                      child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          Container(
                                            // width: MediaQuery.of(context).size.width / 10,
                                            // height: MediaQuery.of(context).size.height /5,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color:  const Color(0xFF357AB0),
                                            ),
                                            child:  Padding(
                                              padding:EdgeInsets.only(bottom: 10,left: 55,right: 55) ,
                                              child: Text( widget.L1,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 70,
                                                      fontFamily: "DroidKufi",
                                                      fontWeight: FontWeight.w700)),
                                            ),
                                          ),
                                          Visibility(
                                            visible: searchRes(widget.L1),
                                            child: Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Container(
                                                      height: 35,
                                                      width: 35,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.circular(100),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.indigo,
                                                              spreadRadius: -5,
                                                              blurStyle: BlurStyle.solid,
                                                              blurRadius: 15,
                                                              offset: Offset(0, 5),


                                                            ),
                                                          ]
                                                      ),

                                                    ),
                                                    Icon(
                                                      Icons.check_circle_rounded,
                                                      color: Colors.green[600],
                                                      size: 50,
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),



                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Visibility(
                                    visible: widget.L5==''? false : true,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(builder: (context) {
                                          return  lettervideo(letter : widget.L5,userId: widget.userId, userKind: widget.UserKind,);
                                        }));
                                      },
                                      child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        children:[
                                          Container(

                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color:  const Color(0xFF357AB0),
                                            ),
                                            child:  Padding(
                                              padding:EdgeInsets.only(bottom: 10,left: 55,right: 55) ,
                                              child: Text( widget.L5,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 70,
                                                      fontFamily: "DroidKufi",
                                                      fontWeight: FontWeight.w700)),
                                            ),
                                          ),
                                          Visibility(
                                            visible: searchRes(widget.L5),
                                            child: Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Container(
                                                      height: 35,
                                                      width: 35,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.circular(100),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.indigo,
                                                              spreadRadius: -5,
                                                              blurStyle: BlurStyle.solid,
                                                              blurRadius: 15,
                                                              offset: Offset(0, 5),


                                                            ),
                                                          ]
                                                      ),

                                                    ),
                                                    Icon(
                                                      Icons.check_circle_rounded,
                                                      color: Colors.green[600],
                                                      size: 50,
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Spacer(flex: 2,),


                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            return Scaffold(
              backgroundColor: Colors.green,
              body: Center(
                child: Container(color: Colors.green,
                  child: SizedBox(
                      height: 200,
                      width: 200,
                      child: CircularProgressIndicator(color: Colors.white,)),),
              ),
            );
          },
        );
      }

  }
  /*String countCorrect (String a,String b,String c,String d, ){
    int x;


    if (a!='')
      {
        for ( var i=0 ; i<;i++ )
          {

          }

      }

  }
*/
  }
