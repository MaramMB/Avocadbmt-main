import 'dart:convert';
import 'dart:html';
import 'dart:math';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter_application_1/pages/audio.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/voice.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'mainpage.dart';
import 'manag.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int index = 0;
bool ShowMsg = false;
double _progressValue = 0;
bool isClicked = false;
bool isEnd=false;
int totalScore=0;
int isCorrect = 0;
final Ccontroller = ConfettiController();
late List<Map<String, Object>> testType;
List<Map<String, Object>> be = const [
  {
    'audio': 'audio/rain.mp3',
    'answers': [
      {'image': 'img/rain.gif', 'score': true},
      {'image': 'img/bcross.png', 'score': false},
      {'image': 'img/avocado.png', 'score': false},

    ],
  },

  {
    'audio': 'audio/avocado.mp3',
    'answers': [
      {'image': 'img/rain.gif', 'score': true},
      {'image': 'img/bcross.png', 'score': false},
      {'image': 'img/avocado.png', 'score': false},

    ],
  },

  {
    'audio': 'audio/rain.mp3',
    'answers': [
      {'image': 'img/rain.gif', 'score': true},
      {'image': 'img/bcross.png', 'score': false},
      {'image': 'img/avocado.png', 'score': false},

    ],
  },
];
List<Map<String, Object>> as = const [
  {
    'audio': 'audio/rain.mp3',
    'answers': [
      {'image': 'img/bcross.png', 'score': false},
      {'image': 'img/bcross.png', 'score': false},
      {'image': 'img/avocado.png', 'score': true},

    ],
  },

  {
    'audio': 'audio/avocado.mp3',
    'answers': [
      {'image': 'img/rain.gif', 'score': true},
      {'image': 'img/bcross.png', 'score': false},
      {'image': 'img/avocado.png', 'score': false},

    ],
  },

  {
    'audio': 'audio/rain.mp3',
    'answers': [
      {'image': 'img/rain.gif', 'score': true},
      {'image': 'img/bcross.png', 'score': false},
      {'image': 'img/avocado.png', 'score': false},

    ],
  },
];

class betest extends StatefulWidget {
   late int type;
   String? sid;

   betest({super.key, required this.type , required this.sid}){

     if(type==1)
     {
       testType = be;
     }
     else
     {
       testType = as;
     }
   }

   @override
  State<betest> createState() => _betestState();
}

class _betestState extends State<betest> {


  void initState() {
    super.initState();
    _progressValue = 0.0;
  }

