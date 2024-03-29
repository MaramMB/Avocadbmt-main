import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/audio.dart';
import 'package:flutter_application_1/pages/laterss.dart';
import 'package:flutter_application_1/pages/voice.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


class soundsWidget extends StatefulWidget {
  late String Spath; //sound path
  late String Ipath;// Image path
  late String Name; // name of the sound
  late String s;
  late String id;
  late String state;
  late String type;
  late String tid;

  soundsWidget({
    required this.Spath ,
    required this.Ipath ,
    required this.Name,
    required this.s,
    required this.id,
    required this.state,
    this.type='',
    required this.tid,
  });

  @override
  State<soundsWidget> createState() => _soundsWidgetState();
}

class _soundsWidgetState extends State<soundsWidget> {
  @override

  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 5),
          ),
        ],
          border: Border.all(
              color: const Color(0xFF83BE63), width: 3.5),
          borderRadius: BorderRadius.circular(30),),
      child: GestureDetector(
        onTap: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (_) =>  AlertDialog(
                contentPadding: const EdgeInsets.only(top: 30,right: 20,left: 20,bottom: 15),
                content: Container(
                  width: MediaQuery.of(context).size.width/3.9,
                  height: MediaQuery.of(context).size.height/1.5,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.green, width: 3),
                                borderRadius: BorderRadius.circular(30)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.memory(base64Decode(widget.s),width: MediaQuery.of(context).size.width / 5,
                                height: MediaQuery.of(context).size.height / 3.0,
                                fit: BoxFit.fill,),
                            ),
                          ),
                          Text(widget.Name,
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 25,
                                  fontFamily: "DroidKufi",
                                  fontWeight: FontWeight.w700)),
                          const SizedBox(height: 10,),
                          audio(path: "../"+widget.Spath),
                          const SizedBox(height: 15,),

                          ElevatedButton(
                            onPressed: () {
                              if(widget.type=='A1' || widget.type=='B1')
                                {
                                  addSound();
                                  Fluttertoast.showToast(msg: 'تم إضافة الصوت بنجاح');
                                  Navigator.of(context, rootNavigator: true).pop();
                                  
                                }
                              else{
                                audioPlayer.dispose();
                                Navigator.of(context, rootNavigator: true).pop();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              elevation: 2.0,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                            ),
                            child: Text((widget.type!='A1' && widget.type!='B1')?"العودة":"إضافة الصوت",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "DroidKufi",
                                  fontSize: 22.0,
                                )),
                          ),
                          const SizedBox(height: 15,),

                          Visibility(
                            visible:(widget.type=='A1' || widget.type=='B1')?true:false,
                            child: ElevatedButton(
                              onPressed: () {

                                  audioPlayer.dispose();
                                  Navigator.of(context, rootNavigator: true).pop();

                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                elevation: 2.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                              ),
                              child: Text("العودة",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "DroidKufi",
                                    fontSize: 22.0,
                                  )),
                            ),
                          ),

                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Visibility(
                              visible: (widget.state =='0' || (widget.type=='A1'||widget.type=='B1')) ? false : true,
                              child: FloatingActionButton(backgroundColor: Colors.redAccent,onPressed: (){
                                showDialog(context: context, builder: (context)=>AlertDialog(
                                  title: Container(
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Text('هل أنت متأكد من حذف التدريب ؟', style: TextStyle(
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
                                              onPressed: () async {
                                              deleteSound(widget.id);
                                              Fluttertoast.showToast(msg: "تمت عملية الحذف بنجاح");

                                              Navigator.push (
                                                context,
                                                MaterialPageRoute (
                                                  builder: (BuildContext context) => voicex(UserID: widget.tid, UserKind: 'teacher', tid: widget.tid),
                                                ),
                                              ).then((value) => setState((){}));
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


                              },  child: Icon(Icons.delete_forever_rounded),),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
                shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),side: const BorderSide(color: Colors.black87,width: 3.0)),
                // Border.all(color: Colors.black87,width: 3.5),

              )

          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.memory(base64Decode(widget.s),width: MediaQuery.of(context).size.width / 9,
            fit: BoxFit.fill,),/* Image.asset(
            Ipath,
            width: MediaQuery.of(context).size.width / 9,
            fit: BoxFit.fill,
          ),*/
        ),

      ),
    );

  }

  addSound()async{
    var x;
    if (widget.type=='A1')x='A';
    else x ='B';
    var url = 'http://localhost/imageStore.php';
    print('tid is '+widget.tid);
    var response = await http.post(Uri.parse(url), body :{
      'word': widget.Name,
      'imageByte': widget.s,
      'audio':widget.Spath,
      'type': x,
      'tid': widget.tid,
      'isAdd':'yes',
    });
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data.toString());}
  }

  deleteSound(String id) async {
    var url = 'http://localhost/deleteSound.php';
    var response = await http.post(Uri.parse(url), body: {
      'id':id,
    });

  }
}

//       Letters Page

class letter extends StatefulWidget {
  late String L1,L2,L3,L4,L5,title;
  final String userId;          // L = letter
  final String? userKind;          // L = letter
  letter({
    required this.L1,
    required this.L2,
    required this.L3,
    required this.L4,
    required this.L5,
    required this.title, required this.userId, required this.userKind,
});
  @override
  State<letter> createState() => _letterState();
}

class _letterState extends State<letter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return  letterss(L1: widget.L1,L2: widget.L2,L3: widget.L3,L4: widget.L4,L5:widget.L5, title: widget.title, userId: widget.userId, UserKind: widget.userKind ,);
            }));
          },
          child: Stack(
            alignment: Alignment.center,

            children: [
              Container(
                width: MediaQuery.of(context).size.width / 9.5,
                height: MediaQuery.of(context).size.height /5.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueAccent,
                    boxShadow:const [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: Offset.zero
                      ),
                    ]
                ),
              ),
              Row(
                children: [
                  Visibility(
                    visible: widget.L5=='' ? false:true,
                    child: Text("${widget.L5} ",
                        style:  const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: "DroidKufi",
                            fontWeight: FontWeight.w700)),
                  ),
                  Visibility(
                    visible: widget.L4=='' ? false:true,
                    child: Text("${widget.L4} ",
                        style:  const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: "DroidKufi",
                            fontWeight: FontWeight.w700)),
                  ),
                  Visibility(
                    visible: widget.L3=='' ? false:true,
                    child: Text("${widget.L3} ",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: "DroidKufi",
                            fontWeight: FontWeight.w700)),
                  ),
                  Visibility(
                    visible: widget.L2=='' ? false:true,
                    child: Text("${widget.L2} ",
                        style: const TextStyle(

                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: "DroidKufi",
                            fontWeight: FontWeight.w700)),
                  ),
                  Visibility(
                    visible: widget.L1=='' ? false:true,
                    child: Text("${widget.L1} ",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: "DroidKufi",
                            fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ],
          ),
        ),
         Text(widget.title,
            style: const TextStyle(
                shadows:[
                  Shadow(
                      color: Colors.black54,
                      blurRadius: 10,
                    offset: Offset(5, 5),
                  )
                ],
                color: Colors.white,
                fontSize: 18,
                fontFamily: "DroidKufi",
                fontWeight: FontWeight.w700)),
      ],
    );
  }
}


