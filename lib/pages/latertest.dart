import 'dart:html';
import 'dart:convert';
import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/audio.dart';
import 'package:flutter_application_1/pages/latter.dart';
import 'package:flutter_application_1/pages/testlogin.dart';
import 'package:http/http.dart' as http;
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/expl.dart';
import 'package:flutter_application_1/pages/faceexpl.dart';
import 'package:flutter_application_1/pages/laterss.dart';
import 'package:flutter_application_1/pages/latterexpl.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/speaktest.dart';
import 'package:flutter_application_1/pages/voiceexpl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
final Ccontroller = ConfettiController();
int _value = 1;
bool played=false;


List<Map<String, String>> letters = const [
  {
    'letter': 'أ',
    'word' : 'أرنب',
    'img' : 'img/rabbit.png',

  },
  {
    'letter': 'ب',
    'word' : 'بطيخ',
    'img' : 'img/dad.png',

  },
  {
    'letter': 'ت',
    'word' : 'توت',
    'img' : 'img/berry.jpg',

  },
  {
    'letter': 'ث',
    'word' : 'ثوب',
    'img' : 'img/dress.jpg',

  },
  {
    'letter': 'ج',
    'word' : 'جرس',
    'img' : 'img/bell.jpg',

  },
  {
    'letter': 'ح',
    'word' : 'حوت',
    'img' : 'img/whale.jpg',

  },
  {
    'letter': 'خ',
    'word' : 'خوخ',
    'img' : 'img/peach.jpg',

  },
  {
    'letter': 'د',
    'word' : 'دب',
    'img' : 'img/bear.png',

  },
  {
    'letter': 'ذ',
    'word' : 'ذهب',
    'img' : 'img/gold.png',

  },
  {
    'letter': 'ر',
    'word' : 'رز',
    'img' : 'img/rice.jpg',

  },
  {
    'letter': 'ز',
    'word' : 'زر',
    'img' : 'img/buttonpng.png',

  },
  {
    'letter': 'س',
    'word' : 'سلم',
    'img' : 'img/ladder.jpg',

  },
  {
    'letter': 'ش',
    'word' : 'شاي',
    'img' : 'img/tea.png',

  },
  {
    'letter': 'ص',
    'word' : 'صوص',
    'img' : 'img/little chicken.jpg',

  },
  {
    'letter': 'ض',
    'word' : 'ضوء',
    'img' : 'img/bulb.jpg',

  },
  {
    'letter': 'ط',
    'word' : 'طفل',
    'img' : 'img/baby.png',

  },
  {
    'letter': 'ظ',
    'word' : 'ظرف',
    'img' : 'img/envelope.png',

  },
  {
    'letter': 'ع',
    'word' : 'عسل',
    'img' : 'img/honey.jpg',

  },
  {
    'letter': 'غ',
    'word' : 'غراب',
    'img' : 'img/cr.png',

  },
  {
    'letter': 'ف',
    'word' : 'فيل',
    'img' : 'img/elephant.jpg',

  },
  {
    'letter': 'ق',
    'word' : 'قلم',
    'img' : 'img/pencil.png',

  },
  {
    'letter': 'ك',
    'word' : 'كيك',
    'img' : 'img/cake.jpg',

  },

  {
    'letter': 'ل',
    'word' : 'ليمون',
    'img' : 'img/lemon.png',

  },
  {
    'letter': 'م',
    'word' : 'ماء',
    'img' : 'img/Water.jpg',

  },
  {
    'letter': 'ن',
    'word' : 'نار',
    'img' : 'img/fire.png',

  },
  {
    'letter': 'ه',
    'word' : 'هدهد',
    'img' : 'img/hoopoe.jpg',

  },
  {
    'letter': 'و',
    'word' : 'ورد',
    'img' : 'img/flowers.png',

  },
  {
    'letter': 'ي',
    'word' : 'يد',
    'img' : 'img/hand.jpg',

  },

];
late String isConnected='ـ';
bool isCorrect = false;
late stt.SpeechToText _speech;
late var locales =  _speech.locales();

bool _isListening = false;
String _text = '';
double _confidence = 1.0;


int search (String s){
  int x=0;
  for ( var i=0 ; i<letters.length;i++ )
  {
    if (letters[i]['letter']==s){
      x=i;
      if (s == 'أ'||s == 'د'||s == 'ذ'||s == 'ر'||s == 'ز'||s == 'و')
        {
          isConnected='';
        }
      else
        {
          isConnected='ـ';
        }
    }
  }
  return x;
}
class lettertest extends StatefulWidget {
 late String letter;
 final String userId;
 final String? userKind;
  lettertest({
    required this.letter, required this.userId, required this.userKind,
});

  @override
  State<lettertest> createState() => _lettertestState();
}

