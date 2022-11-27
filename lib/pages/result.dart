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
const blak = Color.fromRGBO(55, 53, 53, 1);
var green = HexColor("#7BC155");
const backgreen = Color.fromRGBO(131, 190, 99, 1);
var SearchController = TextEditingController();
String StName="اسم الطالب";
String problem = "المشكلة";
IconData SearchIcon = Icons.search;
bool isClicked= false;

// void main() => runApp(const MyApp());

class result extends StatefulWidget {
  const result({Key? key, required this.userId}) : super(key: key);
  final String userId;
  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
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
  void initState() {
    super.initState();
    print(widget.userId);
  }
  late final list = getStudents(widget.userId);
  late final Slist;
  var query;


  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<dynamic>?>(
      future: list,
      builder: (context,snapshot){
        if(snapshot.hasData)
        {

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

                                        SizedBox(height: 80,),
                                        Center(
                                          // child: ElevatedButton(
                                          //   onPressed: () {
                                          //     Navigator.of(context)
                                          //         .push(MaterialPageRoute(builder: (context) {
                                          //       return sptest(id: '',);
                                          //     }));
                                          //   },
                                          //   style: ElevatedButton.styleFrom(
                                          //     backgroundColor: HexColor("#7BC155"),
                                          //     shape: const RoundedRectangleBorder(
                                          //         borderRadius:
                                          //         BorderRadius.all(Radius.circular(10))),
                                          //     elevation: 2.0,
                                          //     padding: const EdgeInsets.symmetric(
                                          //         horizontal: 35, vertical: 10),
                                          //   ),
                                          //   child: const Text("هيا لنبدأ",
                                          //       style: TextStyle(
                                          //         color: Colors.white,
                                          //         fontFamily: "DroidKufi",
                                          //         fontSize: 17.0,
                                          //       )
                                          //   ),
                                          // )
                                        ),

                                      ],
                                    ),
                                    Visibility(
                                      visible: isClicked,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 45 , left: 120),
                                        child: SizedBox(
                                          width: 360,
                                          child: ListView.builder(itemCount: snapshot.data?.length,itemBuilder: (BuildContext context, int index) {
                                            String Fname =snapshot.data![index]['firstname']+' '+snapshot.data![index]['secname']+' '+snapshot.data![index]['thirdname']+' '+snapshot.data![index]['familyname'];
                                            return Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border(bottom: BorderSide(color: Colors.black26)),
                                              ),
                                              child: Directionality(
                                                textDirection: TextDirection.rtl,
                                                child:ListTile(

                                                  onTap: (){
                                                    setState(() {
                                                      SearchController.text = Fname;
                                                      isClicked = false;
                                                      StName = ' '+Fname+' ';
                                                      if(snapshot.data![index]['ptype']=='hear'){
                                                        problem = 'سمع ';
                                                      }
                                                      else
                                                      {
                                                        problem = ' نطق ';

                                                      }

                                                    });
                                                  },
                                                  leading: ClipOval(child: Image.memory(base64Decode(snapshot.data![index]['image']), width: 50, height: 50,)),
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
        else{
          return Scaffold(
            backgroundColor: green,
            body: Center(
              child: Column(
                children: [
                  SelectionButton(),
                  SizedBox(height: 30,),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.2,
                    width: MediaQuery.of(context).size.width / 1.7,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: SizedBox(
                        height: 200,
                        width: 200,
                        child: Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.question_mark_rounded , size: 100, color: Colors.grey,),
                            Text('لم يتم إضافة طلاب ',style: TextStyle(
                              fontFamily: "DroidKufi", fontWeight: FontWeight.bold, fontSize: 30,color: Colors.grey,
                            ),),
                          ],
                        ))),),
                ],
              ),
            ),
          );
        }
      },
    );

  }
}

Future<List<dynamic>?> getStudents(String id) async {
  var url = 'http://localhost/getStudents.php';
  var response = await http.post(Uri.parse(url), body: {
    'id':id,
  });
  var res = jsonDecode(response.body);
  return res;
}
