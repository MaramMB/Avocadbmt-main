
import 'dart:html' as html;

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_1/pages/expl.dart';
import 'package:flutter_application_1/pages/testlogin.dart';
import 'package:flutter_application_1/pages/testrecord.dart';
import 'package:path/path.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/soundrecourd.dart';
import 'package:flutter_application_1/pages/soundtype.dart';
import 'package:flutter_application_1/pages/voicetestbe.dart';
import 'package:flutter_application_1/Components.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_application_1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
var bfile;
var filename;
var progress;
final assetsAudioPlayer = AssetsAudioPlayer();
bool addAudio=false;
int _value = 1;
late var imageb;
Widget www = Text('sss');
bool isA=true;
bool addCheck = false;
var SnameCont = TextEditingController();
var stuController = TextEditingController();
html.FileUploadInputElement uploadInput = html.FileUploadInputElement();


class voicex extends StatefulWidget {
  String UserID;
  String? UserKind;
  String? tid;
  voicex({Key? key,  required this.UserID, required this.UserKind , required this.tid}) : super(key: key);

  @override
  State<voicex> createState() => _voicexState();
}

class _voicexState extends State<voicex> {
  File? image;
  var audio;
  String? userKind;
  String userId = '';

  Future<List<dynamic>?> getStudents(String id) async {
    var url = 'http://localhost/getStudents.php';
     var response = await http.post(Uri.parse(url), body: {
      'id':userId,
      'kind':'teacher',
    });
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;

    }
  }
  Future<List<dynamic>?> getAllSound(String type) async {

    var url = 'http://localhost/getSound.php';
    var response = await http.post(Uri.parse(url), body :{
      'type': type,
      'tid':widget.UserID,
    });
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;

    }
  }

 Future getAudio () async {
    FilePickerResult? file = await FilePicker.platform.pickFiles(type: FileType.audio, allowMultiple: false);
      if (file!=null) {
        setState(() {
          bfile = file.files.first.bytes;
          filename = file.files.first.name;
          addAudio=true;

        });

      }
      else {
        // error please choose file !

      }
   // var url = 'http://bara111.000webhostapp.com/uploadtest.php';
    var url = 'http://localhost/uploadtest.php';
    var response = await http.post(Uri.parse(url), body: {
      'file':base64Encode(bfile),
      'name':filename,
    });

  }
  void UploadFiles() async{
    UploadTask task = FirebaseStorage.instance.ref().child("files/$filename").putData(bfile);
    task.snapshotEvents.listen((event) {
      setState(() {
       progress = ((event.bytesTransferred.toDouble()/event.totalBytes.toDouble())*100).roundToDouble();
       print(progress);
      });
    });
  }
  addSound(String x , String img,String type , String? tid)async{
    print (x);
    var url = 'http://localhost/imageStore.php';
    print(x+' '+type+' '+tid!);
    var response = await http.post(Uri.parse(url), body :{
      'word': x,
      'imageByte': img,
      'audio':filename,
      'type': type,
      'tid': tid,
      'sid':stuController.text==''?'-':stuController.text,
    });
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data.toString());}
  }
  Future<List<dynamic>?> getData(int type , String? tid) async{

    String x;
    String y;
    if(widget.UserKind=='student')
      {
        y=widget.UserID;
      }
    else
      {
        y='-';
      }
    print(y);

    if(type==1){
      setState(() {
        isA=true;
      });
      x="A";
    }
    else{
      setState(() {
        isA=false;
      });
      x="B";

    }
    var url = 'http://localhost/getSound.php';
    var response = await http.post(Uri.parse(url), body :{
      'type': x,
      'tid': tid,
      'sid': y,
    });
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;

    }


  }


  int _selectedType = 1;
  bool secT=false;
  bool imgUp = false;
  TextStyle unselectedTypeTextStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  TextStyle selectedTypeTextStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userKind = prefs.getString('userKind') ?? '';
      userId = prefs.getString('userId') ?? '';
    });
  }
 @override
  void initState() {
super.initState();
getUserData();
   if(secT){
     setState((){
       isA=false;
       _selectedType=0;
       addCheck = false;
       secT=false;
     });

   }
   else{
     setState((){
       isA=true;
       _selectedType=1;
       secT=true;
     });
   }
  }

  late final check=getData(1,(widget.tid).toString());
  late final check2=getData(2,(widget.tid).toString());
  late final stu=getStudents(userId);
  @override
  Widget build(BuildContext context) {
    if(isA) {
      return FutureBuilder<List<dynamic>?>(
        future: check,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Widget Stype(int x, int length) {
              Widget as = Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.start,
                        spacing: 35,
                        runAlignment: WrapAlignment.start,
                        runSpacing: 25,
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 20,
                                crossAxisCount: 3,
                                crossAxisSpacing: 20),
                            itemCount: length, itemBuilder: (context, index) {
                            return soundsWidget(
                              Name: snapshot.data![index]['word'],
                              Ipath: snapshot.data![index]['image'],
                              Spath: snapshot.data![index]['audio'],
                              s: snapshot.data![index]['imageByte'],
                              id: snapshot.data![index]['sound_id'],
                              state: snapshot.data![index]['newsound'],
                              tid: widget.UserID,

                            );
                          },),

                        ],

                      ),
                    ),


                  ],
                ),
              );
              Widget be = Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.start,
                        spacing: 35,
                        runAlignment: WrapAlignment.start,
                        runSpacing: 25,
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 20,
                                crossAxisCount: 3,
                                crossAxisSpacing: 20),
                            itemCount: length, itemBuilder: (context, index) {
                            return soundsWidget(  
                              Name: snapshot.data![index]['word'],
                              Ipath: snapshot.data![index]['image'],
                              Spath: snapshot.data![index]['audio'],
                              s: snapshot.data![index]['imageByte'],
                              id: snapshot.data![index]['sound_id'],
                              state: snapshot.data![index]['newsound'],
                              tid: widget.UserID,

                            );
                          },),

                        ],

                      ),
                    ),


                  ],
                ),
              );
              //  as 1 = استيعابي
              // 0 = بيئي be
              if (x == 1)
                return as;
              else
                return be;
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
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 1.2,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.8,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Visibility(
                                    maintainState: true,
                                    maintainAnimation: true,
                                    maintainSize: true,
                                    visible: widget.UserKind=='teacher'? true : false,
                                    child: FloatingActionButton(backgroundColor: Colors.green, // زر اختيار الصورة
                                        child:Icon(Icons.add_outlined),onPressed: (){
                                          showDialog(barrierDismissible: false,context: context, builder: (_)=>
                                              StatefulBuilder(
                                                  builder: (context, setState) {
                                               return AlertDialog(
                                                 title: FutureBuilder<List<dynamic>?>(future: stu,builder: (BuildContext context, snapshot) {
                                                   if(snapshot.hasData)
                                                     {
                                                       return   Container(
                                                         child: Column(
                                                           mainAxisAlignment: MainAxisAlignment.start,
                                                           children: [
                                                             Text('إضافة صوت استيعابي',style: TextStyle(
                                                               fontFamily: "DroidKufi",
                                                               fontWeight: FontWeight.w700,
                                                               color: Colors.green,
                                                             ),),
                                                             SizedBox(height: 30,),
                                                             Directionality(
                                                               textDirection: TextDirection.rtl,
                                                               child: TextField(
                                                                 textDirection: TextDirection.rtl,
                                                                 style: TextStyle(
                                                                   fontFamily: "DroidKufi",
                                                                   fontWeight: FontWeight.w500,
                                                                 ),
                                                                 controller: SnameCont,
                                                                 autofocus: false,
                                                                 maxLength: 20,
                                                                 decoration: InputDecoration(
                                                                   hintText: 'اسم الصوت',
                                                                   enabledBorder:OutlineInputBorder(
                                                                     borderSide: const BorderSide(color: Colors.green, width: 2),
                                                                   ),
                                                                   border: OutlineInputBorder(),
                                                                 ),
                                                               ),
                                                             ),
                                                             SizedBox(height: 20,),
                                                             Row(
                                                               mainAxisAlignment: MainAxisAlignment.center,

                                                               children: [
                                                                 FloatingActionButton( backgroundColor: Colors.green , child: Icon(Icons.remove_red_eye),onPressed: (){


                                                                   showDialog(barrierDismissible: true,context: context, builder: (_) {
                                                                     if(imgUp){  return AlertDialog(
                                                                       title: Column(
                                                                         children: [
                                                                           Image.memory(base64Decode(imageb),width: 300, height: 300,),
                                                                           SizedBox(height: 30,),
                                                                           SizedBox(
                                                                             height: 40,
                                                                             child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green),onPressed: (){
                                                                               Navigator.pop(context);
                                                                             }, child: Text("رجوع",style: TextStyle(fontFamily: "DroidKufi"),)),
                                                                           ),


                                                                         ],
                                                                       ),
                                                                     );}
                                                                     else return AlertDialog(title: Column(
                                                                       children: [
                                                                         Center(child: Text('لم يتم اختيار صورة')),
                                                                         SizedBox(height: 30,),
                                                                         SizedBox(
                                                                           height: 40,
                                                                           child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green),onPressed: (){
                                                                             Navigator.pop(context);
                                                                           }, child: Text("العودة",style: TextStyle(fontFamily: "DroidKufi"),)),
                                                                         ),


                                                                       ],
                                                                     ),);
                                                                   });
                                                                 }),
                                                                 SizedBox(width: 20,),
                                                                 SizedBox(
                                                                   width: 140,
                                                                   height: 50,
                                                                   child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green)
                                                                       ,onPressed: () {
                                                                         PickImage();

                                                                       }, child: Row(
                                                                         mainAxisAlignment: MainAxisAlignment.end,
                                                                         children: [
                                                                           Text(imgUp?'استبدال':'اختيار صورة',style:TextStyle(
                                                                             fontFamily: "DroidKufi",
                                                                           ) ,),
                                                                           SizedBox(
                                                                             width: 10,
                                                                           ),
                                                                           Icon(imgUp?Icons.refresh:Icons.upload),
                                                                         ],
                                                                       )),
                                                                 ),

                                                               ],
                                                             ),
                                                             SizedBox(height: 20,),
                                                             Row(
                                                               mainAxisAlignment: MainAxisAlignment.center,
                                                               children: [
                                                                 FloatingActionButton( backgroundColor: Colors.green , child: Icon(Icons.volume_up_rounded), onPressed: (){
                                                                   if (addAudio){
                                                                     //AssetsAudioPlayer.playAndForget(Audio("../audio/"+filename));
                                                                     assetsAudioPlayer!.open(Audio("../audio/"+filename),
                                                                         autoStart: true,
                                                                         showNotification: false,
                                                                         forceOpen: true);
                                                                     assetsAudioPlayer!.play();
                                                                   }
                                                                   else
                                                                   {
                                                                     return;
                                                                   }
                                                                 },),
                                                                 SizedBox(width: 20,),
                                                                 SizedBox(width: 140,height: 50,child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green), onPressed: () { getAudio(); },
                                                                   child: Row(
                                                                     children: [
                                                                       Text('اضافة صوت',style: TextStyle(
                                                                         fontFamily: 'DroidKufi',
                                                                       ),),
                                                                       SizedBox(
                                                                         width: 10,
                                                                       ),
                                                                       Icon(Icons.music_note),
                                                                     ],
                                                                   ),)),


                                                               ],
                                                             ),
                                                             SizedBox(height: 20,),
                                                             SizedBox(
                                                               height: 50,
                                                               child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green), onPressed: () async {
                                                                 var allList = await getAllSound('A1');

                                                                 showDialog(context: context, builder: (_){
                                                                   return AlertDialog(
                                                                     title: Container(
                                                                       child: Container(
                                                                         width: 600,
                                                                         height: 500,
                                                                         child: SingleChildScrollView(
                                                                           child: Column(
                                                                             children: [
                                                                               Column(
                                                                                 mainAxisAlignment: MainAxisAlignment.start,
                                                                                 children: [
                                                                                   Row(
                                                                                     children: [
                                                                                       Spacer(flex: 2,),
                                                                                       Text('اختر الصوت الذي تريد إضافته', style: TextStyle(color: Colors.green,fontFamily: 'DroidKufi',fontWeight: FontWeight.bold,fontSize: 25),),
                                                                                       Spacer(),
                                                                                       SizedBox(
                                                                                         height: 50,
                                                                                         child: FloatingActionButton(backgroundColor:Colors.green,onPressed: (){
                                                                                           Navigator.pop(context);
                                                                                         }, child: Icon(Icons.navigate_next_rounded,size: 30,)),
                                                                                       ),

                                                                                     ],
                                                                                   ),
                                                                                   SizedBox(height: 30,),
                                                                                   Padding(
                                                                                     padding: const EdgeInsets.symmetric(horizontal: 40),
                                                                                     child: Wrap(
                                                                                       crossAxisAlignment: WrapCrossAlignment.center,
                                                                                       alignment: WrapAlignment.start,
                                                                                       spacing: 35,
                                                                                       runAlignment: WrapAlignment.start,
                                                                                       runSpacing: 25,
                                                                                       children: [
                                                                                         GridView.builder(
                                                                                           shrinkWrap: true,
                                                                                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                                               mainAxisSpacing: 20,
                                                                                               crossAxisCount: 3,
                                                                                               crossAxisSpacing: 20),
                                                                                           itemCount: allList?.length, itemBuilder: (context, index) {
                                                                                           return soundsWidget(
                                                                                             Name: allList?[index]['word'],
                                                                                             Ipath: allList?[index]['image'],
                                                                                             Spath: allList?[index]['audio'],
                                                                                             s: allList?[index]['imageByte'],
                                                                                             id: allList?[index]['sound_id'],
                                                                                             state: allList?[index]['newsound'],
                                                                                             type: 'A1',
                                                                                             tid: widget.UserID,
                                                                                             //remove audio/ from it

                                                                                           );
                                                                                         },),

                                                                                       ],

                                                                                     ),
                                                                                   ),


                                                                                 ],
                                                                               ),
                                                                               SizedBox(
                                                                                 height: 30,
                                                                               ),

                                                                             ],
                                                                           ),
                                                                         ),
                                                                       ),
                                                                     ),


                                                                   );
                                                                 });

                                                               },
                                                                 child: Row(
                                                                   mainAxisAlignment: MainAxisAlignment.center,
                                                                   children: [
                                                                     Text('مكتبة الاصوات المتوفرة',style: TextStyle(
                                                                       fontFamily: 'DroidKufi',
                                                                     ),),
                                                                     SizedBox(
                                                                       width: 10,
                                                                     ),
                                                                     Icon(Icons.library_music),
                                                                   ],
                                                                 ),),
                                                             ),
                                                             SizedBox(height: 15,),
                                                             Text('اضافة تدريب لطالب معين :',style: TextStyle(
                                                               fontFamily: "DroidKufi",
                                                               fontSize: 13,
                                                               fontWeight: FontWeight.w600,
                                                               color: Colors.black,
                                                             )),
                                                             SizedBox(height: 10,),
                                                         DropdownButton<String>(
                                                             hint: Text(stuController.text),
                                                             isExpanded: true,
                                                             items: List.generate(
                                                                 snapshot.data!.length,
                                                                     (index) => DropdownMenuItem(
                                                                   value: snapshot.data![index]['Students_Id'],
                                                                   child: Text(
                                                                     snapshot.data![index]["firstname"]+" "+snapshot.data![index]["familyname"],
                                                                   ),
                                                                 )),
                                                             onChanged: (String? newValue) {
                                                               setState(() {
                                                                 stuController.text = newValue ?? '';
                                                               });
                                                             }),
                                                             SizedBox(height: 20,),
                                                             Visibility(
                                                               visible: addCheck,
                                                               child: Text(" خطأ ، قم بالتأكد من إضافة:\n اسم الصوت ، صورة ، صوت", style: TextStyle(
                                                                 fontFamily: "DroidKufi",
                                                                 fontSize: 13,
                                                                 fontWeight: FontWeight.w600,
                                                                 color: Colors.red[800],
                                                               ) ,),
                                                             ),
                                                             SizedBox(height: 20,),
                                                             Row(
                                                               mainAxisAlignment: MainAxisAlignment.center,

                                                               children: [
                                                                 SizedBox(
                                                                   height: 40,
                                                                   child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), onPressed: () {
                                                                     setState(() {
                                                                       addCheck = false;
                                                                       assetsAudioPlayer!.stop();
                                                                       addAudio=false;
                                                                       SnameCont.clear();
                                                                       imageb='';});
                                                                     Navigator.push(context,MaterialPageRoute(builder: (context) => voicex(UserID: widget.UserID, UserKind: widget.UserKind, tid: widget.tid,))).then((value) => (){
                                                                       setState(() {
                                                                         secT=true;
                                                                       });

                                                                     });


                                                                   }
                                                                     , child: Text('إغلاق'),),
                                                                 ),
                                                                 SizedBox(width: 20,),
                                                                 SizedBox(
                                                                   height: 40,
                                                                   child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[700]), onPressed: () {
                                                                     if (!imgUp || SnameCont.text==''||!addAudio){
                                                                       setState(() {

                                                                         addCheck = true;
                                                                       });

                                                                       // اظهار رسالة خطأ ( رفع صورة)

                                                                     }
                                                                     else{
                                                                       setState(() {
                                                                         assetsAudioPlayer!.stop();
                                                                         isA=false;
                                                                         addAudio=false;
                                                                         imgUp=false;
                                                                         addCheck = false;

                                                                       });
                                                                       addSound(SnameCont.text,imageb,'A',widget.UserID);
                                                                     }



                                                                   }
                                                                     , child: Text('حفظ'),),
                                                                 ),


                                                               ],
                                                             ),



                                                           ],
                                                         ),
                                                       );
                                                     }
                                                   else
                                                     return Center(child: CircularProgressIndicator(),);

                                                 },),


                                          );
                          }));


                                        }),
                                  ),
                                  const Spacer(flex: 3,),
                                  const Text("التدريبات الصوتية",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 30,
                                          fontFamily: "DroidKufi",
                                          fontWeight: FontWeight.w700)),
                                  const Spacer(flex: 2,),
                                  TextButton(
                                    // زر بدأ الاختبار
                                    onPressed: () {
                                      if (widget.UserKind=='teacher'){
                                        Navigator.push (
                                          context,
                                          MaterialPageRoute (
                                            builder: (BuildContext context) =>  expage(exid: '5'),
                                          ),
                                        );
                                      }
                                      else
                                        {
                                          Navigator.of(context)
                                              .push(
                                              MaterialPageRoute(builder: (context) {
                                                return betest(type: 2, sid: widget.UserID, isTeacher: false, );
                                              }));
                                        }

                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              8),
                                        ),
                                      ),
                                      minimumSize: MaterialStateProperty.all(
                                          const Size(120, 42)),
                                      textStyle: MaterialStateProperty.all(
                                          const TextStyle(
                                              fontFamily: "DroidKufi",
                                              fontSize: 16)),
                                      backgroundColor: MaterialStateProperty
                                          .all(
                                          const Color(0xff467BDB)),
                                    ),
                                    child: const Text(
                                      'بدأ الاختبار',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    // زر الاستيعابية
                                    onPressed: () {
                                      setState(() {
                                        _selectedType = 1;
                                      });
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                        ),
                                      ),
                                      minimumSize:
                                      MaterialStateProperty.all(
                                          const Size(85, 42)),
                                      textStyle: MaterialStateProperty.all(
                                          const TextStyle(
                                              fontFamily: "DroidKufi",
                                              fontSize: 20)),
                                      backgroundColor: MaterialStateProperty
                                          .all(
                                        _selectedType == 1
                                            ? Colors.green
                                            : Colors.grey,
                                      ),
                                    ),
                                    child: Text(
                                      'الاستيعابية',
                                      style: _selectedType == 1
                                          ? selectedTypeTextStyle
                                          : unselectedTypeTextStyle,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _selectedType = 0;
                                        setState(() {
                                          isA=false;
                                        });
                                      });
                                    },
                                    style: ButtonStyle(
                                      // زر البيئية

                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                        ),
                                      ),
                                      minimumSize: MaterialStateProperty.all(
                                          const Size(110, 42)),
                                      textStyle: MaterialStateProperty.all(
                                          const TextStyle(
                                              fontFamily: "DroidKufi",
                                              fontSize: 20)),
                                      backgroundColor: MaterialStateProperty
                                          .all(
                                        _selectedType == 0
                                            ? Colors.green
                                            : Colors.grey,
                                      ),
                                    ),
                                    child: Text(
                                      'البيئية',
                                      style: _selectedType == 0
                                          ? selectedTypeTextStyle
                                          : unselectedTypeTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  Stype(_selectedType, snapshot.data!.length),
                                  /*Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.green, width: 3.5),
                                borderRadius: BorderRadius.circular(30)

                            ),
                            child: Container(
                              child: soundsWidget(Name: 'اسم',Ipath: 'img/avocado.png', Spath: "audio/avoc.mp3", )
                            ),

                          ),
                          */
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          };
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
    else{
      return FutureBuilder<List<dynamic>?>(
        future: check2,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Widget Stype(int x, int length) {
              Widget as = Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.start,
                        spacing: 35,
                        runAlignment: WrapAlignment.start,
                        runSpacing: 25,
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 20,
                                crossAxisCount: 3,
                                crossAxisSpacing: 20),
                            itemCount: length, itemBuilder: (context, index) {
                            return soundsWidget(
                              Name: snapshot.data![index]['word'],
                              Ipath: snapshot.data![index]['image'],
                              Spath: snapshot.data![index]['audio'],
                              s: snapshot.data![index]['imageByte'],
                              id: snapshot.data![index]['sound_id'],
                              state: snapshot.data![index]['newsound'],
                              tid: widget.UserID,

                            );
                          },),

                        ],

                      ),
                    ),


                  ],
                ),
              );
              Widget be = Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.start,
                        spacing: 35,
                        runAlignment: WrapAlignment.start,
                        runSpacing: 25,
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 20,
                                crossAxisCount: 3,
                                crossAxisSpacing: 20),
                            itemCount: length, itemBuilder: (context, index) {
                            return soundsWidget(
                              Name: snapshot.data![index]['word'],
                              Ipath: snapshot.data![index]['image'],
                              Spath: snapshot.data![index]['audio'],
                              s: snapshot.data![index]['imageByte'],
                              id: snapshot.data![index]['sound_id'],
                              state: snapshot.data![index]['newsound'],
                              tid: widget.UserID,


                            );
                          },),

                        ],

                      ),
                    ),


                  ],
                ),
              );
              //  as 1 = استيعابي
              // 0 = بيئي be
              if (x == 1)
                return as;
              else
                return be;
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
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 1.2,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.8,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(

                                children: [
                                  Visibility(
                                    maintainState: true,
                                    maintainAnimation: true,
                                    maintainSize: true,
                                    visible: widget.UserKind=='teacher'? true : false,
                                    child: FloatingActionButton(backgroundColor: Colors.green, // زر اختيار الصورة
                                        child:Icon(Icons.add_outlined),onPressed: (){
                                          showDialog(barrierDismissible: false,context: context, builder: (_)=>
                                              StatefulBuilder(
                                                  builder: (context, setState) {
                                                    return  FutureBuilder<List<dynamic>?>(future: stu,builder: (BuildContext context, snapshot) {
                                                      if(snapshot.hasData)
                                                      {
                                                        return   Container(
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text('إضافة صوت بيئي',style: TextStyle(
                                                                fontFamily: "DroidKufi",
                                                                fontWeight: FontWeight.w700,
                                                                color: Colors.green,
                                                              ),),
                                                              SizedBox(height: 30,),
                                                              Directionality(
                                                                textDirection: TextDirection.rtl,
                                                                child: TextField(
                                                                  textDirection: TextDirection.rtl,
                                                                  style: TextStyle(
                                                                    fontFamily: "DroidKufi",
                                                                    fontWeight: FontWeight.w500,
                                                                  ),
                                                                  controller: SnameCont,
                                                                  autofocus: false,
                                                                  maxLength: 20,
                                                                  decoration: InputDecoration(
                                                                    hintText: 'اسم الصوت',
                                                                    enabledBorder:OutlineInputBorder(
                                                                      borderSide: const BorderSide(color: Colors.green, width: 2),
                                                                    ),
                                                                    border: OutlineInputBorder(),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(height: 20,),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,

                                                                children: [
                                                                  FloatingActionButton( backgroundColor: Colors.green , child: Icon(Icons.remove_red_eye),onPressed: (){


                                                                    showDialog(barrierDismissible: true,context: context, builder: (_) {
                                                                      if(imgUp){  return AlertDialog(
                                                                        title: Column(
                                                                          children: [
                                                                            Image.memory(base64Decode(imageb),width: 300, height: 300,),
                                                                            SizedBox(height: 30,),
                                                                            SizedBox(
                                                                              height: 40,
                                                                              child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green),onPressed: (){
                                                                                Navigator.pop(context);
                                                                              }, child: Text("رجوع",style: TextStyle(fontFamily: "DroidKufi"),)),
                                                                            ),


                                                                          ],
                                                                        ),
                                                                      );}
                                                                      else return AlertDialog(title: Column(
                                                                        children: [
                                                                          Center(child: Text('لم يتم اختيار صورة')),
                                                                          SizedBox(height: 30,),
                                                                          SizedBox(
                                                                            height: 40,
                                                                            child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green),onPressed: (){
                                                                              Navigator.pop(context);
                                                                            }, child: Text("العودة",style: TextStyle(fontFamily: "DroidKufi"),)),
                                                                          ),


                                                                        ],
                                                                      ),);
                                                                    });
                                                                  }),
                                                                  SizedBox(width: 20,),
                                                                  SizedBox(
                                                                    width: 140,
                                                                    height: 50,
                                                                    child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green)
                                                                        ,onPressed: () {
                                                                          PickImage();

                                                                        }, child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                          children: [
                                                                            Text(imgUp?'استبدال':'اختيار صورة',style:TextStyle(
                                                                              fontFamily: "DroidKufi",
                                                                            ) ,),
                                                                            SizedBox(
                                                                              width: 10,
                                                                            ),
                                                                            Icon(imgUp?Icons.refresh:Icons.upload),
                                                                          ],
                                                                        )),
                                                                  ),

                                                                ],
                                                              ),
                                                              SizedBox(height: 20,),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  FloatingActionButton( backgroundColor: Colors.green , child: Icon(Icons.volume_up_rounded), onPressed: (){
                                                                    if (addAudio){
                                                                      //AssetsAudioPlayer.playAndForget(Audio("../audio/"+filename));
                                                                      assetsAudioPlayer!.open(Audio("../audio/"+filename),
                                                                          autoStart: true,
                                                                          showNotification: false,
                                                                          forceOpen: true);
                                                                      assetsAudioPlayer!.play();
                                                                    }
                                                                    else
                                                                    {
                                                                      return;
                                                                    }
                                                                  },),
                                                                  SizedBox(width: 20,),
                                                                  SizedBox(width: 140,height: 50,child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green), onPressed: () { getAudio(); },
                                                                    child: Row(
                                                                      children: [
                                                                        Text('اضافة صوت',style: TextStyle(
                                                                          fontFamily: 'DroidKufi',
                                                                        ),),
                                                                        SizedBox(
                                                                          width: 10,
                                                                        ),
                                                                        Icon(Icons.music_note),
                                                                      ],
                                                                    ),)),


                                                                ],
                                                              ),
                                                              SizedBox(height: 20,),
                                                              SizedBox(
                                                                height: 50,
                                                                child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green), onPressed: () async {
                                                                  var allList = await getAllSound('B1');

                                                                  showDialog(context: context, builder: (_){
                                                                    return AlertDialog(
                                                                      title: Container(
                                                                        child: Container(
                                                                          width: 600,
                                                                          height: 500,
                                                                          child: SingleChildScrollView(
                                                                            child: Column(
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      children: [
                                                                                        Spacer(flex: 2,),
                                                                                        Text('اختر الصوت الذي تريد إضافته', style: TextStyle(color: Colors.green,fontFamily: 'DroidKufi',fontWeight: FontWeight.bold,fontSize: 25),),
                                                                                        Spacer(),
                                                                                        SizedBox(
                                                                                          height: 50,
                                                                                          child: FloatingActionButton(backgroundColor:Colors.green,onPressed: (){
                                                                                            Navigator.pop(context);
                                                                                          }, child: Icon(Icons.navigate_next_rounded,size: 30,)),
                                                                                        ),

                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(height: 30,),
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.symmetric(horizontal: 40),
                                                                                      child: Wrap(
                                                                                        crossAxisAlignment: WrapCrossAlignment.center,
                                                                                        alignment: WrapAlignment.start,
                                                                                        spacing: 35,
                                                                                        runAlignment: WrapAlignment.start,
                                                                                        runSpacing: 25,
                                                                                        children: [
                                                                                          GridView.builder(
                                                                                            shrinkWrap: true,
                                                                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                                                mainAxisSpacing: 20,
                                                                                                crossAxisCount: 3,
                                                                                                crossAxisSpacing: 20),
                                                                                            itemCount: allList?.length, itemBuilder: (context, index) {
                                                                                            return soundsWidget(
                                                                                              Name: allList?[index]['word'],
                                                                                              Ipath: allList?[index]['image'],
                                                                                              Spath: allList?[index]['audio'],
                                                                                              s: allList?[index]['imageByte'],
                                                                                              id: allList?[index]['sound_id'],
                                                                                              state: allList?[index]['newsound'],
                                                                                              type: 'B1',
                                                                                              tid: widget.UserID,
                                                                                              //remove audio/ from it

                                                                                            );
                                                                                          },),

                                                                                        ],

                                                                                      ),
                                                                                    ),


                                                                                  ],
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 30,
                                                                                ),

                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),


                                                                    );
                                                                  });

                                                                },
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      Text('مكتبة الاصوات المتوفرة',style: TextStyle(
                                                                        fontFamily: 'DroidKufi',
                                                                      ),),
                                                                      SizedBox(
                                                                        width: 10,
                                                                      ),
                                                                      Icon(Icons.library_music),
                                                                    ],
                                                                  ),),
                                                              ),
                                                              SizedBox(height: 10,),
                                                              Text('اضافة تدريب لطالب معين :',style: TextStyle(
                                                                fontFamily: "DroidKufi",
                                                                fontSize: 13,
                                                                fontWeight: FontWeight.w600,
                                                                color: Colors.black,
                                                              )),
                                                              SizedBox(height: 10,),
                                                              DropdownButton<String>(
                                                                  hint: Text(stuController.text),
                                                                  isExpanded: true,
                                                                  items: List.generate(
                                                                      snapshot.data!.length,
                                                                          (index) => DropdownMenuItem(
                                                                        value: snapshot.data![index]['Students_Id'],
                                                                        child: Text(
                                                                          snapshot.data![index]["firstname"]+" "+snapshot.data![index]["familyname"],
                                                                        ),
                                                                      )),
                                                                  onChanged: (String? newValue) {
                                                                    setState(() {
                                                                      stuController.text = newValue ?? '';
                                                                    });
                                                                  }),
                                                              SizedBox(height: 20,),
                                                              Visibility(
                                                                visible: addCheck,
                                                                child: Text(" خطأ ، قم بالتأكد من إضافة:\n اسم الصوت ، صورة ، صوت", style: TextStyle(
                                                                  fontFamily: "DroidKufi",
                                                                  fontSize: 13,
                                                                  fontWeight: FontWeight.w600,
                                                                  color: Colors.red[800],
                                                                ) ,),
                                                              ),
                                                              SizedBox(height: 20,),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,

                                                                children: [
                                                                  SizedBox(
                                                                    height: 40,
                                                                    child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), onPressed: () {
                                                                      setState(() {
                                                                        addCheck = false;
                                                                        assetsAudioPlayer!.stop();
                                                                        addAudio=false;
                                                                        SnameCont.clear();
                                                                        imageb='';});
                                                                      Navigator.push(context,MaterialPageRoute(builder: (context) => voicex(UserID: widget.UserID, UserKind: widget.UserKind, tid: widget.tid,))).then((value) => (){
                                                                        setState(() {
                                                                          secT=true;
                                                                        });

                                                                      });


                                                                    }
                                                                      , child: Text('إغلاق'),),
                                                                  ),
                                                                  SizedBox(width: 20,),
                                                                  SizedBox(
                                                                    height: 40,
                                                                    child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[700]), onPressed: () {
                                                                      if (!imgUp || SnameCont.text==''||!addAudio){
                                                                        setState(() {

                                                                          addCheck = true;
                                                                        });

                                                                        // اظهار رسالة خطأ ( رفع صورة)

                                                                      }
                                                                      else{
                                                                        setState(() {
                                                                          assetsAudioPlayer!.stop();
                                                                          isA=false;
                                                                          addAudio=false;
                                                                          imgUp=false;
                                                                          addCheck = false;

                                                                        });
                                                                        addSound(SnameCont.text,imageb,'B',widget.UserID);
                                                                      }



                                                                    }
                                                                      , child: Text('حفظ'),),
                                                                  ),


                                                                ],
                                                              ),



                                                            ],
                                                          ),
                                                        );
                                                      }
                                                      else
                                                        return Center(child: CircularProgressIndicator(),);

                                                    },);
                                                  }));


                                    }),
                                  ),
                                  const Spacer(flex: 3,),
                                  const Text("التدريبات الصوتية",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 30,
                                          fontFamily: "DroidKufi",
                                          fontWeight: FontWeight.w700)),
                                  const Spacer(flex: 2,),
                                  TextButton(
                                    // زر بدأ الاختبار
                                    onPressed: () {
                                      if (widget.UserKind=='teacher'){
                                        Navigator.push (
                                          context,
                                          MaterialPageRoute (
                                            builder: (BuildContext context) =>  expage(exid: '4'),
                                          ),
                                        );
                                      }
                                      else
                                      {
                                        Navigator.of(context)
                                            .push(
                                            MaterialPageRoute(builder: (context) {
                                              return betest(type: 1, sid: widget.UserID, isTeacher: false,);
                                            }));
                                      }
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              8),
                                        ),
                                      ),
                                      minimumSize: MaterialStateProperty.all(
                                          const Size(120, 42)),
                                      textStyle: MaterialStateProperty.all(
                                          const TextStyle(
                                              fontFamily: "DroidKufi",
                                              fontSize: 16)),
                                      backgroundColor: MaterialStateProperty
                                          .all(
                                          const Color(0xff467BDB)),
                                    ),
                                    child: const Text(
                                      'بدأ الاختبار',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    // زر الاستيعابية
                                    onPressed: () {
                                      setState(() {
                                        _selectedType = 1;
                                        setState(() {
                                          isA=true;
                                        });
                                      });
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                        ),
                                      ),
                                      minimumSize:
                                      MaterialStateProperty.all(
                                          const Size(85, 42)),
                                      textStyle: MaterialStateProperty.all(
                                          const TextStyle(
                                              fontFamily: "DroidKufi",
                                              fontSize: 20)),
                                      backgroundColor: MaterialStateProperty
                                          .all(
                                        _selectedType == 1
                                            ? Colors.green
                                            : Colors.grey,
                                      ),
                                    ),
                                    child: Text(
                                      'الاستيعابية',
                                      style: _selectedType == 1
                                          ? selectedTypeTextStyle
                                          : unselectedTypeTextStyle,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _selectedType = 0;
                                      });
                                    },
                                    style: ButtonStyle(
                                      // زر البيئية

                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                        ),
                                      ),
                                      minimumSize: MaterialStateProperty.all(
                                          const Size(110, 42)),
                                      textStyle: MaterialStateProperty.all(
                                          const TextStyle(
                                              fontFamily: "DroidKufi",
                                              fontSize: 20)),
                                      backgroundColor: MaterialStateProperty
                                          .all(
                                        _selectedType == 0
                                            ? Colors.green
                                            : Colors.grey,
                                      ),
                                    ),
                                    child: Text(
                                      'البيئية',
                                      style: _selectedType == 0
                                          ? selectedTypeTextStyle
                                          : unselectedTypeTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  Stype(_selectedType, snapshot.data!.length),
                                  /*Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.green, width: 3.5),
                                borderRadius: BorderRadius.circular(30)

                            ),
                            child: Container(
                              child: soundsWidget(Name: 'اسم',Ipath: 'img/avocado.png', Spath: "audio/avoc.mp3", )
                            ),

                          ),
                          */
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          };
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
Future PickImage() async {
    try {
      final image =  await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: false);
      if (image == null) return;
      final imageTemp = image.files.first.bytes;
     setState(() {
       imageb=base64Encode(imageTemp!);
       www = Text('data');
        imgUp=true;
     });

      return imageTemp;

      setState(() {
        //this.image =  imageTemp;
       // ConvertImage(imageTemp);
      });
    } on PlatformException catch (e){
      print(e);
    }
}
Future ConvertImage(File image) async {
  Image.memory(await image.readAsBytes());

  Uint8List imageBytes = await image.readAsBytes();
    String base64 = base64Encode(imageBytes);
  }


}