class _lettertestState extends State<lettertest> {
  String? userKind;
  String userId = '';

  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userKind = prefs.getString('userKind') ?? '';
      userId = prefs.getString('userId') ?? '';
    });
  }
  String phpurl = "http://localhost/spellRes.php";
  bool dberror = false;
  Future<void> sendData(String letter , String result) async {

    var res = await http.post(Uri.parse(phpurl), body: {
      "letter": letter,
      "result": result,
      'id':widget.userId,
    }); //sending post request with header data

    if (res.statusCode == 200) {
      print(res.body); //print raw response on console
      var data = json.decode(res.body); //decoding json to array
      if(data["error"]){
        setState(() {
          dberror = true;
        });
      }else{


      }

    }else{
      //there is error
      setState(() {
        dberror = true;

      });
    }
  }
  @override
  void initState() {

    super.initState();
    getUserData();
    _speech = stt.SpeechToText();
    locales =  _speech.locales();
    played = false;
  }
  late int Lindex = search(widget.letter);
  late String word= letters[Lindex]['word']!;
  late String Status = "إضغط على الزر وانطق الكلمة بشكل صحيح";

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: Column(
        children: [
           SelectionButton(),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.2,
            width: MediaQuery.of(context).size.width / 1.8,
            decoration: const BoxDecoration(
              // color: Color(0x6BFFFFFF),
              gradient:LinearGradient(
                colors: [
                  Color(0x6BFFFFFF),
                  Color(0x5FC3FFC3),
                  Color(0xA65D86A6),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children:   [
                SizedBox(
                  height: 30,
                ),
                Stack(
                  alignment: Alignment.center,
                    children: [

                  Container(

                    height: MediaQuery.of(context).size.height / 2.5,
                    width: MediaQuery.of(context).size.width / 3.5,
                    decoration:  BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.green, width: 5),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                      Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:10.0),
                                child: Image.asset(letters[Lindex]['img']!,
                                    height: MediaQuery.of(context).size.height / 4,
                                    alignment: Alignment.center
                                ),
                              ),
                              RichText(
                                text:  TextSpan(
                                  text: widget.letter + isConnected ,
                                  style: TextStyle(
                                  fontFamily: "ArbFONTS",
                                  color: Colors.red,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 45,
                                ),
                                  children: <TextSpan>[
                                    TextSpan(text: word.substring(1),
                                      style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "ArbFONTS",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 45,
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      ConfettiWidget(

                        confettiController: Ccontroller,shouldLoop: false,
                        blastDirectionality: BlastDirectionality.explosive,
                        blastDirection: - pi / 2,
                        numberOfParticles: 30,
                        gravity: 0.1,

                      ),

                ]),
                AvatarGlow(
                  animate: _isListening,
                  glowColor: Colors.red,
                  endRadius: 80.0,
                  duration: const Duration(milliseconds: 2000),
                  repeatPauseDuration: const Duration(milliseconds: 100),
                  repeat: true,
                  child: FloatingActionButton.large(
                    backgroundColor: _isListening? Colors.red : Colors.green,
                    onPressed: _listen
                    ,
                    child: Icon(_isListening ? Icons.mic : Icons.mic_none , size: 50,),
                  ),
                ),
                 Text(Status,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: "DroidKufi",
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 10,),

                Visibility(
                  visible: isCorrect,
                  child: ElevatedButton(
                    onPressed: () {
                      (context as Element).reassemble();
                      var count = 0;
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> letterex(userId: widget.userId, userKind: widget.userKind) ));
                      setState(() {
                        isCorrect = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                      elevation: 2.0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 12),
                    ),
                    child:  Text("التالي",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "DroidKufi",
                          fontSize: 20.0,
                        )),
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );

  }
  void _listen() async {
    if (!_isListening) {

      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),

      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
            onResult: (val) => setState(() {
              _text = val.recognizedWords;
              if(_text=='ارنب')
                {
                  setState((){
                    _text = 'أرنب';
                  });
                }
              if(_text=='ذره')
              {
                setState((){
                  _text = 'ذرة';
                });
              }
              if (_text==letters[Lindex]['word']){
                if(played==false){
                  AssetsAudioPlayer.playAndForget(Audio("audio/correct.mp3"));
                  setState(() {
                    played=true;
                  });
                }
                print('Correct !');
                setState(() {
                  sendData(letters[Lindex]['letter']!,'true');
                  isCorrect=true;
                  Status = "عمل رائع !";
                  _isListening = false;
                  _text='';
                  Cstop();
                  setState(() => _isListening = false);
                  _speech.stop();

                });
              }
              else
                {
                  if(played==false){
                    setState(() {
                      played=true;
                    });
                  }
                  print (letters[Lindex]['word']!+" - - - "+_text);
                  _text = '';
                  print ('wrong :| ');
                  isCorrect=false;
                  Status = "حاول مرة أخرى";


                }
              if (val.hasConfidenceRating && val.confidence > 0) {
                _confidence = val.confidence;
              }
            }),
            localeId: 'Ar-SA'
                ''
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

}


Cstop() async {
  Ccontroller.play();
  await Future.delayed(Duration(seconds: 1));
  Ccontroller.stop();
}