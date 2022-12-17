import 'dart:convert';
import 'dart:html';
import 'dart:math';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter_application_1/pages/audio.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/testlogin.dart';
import 'package:flutter_application_1/pages/voice.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:voice_message_package/voice_message_package.dart';
import 'mainpage.dart';


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
AssetsAudioPlayer? _Ap = AssetsAudioPlayer();
late List<Map<String, Object>> testType;
List<Map<String, Object>> as = const [
  {
    'audio': 'audio/Acar.mp3',
    'answers': [
      {'image': 'img/watch.jpg', 'score': false},
      {'image': 'img/car.jpg', 'score': true},
      {'image': 'img/bike.png', 'score': false},

    ],
  },

  {
    'audio': 'audio/doc.mp3',
    'answers': [
      {'image': 'img/doc.jpg', 'score': true},
      {'image': 'img/cop.jpg', 'score': false},
      {'image': 'img/Aball.jpg', 'score': false},

    ],
  },

  {
    'audio': 'audio/chair.mp3',
    'answers': [
      {'image': 'img/Achair.jpg', 'score': true},
      {'image': 'img/spoon.png', 'score': false},
      {'image': 'img/plant.png', 'score': false},

    ],
  },
  {
    'audio': 'audio/mama.mp3',
    'answers': [
      {'image': 'img/baba.jpg', 'score': false},
      {'image': 'img/window.jpg', 'score': false},
      {'image': 'img/mama.jpg', 'score': true},

    ],
  },
  {
    'audio': 'audio/spoon.mp3',
    'answers': [
      {'image': 'img/watch.jpg', 'score': false},
      {'image': 'img/spoon.png', 'score': true},
      {'image': 'img/fork.jpg', 'score': false},

    ],
  },
  {
    'audio': 'audio/Aball.mp3',
    'answers': [
      {'image': 'img/Aball.jpg', 'score': true},
      {'image': 'img/teacher.jpg', 'score': false},
      {'image': 'img/phone.jpg', 'score': false},

    ],
  },
  {
    'audio': 'audio/clock.mp3',
    'answers': [
      {'image': 'img/watch.jpg', 'score': true},
      {'image': 'img/board.jpg', 'score': false},
      {'image': 'img/table.jpg', 'score': false},

    ],
  },
  {
    'audio': 'audio/table.mp3',
    'answers': [
      {'image': 'img/plant.png', 'score': false},
      {'image': 'img/table.jpg', 'score': true},
      {'image': 'img/baba.jpg', 'score': false},

    ],
  },
  {
    'audio': 'audio/Ateacher.mp3',
    'answers': [
      {'image': 'img/curtain.png', 'score': false},
      {'image': 'img/doc.jpg', 'score': false},
      {'image': 'img/teacher.jpg', 'score': true},

    ],
  },
  {
    'audio': 'audio/fork.mp3',
    'answers': [
      {'image': 'img/fork.jpg', 'score': true},
      {'image': 'img/sofa.jpg', 'score': false},
      {'image': 'img/knife.png', 'score': false},

    ],
  },
  {
    'audio': 'audio/police.mp3',
    'answers': [
      {'image': 'img/cop.jpg', 'score': true},
      {'image': 'img/teacher.jpg', 'score': false},
      {'image': 'img/bike.png', 'score': false},

    ],
  },
  {
    'audio': 'audio/sofa.mp3',
    'answers': [
      {'image': 'img/window.jpg', 'score': false},
      {'image': 'img/plant.png', 'score': false},
      {'image': 'img/sofa.jpg', 'score': true},

    ],
  },
  {
    'audio': 'audio/knife.mp3',
    'answers': [
      {'image': 'img/board.jpg', 'score': false},
      {'image': 'img/car.jpg', 'score': false},
      {'image': 'img/knife.png', 'score': true},

    ],
  },
  {
    'audio': 'audio/curtain.mp3',
    'answers': [
      {'image': 'img/cop.jpg', 'score': false},
      {'image': 'img/curtain.png', 'score': true},
      {'image': 'img/table.jpg', 'score': false},

    ],
  },
  {
    'audio': 'audio/baba.mp3',
    'answers': [
      {'image': 'img/baba.jpg', 'score': true},
      {'image': 'img/knife.png', 'score': false},
      {'image': 'img/phone.jpg', 'score': false},

    ],
  },
  {
    'audio': 'audio/Aboard.mp3',
    'answers': [
      {'image': 'img/window.jpg', 'score': false},
      {'image': 'img/board.jpg', 'score': true},
      {'image': 'img/Aball.jpg', 'score': false},

    ],
  },
  {
    'audio': 'audio/Amobile.mp3',
    'answers': [
      {'image': 'img/watch.jpg', 'score': false},
      {'image': 'img/phone.jpg', 'score': true},
      {'image': 'img/spoon.png', 'score': false},

    ],
  },
  {
    'audio': 'audio/window.mp3',
    'answers': [
      {'image': 'img/window.jpg', 'score': true},
      {'image': 'img/plant.png', 'score': false},
      {'image': 'img/bike.png', 'score': false},

    ],
  },
  {
    'audio': 'audio/bike.mp3',
    'answers': [
      {'image': 'img/bike.png', 'score': true},
      {'image': 'img/curtain.png', 'score': false},
      {'image': 'img/car.jpg', 'score': false},

    ],
  },
  {
    'audio': 'audio/plant.mp3',
    'answers': [
      {'image': 'img/table.jpg', 'score': false},
      {'image': 'img/plant.png', 'score': true},
      {'image': 'img/board.jpg', 'score': false},

    ],
  },
];



