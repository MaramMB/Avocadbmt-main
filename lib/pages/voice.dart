import 'dart:html';

<<<<<<< Updated upstream
import 'dart:html' as html;

import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:file_picker/file_picker.dart';
=======
>>>>>>> Stashed changes
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/soundrecourd.dart';
import 'package:flutter_application_1/pages/soundtype.dart';
import 'package:flutter_application_1/pages/voicetestbe.dart';
import 'package:flutter_application_1/Components.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
var bfile;
var filename;
var progress;
int _value = 1;
<<<<<<< Updated upstream
late var imageb;
Widget www = Text('sss');
bool isA=true;
var SnameCont = TextEditingController();
=======
>>>>>>> Stashed changes

class voicex extends StatefulWidget {
  const voicex({Key? key}) : super(key: key);

  @override
  State<voicex> createState() => _voicexState();
}

class _voicexState extends State<voicex> {
<<<<<<< Updated upstream
  File? image;
  var audio;
 Future getAudio () async {
    FilePickerResult? file = await FilePicker.platform.pickFiles(type: FileType.audio, allowMultiple: false);
      if (file!=null) {
        setState(() {
          bfile = file.files.first.bytes;
          filename = file.files.first.name;
        });

      }
      else {
        // error please choose file !

      }

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
  addSound(String x , String img,String type)async{
    print (x);
    var url = 'http://localhost/imageStore.php';
    var response = await http.post(Uri.parse(url), body :{
      'word': x,
      'imageByte': img,
      'type': type,
    });
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data.toString());}
  }
  Future<List<dynamic>?> getData(int type) async{
    String x;
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
      'type': x
    });
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;

    }


  }
