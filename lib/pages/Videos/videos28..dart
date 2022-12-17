import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../testlogin.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;

class Videos28 extends StatefulWidget {
  final name;
  const Videos28({Key? key, this.name}) : super(key: key);

  @override
  State<Videos28> createState() => _Videos28State();
}

class _Videos28State extends State<Videos28> {
  String? userKind;
  String userId = '';

  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userKind = prefs.getString('userKind') ?? '';
      userId = prefs.getString('userId') ?? '';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: Scrollbar(
        thickness: 10,
        isAlwaysShown: true,
        radius: const Radius.circular(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SelectionButton(),
          const SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.15,
                width: MediaQuery.of(context).size.width / 1.8,
                decoration: const BoxDecoration(
                  // color: Color(0x6BFFFFFF),
                  gradient: LinearGradient(
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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            Text(widget.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "DroidKufi",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                )),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_forward_sharp,
                                    color: Colors.white,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: backgreen),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Directionality(
                          textDirection:TextDirection.rtl,
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 5,
                              childAspectRatio: 1.3,
                              mainAxisSpacing: 0,
                              crossAxisCount: 3,
                            ),
                            itemCount: 28,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 2.0,
                                      child: flickManager != null
                                          ?     FlickVideoPlayer(
                                        flickManager: myfilk[index],
                                      )
                                          : Center(
                                          child:
                                          CircularProgressIndicator()),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      names[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily:"DroidKufi" ,
                                          fontSize: 16,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ))
          ]

        ),
      )
      )
    );
  }

  var names = [
    "ا",
    "ب",
    "ت",
    "ث",
    "ج",
    "ح",
    "خ",
    "د",
    "ذ",
    "ر",
    "ز",
    "س",
    "ش",
    "ص",
    "ض",
    "ط",
    "ظ",
    "ع",
    "غ",
    "ف",
    "ق",
    "ك",
    "ل",
    "م",
    "ن",
    "ه",
    "و",
    "ي",
  ];

  late FlickManager flickManager;
  late FlickManager flickManager1;
  late FlickManager flickManager2;
  late FlickManager flickManager3;
  late FlickManager flickManager4;
  late FlickManager flickManager5;
  late FlickManager flickManager6;
  late FlickManager flickManager7;
  late FlickManager flickManager8;
  late FlickManager flickManager9;
  late FlickManager flickManager10;
  late FlickManager flickManager11;
  late FlickManager flickManager12;
  late FlickManager flickManager13;
  late FlickManager flickManager14;
  late FlickManager flickManager15;
  late FlickManager flickManager16;
  late FlickManager flickManager17;
  late FlickManager flickManager18;
  late FlickManager flickManager19;
  late FlickManager flickManager20;
  late FlickManager flickManager21;
  late FlickManager flickManager22;
  late FlickManager flickManager23;
  late FlickManager flickManager24;
  late FlickManager flickManager25;
  late FlickManager flickManager26;
  late FlickManager flickManager27;

  late List<FlickManager> myfilk = [
    flickManager,
    flickManager1,
    flickManager2,
    flickManager3,
    flickManager4,
    flickManager5,
    flickManager6,
    flickManager7,
    flickManager8,
    flickManager9,
    flickManager10,
    flickManager11,
    flickManager12,
    flickManager13,
    flickManager14,
    flickManager15,
    flickManager16,
    flickManager17,
    flickManager18,
    flickManager19,
    flickManager20,
    flickManager21,
    flickManager22,
    flickManager23,
    flickManager24,
    flickManager25,
    flickManager26,
    flickManager27,
  ];
  bool autoPlay = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flickManager = FlickManager(

      autoPlay: false,
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/alf.mp4'),
    );
    flickManager1 = FlickManager(
      autoPlay: false,
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/ba.mp4'),
    );
    flickManager2 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/ta.mp4'),
      autoPlay: false,
    );
    flickManager3 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/tha.mp4'),
      autoPlay: false,
    );
    flickManager4 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/jem.mp4'),
      autoPlay: false,
    );
    flickManager5 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/ha.mp4'),

      autoPlay: false,
    );
    flickManager6 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/ka.mp4'),
      autoPlay: false,
    );
    flickManager7 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/d.mp4'),
      autoPlay: false,
    );
    flickManager8 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/thal.mp4'),
      autoPlay: false,
    );
    flickManager9 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/r.mp4'),
      autoPlay: false,
    );
    flickManager10 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/z.mp4'),
      autoPlay: false,
    );
    flickManager11 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/s.mp4'),
      autoPlay: false,
    );
    flickManager12 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/shen.mp4'),

      autoPlay: false,
    );    flickManager13 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/sad.mp4'),

      autoPlay: false,
    );
    flickManager14 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/dad.mp4'),
      autoPlay: false,
    );    flickManager15 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/taa.mp4'),
      autoPlay: false,
    );    flickManager16 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/thaa.mp4'),
      autoPlay: false,
    );    flickManager17 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/aen.mp4'),

      autoPlay: false,
    );    flickManager18 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/gen.mp4'),
      autoPlay: false,
    );    flickManager19 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/f.mp4'),
      autoPlay: false,
    );    flickManager20 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/g.mp4'),
      autoPlay: false,
    );    flickManager21 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/k.mp4'),
      autoPlay: false,
    );   flickManager22 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/l.mp4'),
      autoPlay: false,
    );    flickManager23 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/m.mp4'),
      autoPlay: false,
    );   flickManager24 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/non.mp4'),
      autoPlay: false,
    );   flickManager25 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/h.mp4'),
      autoPlay: false,
    );   flickManager26 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/w.mp4'),
      autoPlay: false,
    );   flickManager27 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/later/e.mp4'),
      autoPlay: false,
    );
  }
}