List<Map<String, Object>> be = const [
  {
    'audio': 'audio/piano.mp3',//
    'answers': [
      {'image': 'img/hammer.gif', 'score': false},
      {'image': 'img/piano.gif', 'score': true},
      {'image': 'img/bell.gif', 'score': false},

    ],
  },

  {
    'audio': 'audio/Waterdrop.mp3',//
    'answers': [
      {'image': 'img/waterDrop.gif', 'score': true},
      {'image': 'img/car.gif', 'score': false},
      {'image': 'img/bird.gif', 'score': false},

    ],
  },

  {
    'audio': 'audio/Door.mp3',//
    'answers': [
      {'image': 'img/door.gif', 'score': true},
      {'image': 'img/clap.gif', 'score': false},
      {'image': 'img/babycrying.gif', 'score': false},

    ],
  },
  {
    'audio': 'audio/Policecar.mp3',//
    'answers': [
      {'image': 'img/plane.gif', 'score': false},
      {'image': 'img/babyLaugh.gif', 'score': false},
      {'image': 'img/copcar.gif', 'score': true},

    ],
  },
  {
    'audio': 'audio/Walking.mp3',//
    'answers': [
      {'image': 'img/bird.gif', 'score': false},
      {'image': 'img/walking.gif', 'score': true},
      {'image': 'img/ambalance.gif', 'score': false},

    ],
  },
  {
    'audio': 'audio/Rooster.mp3',//
    'answers': [
      {'image': 'img/roaster.gif', 'score': true},
      {'image': 'img/hammer.gif', 'score': false},
      {'image': 'img/fireplace.gif', 'score': false},

    ],
  },
  {
    'audio': 'audio/Airplane.mp3',//
    'answers': [
      {'image': 'img/plane.gif', 'score': true},
      {'image': 'img/rain.gif', 'score': false},
      {'image': 'img/telephone.gif', 'score': false},

    ],
  },
  {
    'audio': 'audio/Telephone.mp3',//
    'answers': [
      {'image': 'img/babycrying.gif', 'score': false},
      {'image': 'img/telephone.gif', 'score': true},
      {'image': 'img/piano.gif', 'score': false},

    ],
  },
  {
    'audio': 'audio/Clapping.mp3',//
    'answers': [
      {'image': 'img/bell.gif', 'score': false},
      {'image': 'img/roaster.gif', 'score': false},
      {'image': 'img/clap.gif', 'score': true},

    ],
  },
  {
    'audio': 'audio/Baby.mp3',//
    'answers': [
      {'image': 'img/babyLaugh.gif', 'score': true},
      {'image': 'img/ambalance.gif', 'score': false},
      {'image': 'img/copcar.gif', 'score': false},

    ],
  },
  {
    'audio': 'audio/Car.mp3',//
    'answers': [
      {'image': 'img/car.gif', 'score': true},
      {'image': 'img/cat.gif', 'score': false},
      {'image': 'img/waterDrop.gif', 'score': false},

    ],
  },
  {
    'audio': 'audio/Dog.mp3',//
    'answers': [
      {'image': 'img/door.gif', 'score': false},
      {'image': 'img/bird.gif', 'score': false},
      {'image': 'img/dog.gif', 'score': true},

    ],
  },
  {
    'audio': 'audio/BabyCrying.mp3',//
    'answers': [
      {'image': 'img/plane.gif', 'score': false},
      {'image': 'img/roaster.gif', 'score': false},
      {'image': 'img/babycrying.gif', 'score': true},

    ],
  },
  {
    'audio': 'audio/Bird.mp3',//
    'answers': [
      {'image': 'img/clap.gif', 'score': false},
      {'image': 'img/bird.gif', 'score': true},
      {'image': 'img/fireplace.gif', 'score': false},

    ],
  },
  {
    'audio': 'audio/bell.mp3',//
    'answers': [
      {'image': 'img/bell.gif', 'score': true},
      {'image': 'img/copcar.gif', 'score': false},
      {'image': 'img/dog.gif', 'score': false},

    ],
  },
  {
    'audio': 'audio/Ambulance.mp3',//
    'answers': [
      {'image': 'img/plane.gif', 'score': false},
      {'image': 'img/ambalance.gif', 'score': true},
      {'image': 'img/car.gif', 'score': false},

    ],
  },
  {
    'audio': 'audio/Cat.mp3',
    'answers': [
      {'image': 'img/bell.gif', 'score': false},
      {'image': 'img/cat.gif', 'score': true},
      {'image': 'img/hammer.gif', 'score': false},

    ],
  },
  {
    'audio': 'audio/hammering.mp3',
    'answers': [
      {'image': 'img/hammer.gif', 'score': true},
      {'image': 'img/walking.gif', 'score': false},
      {'image': 'img/fireplace.gif', 'score': false},

    ],
  },
  {
    'audio': 'audio/Fire.mp3',
    'answers': [
      {'image': 'img/fireplace.gif', 'score': true},
      {'image': 'img/cat.gif', 'score': false},
      {'image': 'img/clap.gif', 'score': false},

    ],
  },
  {
    'audio': 'audio/rain.mp3',
    'answers': [
      {'image': 'img/dog.gif', 'score': false},
      {'image': 'img/rain.gif', 'score': true},
      {'image': 'img/roaster.gif', 'score': false},

    ],
  },
];