=======
>>>>>>> Stashed changes
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
 @override
  void initState() {
   if(secT){
     setState((){
       isA=false;
       _selectedType=0;
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

<<<<<<< Updated upstream
    super.initState();
=======
  Widget Stype(int x) {
    Widget as = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              soundsWidget(
                Name: 'مطر',
                Ipath: 'img/rain.gif',
                Spath: "audio/rain.mp3",
              ),
              SizedBox(
                width: 30,
              ),
              soundsWidget(
                Name: 'اسم',
                Ipath: 'img/avocado.png',
                Spath: "audio/avoc.mp3",
              ),
              SizedBox(
                width: 30,
              ),
              soundsWidget(
                Name: 'اسم',
                Ipath: 'img/avocado.png',
                Spath: "audio/avoc.mp3",
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              soundsWidget(
                Name: 'اسم',
                Ipath: 'img/avocado.png',
                Spath: "audio/avoc.mp3",
              ),
              SizedBox(
                width: 30,
              ),
              soundsWidget(
                Name: 'اسم',
                Ipath: 'img/avocado.png',
                Spath: "audio/avoc.mp3",
              ),
              SizedBox(
                width: 30,
              ),
              soundsWidget(
                Name: 'اسم',
                Ipath: 'img/avocado.png',
                Spath: "audio/avoc.mp3",
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              soundsWidget(
                Name: 'اسم',
                Ipath: 'img/avocado.png',
                Spath: "audio/avoc.mp3",
              ),
              SizedBox(
                width: 30,
              ),
              soundsWidget(
                Name: 'اسم',
                Ipath: 'img/avocado.png',
                Spath: "audio/avoc.mp3",
              ),
              SizedBox(
                width: 30,
              ),
              soundsWidget(
                Name: 'اسم',
                Ipath: 'img/avocado.png',
                Spath: "audio/avoc.mp3",
              ),
            ],
          ),
        ],
      ),
    );
    Widget be = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              soundsWidget(
                Name: 'اسم',
                Ipath: 'img/avocado.png',
                Spath: "audio/avoc.mp3",
              ),
              SizedBox(
                width: 30,
              ),
              soundsWidget(
                Name: 'اسم',
                Ipath: 'img/avocado.png',
                Spath: "audio/avoc.mp3",
              ),
              SizedBox(
                width: 30,
              ),
              soundsWidget(
                Name: 'اسم',
                Ipath: 'img/avocado.png',
                Spath: "audio/avoc.mp3",
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              soundsWidget(
                Name: 'اسم',
                Ipath: 'img/avocado.png',
                Spath: "audio/avoc.mp3",
              ),
              SizedBox(
                width: 30,
              ),
              soundsWidget(
                Name: 'اسم',
                Ipath: 'img/avocado.png',
                Spath: "audio/avoc.mp3",
              ),
              SizedBox(
                width: 30,
              ),
              soundsWidget(
                Name: 'اسم',
                Ipath: 'img/avocado.png',
                Spath: "audio/avoc.mp3",
              ),
            ],
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
>>>>>>> Stashed changes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: Container(
        child: Column(
          children: [
            const SelectionButton(),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.2,
              width: MediaQuery.of(context).size.width / 1.8,
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
                          const Spacer(),
                          const Spacer(),
                          const Text("التدريبات الصوتية",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 30,
                                  fontFamily: "DroidKufi",
                                  fontWeight: FontWeight.w700)),
                          const Spacer(),
                          TextButton(
                            // زر بدأ الاختبار
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return betest();
                              }));
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(120, 42)),
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(
                                      fontFamily: "DroidKufi", fontSize: 16)),
                              backgroundColor: MaterialStateProperty.all(
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
<<<<<<< Updated upstream
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  FloatingActionButton(backgroundColor: Colors.green, // زر اختيار الصورة
                                      child:Icon(Icons.add_outlined),onPressed: (){
                                        showDialog(barrierDismissible: false,context: context, builder: (_)=>AlertDialog(
                                          title: Container(
                                            child: Column(
                                              children: [
                                                TextField(

                                                  style: TextStyle(
                                                    fontFamily: "DroidKufi",
                                                    fontWeight: FontWeight.w700,
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
                                                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green)
                                                    ,onPressed: () {
                                                      //getHttp();
                                                      PickImage();

                                                    }, child: Row(
                                                      children: [
                                                        Icon(Icons.upload),
                                                        Text('أختيار صورة'),

                                                      ],
                                                    )),
                                                FloatingActionButton(child: Icon(Icons.remove_red_eye_outlined),onPressed: (){


                                                  showDialog(barrierDismissible: true,context: context, builder: (_) {
                                                    if(imgUp){  return AlertDialog(
                                                      title: Image.memory(base64Decode(imageb)),
                                                    );}
                                                    else return AlertDialog(title: Text('لا توجد صورة'),);

                                                  });
                                                }),
                                                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green), onPressed: () {
                                                  setState(() {
                                                    isA=false;
                                                    imgUp=false;
                                                    SnameCont.text='';
                                                    imageb='';
                                                  });
                                                  addSound(SnameCont.text,imageb,'A');

                                                }
                                                  , child: Text('حفظ'),),
                                                SizedBox(height: 20,),
                                                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), onPressed: () {

                                                  Navigator.push(context,MaterialPageRoute(builder: (context) => voicex())).then((value) => (){
                                                      setState(() {
                                                        secT=true;
                                                    });
                                                  });


                                                }
                                                  , child: Text('إغلاق'),),
                                                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green), onPressed: () { getAudio(); }, child: Text('اضافة صوت'),),
                                                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green), onPressed: () { UploadFiles(); }, child: Text('رفع'),),


                                              ],
                                            ),
                                          ),

                                        ));


                                      }),
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
                                      Navigator.of(context)
                                          .push(
                                          MaterialPageRoute(builder: (context) {
                                            return betest(type: _selectedType);
                                          }));
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
=======
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            // زر الاستيعابية
                            onPressed: () {
                              setState(() {
                                _selectedType = 1;
                                /*displayedList = soundList
                                    .where((element) => element.sounds.type == soundType.asteabe)
                                    .toList();*/
                              });
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
>>>>>>> Stashed changes
                              ),
                              minimumSize:
                                  MaterialStateProperty.all(const Size(85, 42)),
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(
                                      fontFamily: "DroidKufi", fontSize: 20)),
                              backgroundColor: MaterialStateProperty.all(
                                _selectedType == 1 ? Colors.green : Colors.grey,
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
                                /*  displayedList = soundList
                                    .where((element) => element.sounds.type == soundType.beae)
                                    .toList();*/
                              });
                            },
                            style: ButtonStyle(
                              // زر البيئية

                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(110, 42)),
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(
                                      fontFamily: "DroidKufi", fontSize: 20)),
                              backgroundColor: MaterialStateProperty.all(
                                _selectedType == 0 ? Colors.green : Colors.grey,
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
<<<<<<< Updated upstream
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
                    const SelectionButton(),
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
                                  FloatingActionButton(backgroundColor: Colors.green, // زر اختيار الصورة
                                      child:Icon(Icons.add_outlined),onPressed: (){
                                    showDialog(barrierDismissible: false,context: context, builder: (_)=>AlertDialog(
                                      title: Container(
                                        child: Column(
                                          children: [
                                            TextField(

                                              style: TextStyle(
                                                  fontFamily: "DroidKufi",
                                                  fontWeight: FontWeight.w700,
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
                                            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green)
                                           ,onPressed: () {
                                              //getHttp();
                                                  PickImage();

                                                }, child: Row(
                                             children: [
                                               Icon(Icons.upload),
                                               Text('أختيار صورة'),
                                             ],
                                           )),
                                            FloatingActionButton(child: Icon(Icons.remove_red_eye_outlined),onPressed: (){
                                              showDialog(barrierDismissible: true,context: context, builder: (_)=>AlertDialog(
                                               title: Image.memory(base64Decode(imageb)),
                                              ));
                                            }),
                                            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green), onPressed: () {
                                              addSound(SnameCont.text,imageb,'B');

                                            }
                                            , child: Text('حفظ'),),
                                            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), onPressed: () {

                                             Navigator.push(context,MaterialPageRoute(builder: (context) => voicex())).then((value) => (){
                                               setState(() {
                                                 isA=false;
                                                 imgUp=false;
                                                 SnameCont.text='';
                                                 imageb='';
                                               });

                                             });


                                            }

                                              , child: Text('إغلاق'),),


                                          ],
                                        ),
                                      ),

                                    ));


                                  }),
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
                                      Navigator.of(context)
                                          .push(
                                          MaterialPageRoute(builder: (context) {
                                            return betest(type: _selectedType);
                                          }));
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
=======
                      Column(
                        children: [
                          Stype(_selectedType),
                          /*Container(
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
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
      final image =  await FilePicker.platform.pickFiles(type: FileType.any, allowMultiple: false);
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
 void getHttp() async {

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    var path='';

    var filename='';

    if (result != null) {

      PlatformFile file = result.files.first;

      var path=file.path.toString();

      var filename=file.name;

      print(file.name);

      print(file.bytes);

      print(file.size);

      print(file.extension);

      print(file.path);

      var formData = FormData.fromMap({

        'name': '1',

        'age': '2',

        'fileToUpload' : await MultipartFile.fromFile(

            path,

            filename:filename,

            contentType: new MediaType("image", "jpeg")

=======
            )
          ],
>>>>>>> Stashed changes
        ),
      ),
    );
  }
}
