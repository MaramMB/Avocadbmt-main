import 'dart:html';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/soundrecourd.dart';
import 'package:flutter_application_1/pages/soundtype.dart';
import 'package:flutter_application_1/pages/voicetestbe.dart';
import 'package:flutter_application_1/Components.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;
bool isA=true;
final SnameCont = TextEditingController();

class voicex extends StatefulWidget {
  const voicex({Key? key}) : super(key: key);

  @override
  State<voicex> createState() => _voicexState();
}

class _voicexState extends State<voicex> {
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
    var url = 'http://192.168.1.106/getSound.php';
    var response = await http.post(Uri.parse(url), body :{
      'type': x
    });
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data.toString());
      return data;

    }


  }
  int _selectedType = 1;
  TextStyle unselectedTypeTextStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  TextStyle selectedTypeTextStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );


  late final check=getData(1);
  late final check2=getData(2);
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
                                  FloatingActionButton(backgroundColor: Colors.green,
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
                                              getHttp();
                                                }, child: Row(
                                             children: [
                                               Icon(Icons.upload),
                                               Text('أختيار صورة'),
                                             ],
                                           ))
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

        ),

      });

      Response response = await Dio().post('http://192.168.1.106/imgStore.php', data: formData);

      print(response.data.toString());

    } else {

    }

  }
}
