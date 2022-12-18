import 'dart:async';
import 'dart:convert';

import 'package:advanced_search/advanced_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Account_Managment/Add_Account/add_society.dart';
import 'package:flutter_application_1/pages/Characters/characters.dart';
import 'package:flutter_application_1/pages/models/students.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/testlogin.dart';
import 'package:flutter_application_1/pages/voicetestbe.dart';
import 'package:flutter_application_1/pages/widgets/person_record.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;


const blak = Color.fromRGBO(55, 53, 53, 1);
var green = HexColor("#7BC155");
const backgreen = Color.fromRGBO(131, 190, 99, 1);
var SearchController = TextEditingController();
IconData SearchIcon = Icons.search;
bool isClicked= false;
var teacher;
var society;

bool studentChoose = false;

bool visa=true;
List<Students> ulist = [];
List<dynamic> ulist2 = [];
List<Students> userLists = [];

// void main() => runApp(const MyApp());

class chat extends StatefulWidget {
  const chat({Key? key, required this.userId, required this.userKind}) : super(key: key);
  final String userId;
  final String? userKind;
  @override
  State<chat> createState() => _chatState();
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

class _chatState extends State<chat> {
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
  String? userKind;
  String userId = '';

  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // setState(() {
      userKind = prefs.getString('userKind') ?? '';
      userId = prefs.getString('userId') ?? '';
    // });
  }
  var searchBarController = TextEditingController();
  @override
  late  Future <List<Students>?> list;
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
      });
    });
    getUserData();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
      });
    });
    ulist = [];
    userLists = [];
    ulist2 = [];
    getStudents(widget.userId , widget.userKind).then((val) {
      setState(() {
        ulist = val;
        userLists = ulist;
      });
    });
    getTeacher(userId);


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
                Visibility(
                    visible: widget.userKind!='manager',
                    child: SelectionButton()
                ),
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
        body:  SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 0,right: 50,bottom: 0),
                child: Visibility(
                  visible: widget.userKind=='manager',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_forward_ios_rounded, size: 40, color: Colors.white,)),

                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                  visible: widget.userKind!='manager',
                  child: SelectionButton()
              ),

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
                      padding: const EdgeInsets.symmetric(horizontal: 70 ,vertical: 20),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Center(
                              child: Text('المجتمع',
                                  style: TextStyle(
                                      color: HexColor("#7BC155"),
                                      fontSize: 25,
                                      fontFamily: "DroidKufi",
                                      fontWeight: FontWeight.w700)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Visibility(
                              visible: widget.userKind!='manager',
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [

                                      Text('الجمعية',
                                          style: TextStyle(
                                              color: HexColor("#7BC155"),
                                              fontSize: 20,
                                              fontFamily: "DroidKufi",
                                              fontWeight: FontWeight.w700)),
                                    ],
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
                                  Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child:ListTile(
                                          dense: true,
                                          mouseCursor: SystemMouseCursors.contextMenu,
                                          onTap: ()async{
                                          },
                                          leading: ClipRRect(borderRadius: BorderRadius.circular(50),child:Image.memory(base64Decode(society['image']), width: 50, height: 50, fit: BoxFit.fill,)),
                                          title: Text(society['Society_Name'], style: TextStyle(
                                            color: blak,
                                            fontFamily: "DroidKufi",
                                            fontSize: 16,
                                          ),),
                                          trailing: ElevatedButton(onPressed: (){

                                            html.window.open('https://mail.google.com/mail/u/1/?&to=${society['Email']}&tf=cm', '');

                                          }, child: Icon(Icons.email_outlined, size: 25,), style: ElevatedButton.styleFrom(backgroundColor: green),),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            Visibility(
                              visible: widget.userKind!='teacher',
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(widget.userKind=='manager'?'المعلمين':'المعلم',
                                      style: TextStyle(
                                          color: HexColor("#7BC155"),
                                          fontSize: 20,
                                          fontFamily: "DroidKufi",
                                          fontWeight: FontWeight.w700)),
                                  SizedBox(
                                    height: 20.0,

                                    child: Center(
                                      child: Container(

                                        height: 1,
                                        color: Colors.black26,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: widget.userKind=='manager'?160:60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,

                                    ),
                                    child: Center(
                                      child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child:widget.userKind=='student'?ListTile(
                                          dense: true,
                                          mouseCursor: SystemMouseCursors.contextMenu,

                                          onTap: ()async{

                                          },
                                          leading: ClipRRect(borderRadius: BorderRadius.circular(50),child:Image.memory(base64Decode(teacher['image']), width: 50, height: 50, fit: BoxFit.fill,)),
                                          title: Text((teacher['Name']+' '+teacher['secname']+' '+teacher['familyname'])?? 's', style: TextStyle(
                                            color: blak,
                                            fontFamily: "DroidKufi",
                                            fontSize: 16,
                                          ),),
                                          trailing: ElevatedButton(onPressed: (){

                                            html.window.open('https://mail.google.com/mail/u/1/?&to=${teacher['Email']}&tf=cm', '');



                                          }, child: Icon(Icons.email_outlined, size: 25,), style: ElevatedButton.styleFrom(backgroundColor: green),),
                                        )
                                            :widget.userKind=='manager'?
                                        ListView.builder(itemCount: ulist2.length,itemBuilder: (BuildContext context, int index)
                                        {

                                          return Container(
                                            height: 60,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border(bottom: BorderSide(color: Colors.black26)),
                                            ),
                                            child: Center(
                                              child: Directionality(
                                                textDirection: TextDirection.rtl,
                                                child:ListTile(
                                                  dense: true,
                                                  mouseCursor: SystemMouseCursors.contextMenu,
                                                  onTap: ()async{
                                                  },
                                                  leading: ClipRRect(borderRadius: BorderRadius.circular(50),child: Image.memory(base64Decode(ulist2[index]['image']), width: 50, height: 50, fit: BoxFit.fill,)),
                                                  title: Text((ulist2[index]['Name']+' '+ulist2[index]['secname']+' '+ulist2[index]['familyname'])?? 's', style: TextStyle(
                                                    color: blak,
                                                    fontFamily: "DroidKufi",
                                                    fontSize: 16,
                                                  ),),
                                                  trailing: Visibility(
                                                    visible: widget.userKind!='student',
                                                    child: ElevatedButton(onPressed: (){
                                                      html.window.open('https://mail.google.com/mail/u/1/?&to=${ulist2[index]['email']}&tf=cm', '');
                                                    }, child: Icon(Icons.email_outlined, size: 25,), style: ElevatedButton.styleFrom(backgroundColor: green),),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },)
                                            :Container(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),


                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [

                                Directionality(

                                  textDirection: TextDirection.rtl,
                                  child: SizedBox(
                                    width: 300,
                                    height: 40,
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
                                Text('الطلاب',
                                    style: TextStyle(
                                        color: HexColor("#7BC155"),
                                        fontSize: 20,
                                        fontFamily: "DroidKufi",
                                        fontWeight: FontWeight.w700)),

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
                            Container(
                              // color: Colors.black38,
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: Column(
                                children: [
                                  SingleChildScrollView(
                                    child: SizedBox(
                                      width: 500,
                                      height: 145,
                                      child: ListView.builder(itemCount: userLists.length,itemBuilder: (BuildContext context, int index)
                                      {
                                        String Fname =userLists[index].fname+' '+userLists[index].sname+' '+userLists[index].tname+' '+userLists[index].lname;
                                        return Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border(bottom: BorderSide(color: Colors.black26)),
                                          ),
                                          child: Center(
                                            child: Directionality(
                                              textDirection: TextDirection.rtl,
                                              child:ListTile(
                                                dense: true,
                                                mouseCursor: SystemMouseCursors.contextMenu,
                                                onTap: ()async{
                                                },
                                                leading: ClipRRect(borderRadius: BorderRadius.circular(50),child: Image.memory(base64Decode(userLists[index].image), width: 50, height: 50, fit: BoxFit.fill,)),
                                                title: Text(Fname, style: TextStyle(
                                                  color: blak,
                                                  fontFamily: "DroidKufi",
                                                  fontSize: 16,
                                                ),),
                                                trailing: Visibility(
                                                  visible: widget.userKind!='student',
                                                  child: ElevatedButton(onPressed: (){
                                                    html.window.open('https://mail.google.com/mail/u/1/?&to=${userLists[index].email}&tf=cm', '');
                                                  }, child: Icon(Icons.email_outlined, size: 25,), style: ElevatedButton.styleFrom(backgroundColor: green),),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },),
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
        ),
      );
    }


  }
  Future<List<Students>> getStudents(String id ,String? type) async {
    var url = 'http://localhost/getStudents.php';
    var x = id;
    if (type == 'student')
    {
      var url2 = 'http://localhost/getTid.php';
      var response = await http.post(Uri.parse(url2), body :{
        'id': id,
      });
      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        x = data[0]['tid'];

        teacher = await getTeacher(x);
        getSociety();
      }
    }
    else
    {
      teacher = await getTeacher(x);
      getSociety();

    }
    // fix for society

    try{ var response = await http.post(Uri.parse(url), body: {
      'id':x,
      'kind':type,
    });
    List<Students> res = parseAgents(response.body);
    return res;
    }catch(e){
      throw Exception(e.toString());
    }
  }
  getTeacher(String tid)async {

    var url = 'http://localhost/studentTeacher.php';
    var response = await http.post(Uri.parse(url), body: {
      'id': tid,
      'kind': widget.userKind,
    });
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (widget.userKind=='manager')
        {
          ulist2= await data;

          return data;
        }
      else {
        return data[0];
      }
    }
  }
  getSociety() async{

    var url3 = 'http://localhost/teacherSociety.php';
    if (widget.userKind=='manager')
      {
        var response = await http.post(Uri.parse(url3), body :{
          'id': '100',
        });
        if (response.statusCode == 200) {
          var data = json.decode(response.body);

          society = await data[0];

        }
      }
    else {
      var response = await http.post(Uri.parse(url3), body: {
        'id': teacher['Society_Id'],
      });
      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        society = await data[0];
      }
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



