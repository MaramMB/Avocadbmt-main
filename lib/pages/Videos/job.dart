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

class Job extends StatefulWidget {
  final name;
  const Job({Key? key, this.name}) : super(key: key);

  @override
  State<Job> createState() => _JobState();
}

class _JobState extends State<Job> {
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
                              crossAxisSpacing: 5,
                              childAspectRatio: 1.3,
                              mainAxisSpacing: 0,
                              crossAxisCount: 3,
                            ),
                            itemCount: 15,
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
                        ],
                      ),
                    ),
                  ),
                )
              )
            ])))
    );
  }

  var names = [
    "ممثل",
    "رسام",
    "مكانيني سيارات",
    "نجار",
    "طباخ",
    "طبيب",
    "مزارع",
    "بقال",
    "كوافير",
    "صحفي",
    "محامي",
    "ممرضة",
    "طيار",
    "شرطي",
    "مُعلم",
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
      videoPlayerController:VideoPlayerController.asset('assets/dic/job/Actor.mp4'),
    );
    flickManager1 = FlickManager(
      autoPlay: false,
      videoPlayerController:VideoPlayerController.asset('assets/dic/job/Artist.mp4'),
    );
    flickManager2 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/job/AutoMechanic.mp4'),
      autoPlay: false,
    );
    flickManager3 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/job/Carpenter.mp4'),
      autoPlay: false,
    );
    flickManager4 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/job/Cook.mp4'),
      autoPlay: false,
    );
    flickManager5 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/job/Doctor.mp4'),

      autoPlay: false,
    );
    flickManager6 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/job/Farmer.mp4'),
      autoPlay: false,
    );
    flickManager7 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/job/Grocer.mp4'),
      autoPlay: false,
    );
    flickManager8 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/job/Hairdresser.mp4'),
      autoPlay: false,
    );
    flickManager9 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/job/Journalist.mp4'),
      autoPlay: false,
    );
    flickManager10 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/job/Lawyer.mp4'),
      autoPlay: false,
    );
    flickManager11 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/job/Nurse.mp4'),
      autoPlay: false,
    );
    flickManager12 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/job/Pilot.mp4'),

      autoPlay: false,
    );    flickManager13 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/job/Police.mp4'),

      autoPlay: false,
    );
    flickManager14 = FlickManager(
      videoPlayerController:VideoPlayerController.asset('assets/dic/job/Teacher.mp4'),
      autoPlay: false,
    );
  }
}