  //functions
  void nextquestion()
  {
    audioPlayer.dispose();
    setState((){
      isCorrect = 0;

    });


    if (isClicked==false)
    {
      audioPlayer.dispose();

      setState((){
      ShowMsg=true;
      });
      return;
    }
    if (index + 1 == testType.length )
    {
      // finished
      AssetsAudioPlayer.playAndForget(Audio("audio/result.mp3"));

      setState((){
        isClicked = true;
        isEnd = true;


      });
      addTestResult(widget.type);
      // show dialog with the result **
      showDialog(context: context, builder: (context)=> AlertDialog(
        title: Container(
          width: 100,
          child: Center(
            child: Text(
              ' نتيجتك هي : $totalScore من ${testType.length} ',
                style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontFamily: "DroidKufi",
                fontWeight: FontWeight.w700),
            ),
          ),
        ) ,
      )
      );
    }
    else
    {
      ShowMsg=false;
      index++;
    }
  }

  void questionAnswered(bool? score)
  {
    // is correct
    setState((){
      isClicked = true;
      if (score!){
        totalScore++;
        AssetsAudioPlayer.playAndForget(Audio("audio/correct.mp3"));
        Cstop();
        isCorrect = 1;

      }


    });

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [

        Scaffold(
          backgroundColor: backgreen,
          body: Container(
            child: Column(
              children: [
                 SelectionButton(),
                 SizedBox(
                  height: 30,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.15,
                  width: MediaQuery.of(context).size.width / 1.8,
                  decoration:  BoxDecoration(
                    color: isCorrect == 1 ? Colors.green[100] : isCorrect == 2? Colors.red[100] : Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  // child: Stack(
                  //
                  // ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  LinearPercentIndicator(
                                    width: MediaQuery.of(context).size.width / 2,
                                    // backgroundColor: Colors.grey,
                                    animateFromLastPercent: true,
                                    percent: ((index as double)+1)/(testType.length),
                                     animation: true,
                                    lineHeight: 18.0,
                                     animationDuration: 500,
                                    // percent: 0.8,
                                    center:
                                    Text((index+1).toString() , style: TextStyle(
                                      color:  ((index as double)+1)/(testType.length) > 0.5 ? Colors.white : Colors.black
                                      ,fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),),
                                    barRadius: const Radius.circular(15),
                                    linearStrokeCap: LinearStrokeCap.roundAll,
                                    progressColor: Colors.green,
                                  ),
                                 const SizedBox(height: 20,),
                                 const Text("استمع الى الصوت واختر الصورة المناسبة",  style: TextStyle(
                                     color: Colors.green,
                                     fontSize: 25,
                                     fontFamily: "DroidKufi",
                                     fontWeight: FontWeight.w700)),
                                 const SizedBox(height: 35,),
                                  audio(path: testType[index]['audio'] as String),
                                 const SizedBox(height: 35,),
                                  Row(
                                    children: [
                                      const SizedBox(width: 15,),
                                      ...(testType[index]['answers'] as List<Map<String, Object>>).map((answer) => Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 7),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: isClicked? answer['score'] as bool ? Colors.green : Colors.red : Colors.black, width: 3.5
                                              ),
                                              borderRadius: BorderRadius.circular(30),

                                          ),
                                          child: GestureDetector(
                                            onTap: () {

                                              setState(() {
                                                (context as Element).reassemble();

                                                if (isClicked || isEnd)
                                                  {return;}
                                                if (answer['score'] as bool == false)
                                                {
                                                  AssetsAudioPlayer.playAndForget(Audio("audio/wrong.mp3"));
                                                  setState((){
                                                    isCorrect = 2;
                                                  });

                                                }
                                                questionAnswered(answer['score'] as bool);

                                              });
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(25),
                                              child: Image.asset(
                                                answer['image'] as String,
                                                width: MediaQuery.of(context).size.width / 7,
                                                fit: BoxFit.fill,
                                              ),
                                            ),

                                          ),

                                        ),
                                      ),),



                                    ],
                                  ),
                                  const SizedBox(height: 35,),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if(isEnd)
                                          {
                                            setState((){
                                              index =0;
                                              totalScore=0;
                                              isEnd=false;
                                            });

                                            Navigator.pop(context);
                                          }
                                        else {
                                          nextquestion();
                                          isClicked = false;
                                        }
                                      });

                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isEnd ? Colors.blueAccent : Colors.green,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                      elevation: 2.0,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 5),
                                    ),
                                    child:  Text(
                                        isEnd ? "العودة الى التدريب" : 'التالي',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "DroidKufi",
                                          fontSize: 18.0,
                                        )),
                                  ),
                                  SizedBox(height: 10,),
                                  Visibility(
                                    visible: ShowMsg ,
                                      child: Text(" * قم بإختيار إجابة قبل الانتقال الى السؤال التالي " ,textDirection: TextDirection.rtl, style: TextStyle(
                                        color: Colors.red[900],
                                        fontFamily: "DroidKufi",

                                      ),)),
                                ],
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
        ),
        ConfettiWidget(

          confettiController: Ccontroller,shouldLoop: false,
          blastDirectionality: BlastDirectionality.explosive,
          blastDirection: -pi / 2,
          numberOfParticles: 30,
          gravity: 0.1,

        ),

      ],
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    audioPlayer.dispose();
    super.dispose();
  }


  addTestResult(int type) async {
    print('dsadasdasdasads + '+ widget.sid.toString());
  String x;
  if (type == 1)
    {
      x='4';
    }
  else
    {
      x='5';
    }
    var url = 'http://localhost/addTestResult.php';
  print(totalScore);
    final response = await http.post(Uri.parse(url), body: {
      "stuid": (widget.sid).toString(),
      "result": (totalScore).toString(),
      "note": '** ',
      "testid" : x,
    });

  }
}
Cstop() async {
Ccontroller.play();
await Future.delayed(Duration(seconds: 1));
Ccontroller.stop();
}
