import 'dart:async';
import 'dart:convert';

import 'package:advanced_search/advanced_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Account_Managment/Add_Account/add_society.dart';
import 'package:flutter_application_1/pages/Characters/characters.dart';
import 'package:flutter_application_1/pages/models/students.dart';
import 'package:flutter_application_1/pages/result.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
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
int idx=0;
bool studentChoose = false;
var resBe ;
var resAs ;
var resSp;
var resSt;
List<Students> ulist = [];
List<Students> userLists = [];

// void main() => runApp(const MyApp());

class result11 extends StatefulWidget {
  const result11({Key? key, required this.userId}) : super(key: key);
  final String userId;
  @override
  State<result11> createState() => _resultState();
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

class _resultState extends State<result11> {
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

    return Scaffold(
      backgroundColor: backgreen,
      body:  SingleChildScrollView(
        child: Column(
          children: [
            SelectionButton(),

            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.2,
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
                        const Text(
                          'يمكنك في هذه الصفحة الإطلاع على سجلات التقدم ونتائج الطلاب الذين تشرف عليهم . \n قم بالبحث عن الطالب لعرض النتائج الخاصة به',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(

                              fontFamily: "DroidKufi",
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Container(
                          // color: Colors.black38,
                          height: 400,
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
                                            suffixIcon: Icon(SearchIcon),
                                            hintText: 'ابحث عن طالب ...',
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20),
                                                borderSide: const BorderSide(color: Colors.black)

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


                                  const SizedBox(height: 70),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(problem, style: TextStyle(fontFamily: "DroidKufi",fontWeight: FontWeight.bold,color: blak),),
                                      Text('مشكلة الطالب : ', style: TextStyle(fontFamily: "DroidKufi",fontWeight: FontWeight.bold,color: HexColor("#7BC155")),),
                                      Spacer(),
                                      Text(StName, style: TextStyle(fontFamily: "DroidKufi",fontWeight: FontWeight.bold,color: blak),),
                                      Text('الاسم : ', style: TextStyle(fontFamily: "DroidKufi",fontWeight: FontWeight.bold,color: HexColor("#7BC155")),),
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
                                  const SizedBox(height: 30),
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
                                                    center: Text(studentChoose ? resSt[0]['result'] : "0"
                                                      ,style: TextStyle(color: blak , fontSize: 12, fontWeight: FontWeight.bold),),// if half or more change color to white
                                                    isRTL: true,

                                                    percent: resSt != null?int.parse((resSt[0]['result']))/84 : 0,
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
                                                      showDialog(context: context, builder: (context)=>AlertDialog(
                                                        title: Column(
                                                          children: [
                                                            Text(resSt[0]['note'] , style: TextStyle(
                                                                fontFamily: "DroidKufi",
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.bold
                                                            ),),
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
                                                                        resetResult(idx.toString(), '1');
                                                                        Navigator.push(context, MaterialPageRoute (
                                                                          builder: (BuildContext context) => result(userId: widget.userId),
                                                                        ),
                                                                        );

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
                                                    center: Text(studentChoose ? resSp[0]['result'] : "0"
                                                      ,style: TextStyle(color: blak , fontSize: 12, fontWeight: FontWeight.bold),),// if half or more change color to white
                                                    isRTL: true,

                                                    percent: resSp != null?int.parse(resSp[0]['result'])/28 : 0,
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
                                                                    resetResult(idx.toString(), '6');
                                                                    Navigator.push(context, MaterialPageRoute (
                                                                      builder: (BuildContext context) => result(userId: widget.userId),
                                                                    ),
                                                                    );

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
                                  const SizedBox(height: 50),
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
                                                    center: Text(studentChoose ? resBe[0]['result'] : "0"
                                                      ,style: TextStyle(color: blak , fontSize: 12, fontWeight: FontWeight.bold),),// if half or more change color to white
                                                    isRTL: true,

                                                    percent: resBe != null?int.parse(resBe[0]['result'])/20 : 0,
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
                                                                    resetResult(idx.toString(), '4');                                                                          Navigator.push(context, MaterialPageRoute (
                                                                      builder: (BuildContext context) => result(userId: widget.userId),
                                                                    ),
                                                                    );

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
                                                    center: Text(studentChoose ? resAs[0]['result'] : "0"
                                                      ,style: TextStyle(color: blak , fontSize: 12, fontWeight: FontWeight.bold),),// if half or more change color to white
                                                    isRTL: true,

                                                    percent: resAs != null?int.parse(resAs[0]['result'])/28 : 0,
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
                                                                    resetResult(idx.toString(), '5');
                                                                    Navigator.push(context, MaterialPageRoute (
                                                                      builder: (BuildContext context) => result(userId: widget.userId),
                                                                    ),
                                                                    );

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
          ],
        ),
      ),
    );

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
  print(resList);
  return res;

}
resetResult(String id , String tid) async {
  print (id+' - - - -hh');
  print (tid+' - - - -hh');
  var url = 'http://localhost/resetResult.php';
  var response = await http.post(Uri.parse(url), body: {
    'sid':id,
    'exid':tid,
  });
  var res = jsonDecode(response.body);


}
