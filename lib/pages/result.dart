import 'dart:async';
import 'dart:convert';

import 'package:advanced_search/advanced_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Account_Managment/Add_Account/add_society.dart';
import 'package:flutter_application_1/pages/Characters/characters.dart';
import 'package:flutter_application_1/pages/models/students.dart';
import 'package:flutter_application_1/pages/result.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/voicetestbe.dart';
import 'package:flutter_application_1/pages/widgets/person_record.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/linear_percent_indicator.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
var green = HexColor("#7BC155");
const backgreen = Color.fromRGBO(131, 190, 99, 1);
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

class result extends StatefulWidget {
  const result({Key? key, required this.userId}) : super(key: key);
  final String userId;
  @override
  State<result> createState() => _resultState();
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

class _resultState extends State<result> {
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
              SelectionButton(),
              SizedBox(height: 30,),
              Container(
                height: MediaQuery.of(context).size.height / 1.2,
                width: MediaQuery.of(context).size.width / 1.8,
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
            SelectionButton(),

            const SizedBox(
              height: 30,
            ),
            Center(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.15,
                  width: MediaQuery.of(context).size.width / 1.8,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0.0, top: 10),
                    child: Center(
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [

                          Text('النتائج والتقدم',
                              style: TextStyle(
                                  color: HexColor("#7BC155"),
                                  fontSize: 25,
                                  fontFamily: "DroidKufi",
                                  fontWeight: FontWeight.w700)),

                          Directionality(

                            textDirection: TextDirection.rtl,
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
                          Container(
                            // color: Colors.black38,
                            height: 450,
                            width: 600,
                            padding: const EdgeInsets.only(top: 20),
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
                                    const SizedBox(height: 20),
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
                                                  SizedBox(width: 150,)
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
                                                      width: 250,
                                                      barRadius: Radius.circular(10),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10,),
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
                                                  SizedBox(width: 50,),
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
                                                                            builder: (BuildContext context) => result(userId: widget.userId),
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
                                          Spacer(flex: 1,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,

                                                children: [

                                                  Text('نطق الحروف', style: TextStyle(fontFamily: "DroidKufi",fontWeight: FontWeight.bold,fontSize: 17,color: HexColor("#7BC155")),),
                                                  SizedBox(width: 170,)
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
                                                      width: 250,
                                                      barRadius: Radius.circular(10),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text('28', style: TextStyle(fontFamily: "DroidKufi",fontSize: 16,color: Colors.black),),

                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(width: 170,),
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
                                                                        builder: (BuildContext context) => result(userId: widget.userId),
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
                                    const SizedBox(height: 20),
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
                                                  SizedBox(width: 150,)
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
                                                      width: 250,
                                                      barRadius: Radius.circular(10),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Text('20', style: TextStyle(fontFamily: "DroidKufi",fontSize: 16,color: Colors.black),),

                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(width: 170,),
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
                                                                        builder: (BuildContext context) => result(userId: widget.userId),
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
                                          Spacer(flex: 1,),

                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,

                                                children: [

                                                  Text('الاصوات الاستيعابية', style: TextStyle(fontFamily: "DroidKufi",fontWeight: FontWeight.bold,fontSize: 17,color: HexColor("#7BC155")),),

                                                  SizedBox(width: 120,)
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
                                                      width: 250,
                                                      barRadius: Radius.circular(10),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Text('20', style: TextStyle(fontFamily: "DroidKufi",fontSize: 16,color: Colors.black),),

                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(width: 170,),
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
                                                                        builder: (BuildContext context) => result(userId: widget.userId),
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
                                                  SizedBox(width: 150,)
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
                                                      width: 250,
                                                      barRadius: Radius.circular(10),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Text('20', style: TextStyle(fontFamily: "DroidKufi",fontSize: 16,color: Colors.black),),

                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(width: 170,),
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
                                                                        builder: (BuildContext context) => result(userId: widget.userId),
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
                                          Spacer(flex: 1,),

                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,

                                                children: [

                                                  Text('الاصوات الاستيعابية', style: TextStyle(fontFamily: "DroidKufi",fontWeight: FontWeight.bold,fontSize: 17,color: Colors.blue[500]),),

                                                  SizedBox(width: 120,)
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
                                                      width: 250,
                                                      barRadius: Radius.circular(10),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Text('20', style: TextStyle(fontFamily: "DroidKufi",fontSize: 16,color: Colors.black),),

                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(width: 170,),
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
                                                                        builder: (BuildContext context) => result(userId: widget.userId),
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


                                  ],
                                ),
                                Visibility(
                                  visible: isClicked,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 45 , left: 120),
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
                                              title: Text(Fname),
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
