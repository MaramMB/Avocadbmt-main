import 'dart:convert';

import 'package:advanced_search/advanced_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Account_Managment/Add_Account/add_society.dart';
import 'package:flutter_application_1/pages/Characters/characters.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/widgets/person_record.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/linear_percent_indicator.dart';

// import 'package:flutter_app_4/models/person.dart';
// import 'package:flutter_app_4/screens/add_account_form.dart';
// import 'package:flutter_app_4/widgets/person_record.dart';
const blak = Color.fromRGBO(55, 53, 53, 1);
var green = HexColor("#7BC155");
const backgreen = Color.fromRGBO(131, 190, 99, 1);

// void main() => runApp(const MyApp());

class expage extends StatefulWidget {
  const expage({Key? key}) : super(key: key);

  @override
  State<expage> createState() => _expageState();
}

class _expageState extends State<expage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body:  Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.of(context).size.height / 1.1,
            width: MediaQuery.of(context).size.width / 1.7,
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
                      height: 510,
                      width: 600,
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          AdvancedSearch(searchItems: const [
                            'sss','eeeeeee','bara','bones','gege',
                          ], onItemTap: (int index, String value) { print(value); },),
                          Column(
                            children: [


                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('المشكلة ', style: TextStyle(fontFamily: "DroidKufi",fontWeight: FontWeight.bold,color: blak),),
                                  Text('مشكلة الطالب : ', style: TextStyle(fontFamily: "DroidKufi",fontWeight: FontWeight.bold,color: HexColor("#7BC155")),),
                                  Spacer(),
                                  Text('اسم الطالب ', style: TextStyle(fontFamily: "DroidKufi",fontWeight: FontWeight.bold,color: blak),),
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
                                                progressColor: HexColor("#7BC155"),
                                                backgroundColor: Colors.transparent,
                                                center: Text("55",style: TextStyle(color: blak , fontSize: 12, fontWeight: FontWeight.bold),),// if half or more change color to white
                                                isRTL: true,

                                                percent: 0.7,
                                                lineHeight: 16,
                                                width: 250,
                                                barRadius: Radius.circular(10),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Text('84', style: TextStyle(fontFamily: "DroidKufi",fontSize: 16,color: Colors.black),),

                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            TextButton(onPressed: (){}, child: Text("عرض الأخطاء",style: TextStyle(fontFamily: "DroidKufi",fontSize: 14))),
                                            SizedBox(width: 50,),
                                            TextButton(onPressed: (){}, child: Text("إعادة التعيين",style: TextStyle(fontFamily: "DroidKufi",fontSize: 14))),

                                          ],
                                        ),

                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,

                                          children: [

                                            Text('نطق الحروف', style: TextStyle(fontFamily: "DroidKufi",fontWeight: FontWeight.bold,fontSize: 17,color: HexColor("#7BC155")),),
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
                                                progressColor: HexColor("#7BC155"),
                                                backgroundColor: Colors.transparent,
                                                center: Text("55",style: TextStyle(color: blak , fontSize: 12, fontWeight: FontWeight.bold),),// if half or more change color to white
                                                isRTL: true,

                                                percent: 0.7,
                                                lineHeight: 16,
                                                width: 250,
                                                barRadius: Radius.circular(10),
                                              ),
                                            ),

                                            Text('84', style: TextStyle(fontFamily: "DroidKufi",fontSize: 16,color: Colors.black),),

                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(width: 170,),
                                            TextButton(onPressed: (){}, child: Text("إعادة التعيين",style: TextStyle(fontFamily: "DroidKufi",fontSize: 14))),

                                          ],
                                        ),

                                      ],
                                    ),




                                  ],
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
                                                progressColor: HexColor("#7BC155"),
                                                backgroundColor: Colors.transparent,
                                                center: Text("55",style: TextStyle(color: blak , fontSize: 12, fontWeight: FontWeight.bold),),// if half or more change color to white
                                                isRTL: true,

                                                percent: 0.7,
                                                lineHeight: 16,
                                                width: 250,
                                                barRadius: Radius.circular(10),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Text('84', style: TextStyle(fontFamily: "DroidKufi",fontSize: 16,color: Colors.black),),

                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(width: 170,),
                                            TextButton(onPressed: (){}, child: Text("إعادة التعيين",style: TextStyle(fontFamily: "DroidKufi",fontSize: 14))),

                                          ],
                                        ),

                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,

                                          children: [

                                            Text('الاصوات الاستيعابية', style: TextStyle(fontFamily: "DroidKufi",fontWeight: FontWeight.bold,fontSize: 17,color: HexColor("#7BC155")),),
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
                                                progressColor: HexColor("#7BC155"),
                                                backgroundColor: Colors.transparent,
                                                center: Text("55",style: TextStyle(color: blak , fontSize: 12, fontWeight: FontWeight.bold),),// if half or more change color to white
                                                isRTL: true,

                                                percent: 0.7,
                                                lineHeight: 16,
                                                width: 250,
                                                barRadius: Radius.circular(10),
                                              ),
                                            ),

                                            Text('84', style: TextStyle(fontFamily: "DroidKufi",fontSize: 16,color: Colors.black),),

                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(width: 170,),
                                            TextButton(onPressed: (){}, child: Text("إعادة التعيين",style: TextStyle(fontFamily: "DroidKufi",fontSize: 14))),

                                          ],
                                        ),

                                      ],
                                    ),




                                  ],
                                ),
                              ),


                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (context) {
                                      return sptest();
                                    }));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: HexColor("#7BC155"),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                    elevation: 2.0,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 35, vertical: 10),
                                  ),
                                  child: const Text("هيا لنبدأ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "DroidKufi",
                                        fontSize: 17.0,
                                      )
                                  ),
                                ),),

                            ],
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
    );
  }
}

  getSocieties() async {
    var url = 'http://localhost/get_societis.php';
    var response = await http.get(Uri.parse(url));
    var res = jsonDecode(response.body);
    return res;
  }
