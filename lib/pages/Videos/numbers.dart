import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/testlogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;

class Numbers extends StatefulWidget {
  final name;
  const Numbers({Key? key, this.name}) : super(key: key);

  @override
  State<Numbers> createState() => _NumbersState();
}

class _NumbersState extends State<Numbers> {
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
                            textDirection: TextDirection.rtl,
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
                              itemCount: 24,
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  var names = [
    "واحد",
    "أثنان",
    "ثلاثة",
    "أربعة",
    "خمسة",
    "ستة",
    "سبعة",
    "ثمانية",
    "تسعة",
    "عشرة",
    "أحدى عشر",
    "اثنا عشر",
    "ثلاثة عشر",
    "اربعة عشر",
    "خمسة عشر",
    "ستة عشر",
    "سبعة عشر",
    "ثمانية عشر",
    "تسعة عشر",
    "عشرون",
    "مئة",
    "ألف",
    "مليون",
    "مليار",
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
  ];
  bool autoPlay = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
      });
    });
    getUserData();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
      });
    });
    flickManager = FlickManager(

      autoPlay: false,
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/One.mp4'),
    );
    flickManager1 = FlickManager(
      autoPlay: false,
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/Two.mp4'),
    );
    flickManager2 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/Three.mp4'),
      autoPlay: false,
    );
    flickManager3 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/Four.mp4'),
      autoPlay: false,
    );
    flickManager4 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/Five.mp4'),
      autoPlay: false,
    );
    flickManager5 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/Six.mp4'),

      autoPlay: false,
    );
    flickManager6 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/Seven.mp4'),
      autoPlay: false,
    );
    flickManager7 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/Eight.mp4'),
      autoPlay: false,
    );
    flickManager8 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/Nine.mp4'),
      autoPlay: false,
    );
    flickManager9 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/Ten.mp4'),
      autoPlay: false,
    );
    flickManager10 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/Eleven.mp4'),
      autoPlay: false,
    );
    flickManager11 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/Twelve.mp4'),
      autoPlay: false,
    );
    flickManager12 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/Thirteen.mp4'),

      autoPlay: false,
    );    flickManager13 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/Fourteen.mp4'),

      autoPlay: false,
    );
    flickManager14 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/Fifteen.mp4'),
      autoPlay: false,
    );    flickManager15 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/Sixteen.mp4'),
      autoPlay: false,
    );    flickManager16 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/Seventeen.mp4'),
      autoPlay: false,
    );    flickManager17 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/Eighteen.mp4'),
      autoPlay: false,
    );    flickManager18 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/Nineteen.mp4'),
      autoPlay: false,
    );    flickManager19 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/Twenty.mp4'),
      autoPlay: false,
    );    flickManager20 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/OneHundred.mp4'),
      autoPlay: false,
    );    flickManager21 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/Thousand.mp4'),
      autoPlay: false,
    );   flickManager22 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/Million.mp4'),
      autoPlay: false,
    );    flickManager23 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/number/OneBillion.mp4'),
      autoPlay: false,
    );
  }
}