class betest extends StatefulWidget {
   late int type;
   String sid;
   bool isTeacher = false;

   betest({super.key, required this.type , required this.sid , required this.isTeacher}){

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
    print('id : '+widget.sid);
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
      addTestResult(widget.type);
      AssetsAudioPlayer.playAndForget(Audio("audio/result.mp3"));

      setState((){
        isClicked = true;
        isEnd = true;


      });
      // show dialog with the result **
      showDialog(context: context, builder: (context)=> AlertDialog(
        title: Container(
          width: 100,
          child: Center(
            child: Column(
              children: [
                Text(
                  ' نتيجتك هي : $totalScore من ${testType.length} ',
                    style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontFamily: "DroidKufi",
                    fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green),onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("العودة",style: TextStyle(fontFamily: "DroidKufi"),)),
                ),
              ],
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
                                  SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: FloatingActionButton(backgroundColor: Colors.green,onPressed: (){
                                      _Ap!.open(Audio(testType[index]['audio'] as String),
                                        autoStart: true,
                                        showNotification: false,
                                      forceOpen: true);
                                      _Ap!.play();
                                     // AssetsAudioPlayer.playAndForget(Audio(testType[index]['audio'] as String));
                                    }, child: Icon(Icons.volume_up_rounded)),
                                  ),
                                  SizedBox(width: 10,),
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
                                                height: MediaQuery.of(context).size.height / 3.8,
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
                                          setState(() {

                                          });
                                          nextquestion();
                                          isClicked = false;
                                          _Ap!.stop();

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
  int kind;
  if (type == 1)
    {
      x='4';
    }
  else
    {
      x='5';
    }
  if (widget.isTeacher)
    {
      kind = 0;
    }
  else
    {
      kind = 1;
    }
    var url = 'http://localhost/addTestResult.php';
  print(totalScore);
    var response = await http.post(Uri.parse(url), body: {
      'stuid': (widget.sid).toString(),
      'result': (totalScore).toString(),
      'note': '-',
      'testid': x,
      'home' : kind.toString(),
    });

  }
}
Cstop() async {
Ccontroller.play();
await Future.delayed(Duration(seconds: 1));
Ccontroller.stop();
}
