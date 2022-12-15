import 'dart:convert';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import '../Components.dart';
import 'package:http/http.dart' as http;

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int point = 0;
class letterex extends StatefulWidget {
  const letterex({Key? key, required this.userId, required this.userKind}) : super(key: key);
  final String userId;
  final String? userKind;
  @override
  State<letterex> createState() => _letterexState();
}
class _letterexState extends State<letterex> {
  @override
  getData() async{
    point=0;
    var url = 'http://localhost/getSpell.php';
    http.Response response = await http.post(Uri.parse(url),body: {
      'id':widget.userId,
    });
    var data = jsonDecode(response.body);
    for ( var i=0 ; i<data.length;i++ )
    {

        if (data[i]['result']=='true')
        {
          point++;
        }

    }
    print(data.toString());
    setState(() {

    });
    return data;

  }
  @override
  void initState() {
    // TODO: implement initState
    getData();
  }

  Widget build(BuildContext context) {
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
              height: MediaQuery.of(context).size.height / 1.16,
              width: MediaQuery.of(context).size.width / 1.8,
              decoration:  const BoxDecoration(
                // color: Color(0x6BFFFFFF),
                gradient:LinearGradient(
                  tileMode: TileMode.clamp,
                    colors: [
                      Color(0x6BFFFFFF),
                      Color(0x5FC3FFC3),
                      Color(0x5FC3FFC3),
                      Color(0xA65D86A6),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: widget.userKind=='student' ? EdgeInsets.only(left: 25,top: 0,right: 25,bottom: 0):EdgeInsets.only(left: 25,top: 25,right: 25,bottom: 0),
                child: Stack(

                  children: [

                    Column(
                      children: [
                        Visibility(

                          visible: widget.userKind=='student',
                          child: FadeInDown(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                SizedBox(width: 50 , height: 50,child: Image.asset('img/star.png')),
                                SizedBox(width: 10,),
                                Text(point.toString(), style: TextStyle( shadows:[
                                  Shadow(
                                    color: Colors.black54,
                                    blurRadius: 10,
                                  )
                                ],color: Colors.white,fontFamily: 'DroidKufi' ,fontSize: 30, fontWeight: FontWeight.bold),),
                                Text(' / 28', style: TextStyle( shadows:[
                                  Shadow(
                                    color: Colors.black54,
                                    blurRadius: 10,
                                  )
                                ],color: Colors.white,fontFamily: 'DroidKufi' ,fontSize: 30, fontWeight: FontWeight.bold)),
                                SizedBox(width: 35,),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FadeInRightBig(child: letter(L1: 'ج',L2: 'ش',L3: 'ض',L4: '', title: 'الحروف الشجرية', userId: widget.userId, userKind: widget.userKind,)),
                            FadeInRightBig(child: letter(L1: 'ق',L2: 'ك',L3: '',L4: '', title: 'الحروف اللهوية',userId: widget.userId, userKind: widget.userKind,)),
                            FadeInRightBig(child: letter(L1: 'ع',L2: 'غ',L3: 'ح',L4: 'خ', title: 'الحروف الحلقية',userId: widget.userId, userKind: widget.userKind,)),



                          ],
                        ),
                                SizedBox(height: 17,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FadeIn(child: letter(L1: 'ظ',L2: 'ذ',L3: 'ث',L4: '', title: 'الحروف اللثوية',userId: widget.userId, userKind: widget.userKind,)),
                            FadeIn(child: letter(L1: 'ط',L2: 'ت',L3: 'د',L4: '', title: 'الحروف النطعية',userId: widget.userId, userKind: widget.userKind,)),
                            FadeIn(child: letter(L1: 'ز',L2: 'س',L3: 'ص',L4: '', title: 'الحروف الأسلية',userId: widget.userId, userKind: widget.userKind,)),
                          ],
                        ),
                        SizedBox(height: 17,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FadeInLeftBig(child: letter(L1: 'أ',L2: 'و',L3: 'ي',L4: '', title: 'الحروف الهوائية',userId: widget.userId, userKind: widget.userKind,)),
                            FadeInLeftBig(child: letter(L1: 'ف',L2: 'ب',L3: 'م',L4: '', title: 'الحروف الشفوية',userId: widget.userId, userKind: widget.userKind,)),
                            FadeInLeftBig(child: letter(L1: 'ر',L2: 'ل',L3: 'ن',L4: '', title: 'الحروف اللهوية',userId: widget.userId, userKind: widget.userKind,)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
