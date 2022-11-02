import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/soundrecourd.dart';
import 'package:flutter_application_1/pages/soundtype.dart';
import 'package:flutter_application_1/pages/voicetestbe.dart';
import 'package:flutter_application_1/Components.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;
class voicex extends StatefulWidget {
  const voicex({Key? key}) : super(key: key);

  @override
  State<voicex> createState() => _voicexState();
}

class _voicexState extends State<voicex> {
  int _selectedType = 1;
  TextStyle unselectedTypeTextStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  TextStyle selectedTypeTextStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  Widget Stype (int x){
    Widget as = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              soundsWidget(Name: 'اسم',Ipath: 'img/avocado.png', Spath: "audio/avoc.mp3", ),
              SizedBox(width: 30,),
              soundsWidget(Name: 'اسم',Ipath: 'img/avocado.png', Spath: "audio/avoc.mp3", ),
              SizedBox(width: 30,),
              soundsWidget(Name: 'اسم',Ipath: 'img/avocado.png', Spath: "audio/avoc.mp3", ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              soundsWidget(Name: 'اسم',Ipath: 'img/avocado.png', Spath: "audio/avoc.mp3", ),
              SizedBox(width: 30,),
              soundsWidget(Name: 'اسم',Ipath: 'img/avocado.png', Spath: "audio/avoc.mp3", ),
              SizedBox(width: 30,),
              soundsWidget(Name: 'اسم',Ipath: 'img/avocado.png', Spath: "audio/avoc.mp3", ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              soundsWidget(Name: 'اسم',Ipath: 'img/avocado.png', Spath: "audio/avoc.mp3", ),
              SizedBox(width: 30,),
              soundsWidget(Name: 'اسم',Ipath: 'img/avocado.png', Spath: "audio/avoc.mp3", ),
              SizedBox(width: 30,),
              soundsWidget(Name: 'اسم',Ipath: 'img/avocado.png', Spath: "audio/avoc.mp3", ),
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
              soundsWidget(Name: 'اسم',Ipath: 'img/avocado.png', Spath: "audio/avoc.mp3", ),
              SizedBox(width: 30,),
              soundsWidget(Name: 'اسم',Ipath: 'img/avocado.png', Spath: "audio/avoc.mp3", ),
              SizedBox(width: 30,),
              soundsWidget(Name: 'اسم',Ipath: 'img/avocado.png', Spath: "audio/avoc.mp3", ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              soundsWidget(Name: 'اسم',Ipath: 'img/avocado.png', Spath: "audio/avoc.mp3", ),
              SizedBox(width: 30,),
              soundsWidget(Name: 'اسم',Ipath: 'img/avocado.png', Spath: "audio/avoc.mp3", ),
              SizedBox(width: 30,),
              soundsWidget(Name: 'اسم',Ipath: 'img/avocado.png', Spath: "audio/avoc.mp3", ),
            ],
          ),

        ],
      ),
    );
    //  as 1 = استيعابي
    // 0 = بيئي be
    if (x==1)return as;
    else return be;
  }
  /*var soundList = [
    soundrecord(
      sounds: sound(
        word: 'افوكادو',
        id: '2',
        image: 'img/avocado.png',
        voice: 'audio/avoc.mp3',
        type: soundType.asteabe,
      ),
    ),
    soundrecord(
      sounds: sound(
        word: 'مطر',
        id: '3',
        image: 'img/btick.png',
        voice: 'audio/avoc.mp3',
        type: soundType.beae,
      ),
    ),
  ];
  late List<soundrecord> displayedList = _selectedType == 1
      ? soundList
      .where((element) => element.sounds.type == soundType.beae)
      .toList()
      : soundList
      .where((element) => element.sounds.type == soundType.asteabe)
      .toList();*/
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
              // child: Stack(
              //
              // ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:  [
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
                          TextButton( // زر بدأ الاختبار
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return  betest();
                              }));
                            },
                            style: ButtonStyle(

                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(

                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),

                              minimumSize: MaterialStateProperty.all(const Size(120, 42)),
                              textStyle: MaterialStateProperty.all(const TextStyle(fontFamily: "DroidKufi",fontSize: 16)),
                              backgroundColor: MaterialStateProperty.all(const Color(0xff467BDB)),
                            ),
                            child: const Text(
                              'بدأ الاختبار',style: TextStyle(
                              color: Colors.white,
                            ),

                            ),
                          ),

                        ],
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          TextButton( // زر الاستيعابية
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
                              ),
                              minimumSize: MaterialStateProperty.all(const Size(85, 42)),
                              textStyle: MaterialStateProperty.all(const TextStyle(fontFamily: "DroidKufi",fontSize: 20)),
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
                            style: ButtonStyle( // زر البيئية

                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(

                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all(const Size(110, 42)),
                              textStyle: MaterialStateProperty.all(const TextStyle(fontFamily: "DroidKufi",fontSize: 20)),
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
                      const SizedBox(height: 20,),
                      Column(
                        children:  [
                          Stype(_selectedType),
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
  }
}
