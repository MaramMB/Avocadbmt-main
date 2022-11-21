import 'dart:html';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'manag.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;

List<Map<String, String>> letters = const [
  {
    'letter': 'أ',
    'word' : 'أرنب',
    'img' : 'https://static.vecteezy.com/system/resources/previews/008/022/211/non_2x/cartoon-rabbit-holding-carrot-vector.jpg',

  },
  {
    'letter': 'ب',
    'word' : 'بطاطا',
    'img' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjglG7JgaQtWBY6DWrmnuuG3Z0JNW2oi3FUg&usqp=CAU',

  },
  {
    'letter': 'ت',
    'word' : 'تاء',
    'img' : 'https://youtu.be/NRAHR79_FD8',

  },
  {
    'letter': 'ث',
    'word' : 'ثاء',
    'img' : 'https://youtu.be/N9cDgSjmX2E',

  },
  {
    'letter': 'ج',
    'word' : 'جيم',
    'img' : 'https://youtu.be/wUX_1m0NJ5o',

  },
  {
    'letter': 'ح',
    'word' : 'حاء',
    'img' : 'https://youtu.be/569GkdUjPCo',

  },
  {
    'letter': 'خ',
    'word' : 'خاء',
    'img' : 'https://youtu.be/F-a8viuS4Bw',

  },
  {
    'letter': 'د',
    'word' : 'دال',
    'img' : 'https://youtu.be/p4mXFsF1FnY',

  },
  {
    'letter': 'ذ',
    'word' : 'ذال',
    'img' : 'https://youtu.be/SsVVi0EE7ow',

  },
  {
    'letter': 'ر',
    'word' : 'راء',
    'img' : 'https://youtu.be/1ZifdMbGjLE',

  },
  {
    'letter': 'ز',
    'word' : 'زاي',
    'img' : 'https://youtu.be/41LRxNKgnjk',

  },
  {
    'letter': 'س',
    'word' : 'سين',
    'img' : 'https://youtu.be/0OIh22MQXtM',

  },
  {
    'letter': 'ش',
    'word' : 'شين',
    'img' : 'https://youtu.be/EXwAa_MiRl0',

  },
  {
    'letter': 'ص',
    'word' : 'صاد',
    'img' : 'https://youtu.be/3usY54GS-0o',

  },
  {
    'letter': 'ض',
    'word' : 'ضاد',
    'img' : 'https://youtu.be/H6XWY5YiMVU',

  },
  {
    'letter': 'ط',
    'word' : 'طاء',
    'img' : 'https://youtu.be/Ueh2dk_sIw8',

  },
  {
    'letter': 'ظ',
    'word' : 'ظاء',
    'img' : 'https://youtu.be/QjrWwoRwkfw',

  },
  {
    'letter': 'ع',
    'word' : 'عين',
    'img' : 'https://youtu.be/u_qPMA7fP48',

  },
  {
    'letter': 'غ',
    'word' : 'غين',
    'img' : 'https://youtu.be/KXG-u2SOD7M',

  },
  {
    'letter': 'ف',
    'word' : 'فاء',
    'img' : 'https://youtu.be/my12d4B8als',

  },
  {
    'letter': 'ق',
    'word' : 'قاف',
    'img' : 'https://youtu.be/3vnUEw1L_RQ',

  },
  {
    'letter': 'ك',
    'word' : 'كاف',
    'img' : 'https://youtu.be/WsQKd8U7Nnk',

  },

  {
    'letter': 'ل',
    'word' : 'لام',
    'img' : 'https://youtu.be/lGhEbrUKKwQ',

  },
  {
    'letter': 'م',
    'word' : 'ميم',
    'img' : 'https://youtu.be/dtC7i-qBccI',

  },
  {
    'letter': 'ن',
    'word' : 'نون',
    'img' : 'https://youtu.be/J8R_RWnUf2E',

  },
  {
    'letter': 'ه',
    'word' : 'هاء',
    'img' : 'https://youtu.be/0x3OTCpJ4ys',

  },
  {
    'letter': 'و',
    'word' : 'واو',
    'img' : 'https://youtu.be/o6__TLsUvxA',

  },
  {
    'letter': 'ي',
    'word' : 'ياء',
    'img' : 'https://youtu.be/kLiXXdpGwqk',

  },

];
late String isConnected='ـ';
bool isCorrect = false;
late stt.SpeechToText _speech;
late var locales =  _speech.locales();

bool _isListening = false;
String _text = 'Press the button and start speaking';
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
  lettertest({
    required this.letter,
});

  @override
  State<lettertest> createState() => _lettertestState();
}

class _lettertestState extends State<lettertest> {
  String phpurl = "http://localhost/spellRes.php";
  bool dberror = false;
  Future<void> sendData(String letter , String result) async {

    var res = await http.post(Uri.parse(phpurl), body: {
      "letter": letter,
      "result": result,
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
    _speech = stt.SpeechToText();
    locales =  _speech.locales();
  }
  late int Lindex = search(widget.letter);
  late String word= letters[Lindex]['word']!;
  late String Status = "إضغط على الزر وانطق الكلمة بشكل صحيح";

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: Column(
        children: [
          const SelectionButton(),
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
                                child: Image.network(letters[Lindex]['img']!,
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
                    onPressed: _listen,
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
                      Navigator.popUntil(context, (route) {
                        return count++ == 2;
                      });
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
              if (_text==letters[Lindex]['word']){
                print('Correct !');
                setState(() {
                  sendData(letters[Lindex]['letter']!,'true');
                  isCorrect=true;
                  Status = "عمل رائع !";
                  _isListening = false;

                });
              }
              else
                {
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
            localeId: 'Ar-JO'
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


