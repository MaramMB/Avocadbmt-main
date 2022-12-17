import 'package:animate_do/animate_do.dart';
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

class Transprot extends StatefulWidget {
  final name;
  const Transprot({Key? key, this.name}) : super(key: key);

  @override
  State<Transprot> createState() => _TransprotState();
}

class _TransprotState extends State<Transprot> {
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
                          GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 12,
                              childAspectRatio: 1.2,
                              mainAxisSpacing: 0,
                              crossAxisCount: 3,
                            ),
                            itemCount: 14,
                            itemBuilder: (BuildContext context, int index) {
                              return FadeInUpBig(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: AspectRatio(
                                    aspectRatio: 5.5,
                                    child: flickManager != null ?  Column(
                                      children: [
                                        FlickVideoPlayer(
                                          flickManager: myfilk[index],

                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          names[index],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily:"DroidKufi" ,
                                              fontSize: 16,
                                              color: Colors.white),
                                        )
                                      ],)
                                        : Center(child: CircularProgressIndicator()),
                                  ),),
                              );
                            },
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
    "سيارة إسعاف",
    "جسر",
    "باص",
    "سيارة",
    "رافعة",
    "دراجة نارية",
    "طائرة",
    "سفينة",
    "محطة",
    "شارع",
    "تكسي",
    "قطار",
    "مواصلات",
    "شاحنة",
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
  ];
  @override
  void initState() {
    super.initState();
    getUserData();
    flickManager = FlickManager(

      autoPlay: false,
      videoPlayerController:VideoPlayerController.asset('assets/dic/transport/Ambulance@سيارة إسعاف.mp4'),
    );
    flickManager1 = FlickManager(
      autoPlay: false,
      videoPlayerController:VideoPlayerController.asset('assets/dic/transport/Bridge@جسر.mp4'),
    );
    flickManager2 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/transport/Bus@باص.mp4'),
      autoPlay: false,
    );
    flickManager3 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/transport/Car@سيارة.mp4'),
      autoPlay: false,
    );
    flickManager4 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/transport/Crane@رافعة.mp4'),
      autoPlay: false,
    );
    flickManager5 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/transport/Motorcycle@دراجة نارية.mp4'),

      autoPlay: false,
    );
    flickManager6 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/transport/Plane@طائرة.mp4'),
      autoPlay: false,
    );
    flickManager7 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/transport/Ship@سفينة.mp4'),
      autoPlay: false,
    );
    flickManager8 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/transport/Station@محطة.mp4'),
      autoPlay: false,
    );
    flickManager9 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/transport/Street@شارع.mp4'),
      autoPlay: false,
    );
    flickManager10 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/transport/Taxi@تكسي.mp4'),
      autoPlay: false,
    );
    flickManager11 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/transport/Train@قطار.mp4'),
      autoPlay: false,
    );
    flickManager12 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/transport/Transportation@مواصلات.mp4'),

      autoPlay: false,
    );    flickManager13 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/transport/Truck@شاحنة.mp4'),

      autoPlay: false,
    );
  }
}