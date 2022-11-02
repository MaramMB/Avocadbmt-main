import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/audio.dart';
import 'package:flutter_application_1/pages/expl.dart';
import 'package:flutter_application_1/pages/faceexpl.dart';
import 'package:flutter_application_1/pages/latterexpl.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/soundrecourd.dart';
import 'package:flutter_application_1/pages/soundtype.dart';
import 'package:flutter_application_1/pages/speaktest.dart';
import 'package:flutter_application_1/pages/voiceexpl.dart';
import 'package:flutter_application_1/pages/voicetestbe.dart';
import 'package:flutter_application_1/pages/widgets/person_record.dart';

import 'manag.dart';
import 'models/person.dart';

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
  var soundList = [
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
        image: 'img/avocado.png',
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
      .toList();
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
                        TextButton(
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
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _selectedType = 1;
                              displayedList = soundList
                                  .where((element) => element.sounds.type == soundType.asteabe)
                                  .toList();
                            });
                          },
                          style: ButtonStyle(

                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(

                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all(const Size(85, 42)),
                            textStyle: MaterialStateProperty.all(const TextStyle(fontFamily: "DroidKufi",fontSize: 16)),
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
                              displayedList = soundList
                                  .where((element) => element.sounds.type == soundType.beae)
                                  .toList();
                            });
                          },
                          style: ButtonStyle(

                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(

                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all(const Size(110, 42)),
                            textStyle: MaterialStateProperty.all(const TextStyle(fontFamily: "DroidKufi",fontSize: 16)),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        //  ListView(
                        //   scrollDirection: Axis.horizontal,
                        //   children: displayedList.map((e) => e).toList(),
                        // ),
                        // const SizedBox(width: 15,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.green, width: 3.5),
                              borderRadius: BorderRadius.circular(30)

                          ),
                          child: Container(
                            child: GestureDetector(

                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (_) =>  AlertDialog(
                                      contentPadding: EdgeInsets.only(top: 30,right: 20,left: 20,bottom: 15),
                                      content: Container(
                                        width: MediaQuery.of(context).size.width/3.7,
                                        height: MediaQuery.of(context).size.height/1.8,
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.green, width: 3),
                                                  borderRadius: BorderRadius.circular(30)),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(25),
                                                child: Image.asset(
                                                  'img/avocado.png',
                                                  width: MediaQuery.of(context).size.width / 5,
                                                  height: MediaQuery.of(context).size.height / 3.6,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            const Text("افوكادو",
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 25,
                                                    fontFamily: "DroidKufi",
                                                    fontWeight: FontWeight.w700)),
                                            SizedBox(height: 16,),
                                            audio(),
                                            SizedBox(height: 20,),

                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context, rootNavigator: true).pop('dialog');
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
                                              child: const Text("العودة",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "DroidKufi",
                                                    fontSize: 18.0,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      shape:RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),side: BorderSide(color: Colors.black87,width: 2.5)),
                                      // Border.all(color: Colors.black87,width: 3.5),



                                    )

                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  'img/avocado.png',
                                  width: MediaQuery.of(context).size.width / 7,
                                  fit: BoxFit.fill,
                                ),
                              ),

                            ),
                          ),

                        ),

                      ],
                    ),


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
