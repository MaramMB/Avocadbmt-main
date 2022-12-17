import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/testlogin.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;

class facevideo extends StatefulWidget {

  int index;
  facevideo({Key? key, required this.index}) : super(key: key);

  @override
  State<facevideo> createState() => _facevideoState();
}

class _facevideoState extends State<facevideo> {
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
        child: Column(
          children: [
             SelectionButton(),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.15,
              width: MediaQuery.of(context).size.width / 1.7,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                        SizedBox(height:5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            child: Center(
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                        SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white70, width: 2),
                              // borderRadius:
                              // BorderRadius.circular(30)
                          ),
                          width: MediaQuery.of(context).size.width / 1.9,
                          height: MediaQuery.of(context).size.height / 1.6,
                          // aspectRatio: 1.7,
                          child: flickManager != null
                              ? FlickVideoPlayer(
                              flickManager: myfilk[widget.index],
                              // flickVideoWithControls: FlickVideoWithControls(videoFit: BoxFit.fill,),
                              flickVideoWithControls:FlickVideoWithControls(willVideoPlayerControllerChange: true,videoFit: BoxFit.fill,),
                            // webKeyDownHandler: ,
                          )
                              : Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                              print(widget.index);
                            setState(() {
                              if(widget.index != 11){
                                widget.index ++;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) => super.widget));
                              }
                            else {
                              Fluttertoast.showToast(msg: "Doen");
                            }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            alignment: Alignment.bottomCenter,
                            backgroundColor: Colors.green,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                            elevation: 2.0,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                          ),
                          child: const Text("  التالي  ",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "DroidKufi",
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,

                              )),
                        ),
                        SizedBox(width: 45,),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              print(widget.index);
                              if(widget.index!=0){
                                widget.index --;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) => super.widget));
                              }
                              else{
                              Fluttertoast.showToast(msg: "No Videos");

                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            alignment: Alignment.bottomCenter,
                            backgroundColor: Colors.green,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                            elevation: 2.0,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                          ),
                          child: const Text(" السابق ",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "DroidKufi",
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,

                              )),
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

  int i = 0;
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
  ];
  @override
  void initState() {
    super.initState();
    getUserData();
    flickManager = FlickManager(
      autoPlay: false,
      videoPlayerController:VideoPlayerController.network('https://st.depositphotos.com/2923991/56603/v/600/depositphotos_566038476-stock-video-boy-of-9-years-is.mp4'),
    );
    flickManager1 = FlickManager(
      autoPlay: false,
      videoPlayerController:VideoPlayerController.network('https://st.depositphotos.com/2923991/56603/v/600/depositphotos_566038564-stock-video-boy-of-9-years-is.mp4'),
    );    flickManager2 = FlickManager(
      autoPlay: false,
      videoPlayerController: VideoPlayerController.network('https://st.depositphotos.com/2923991/56609/v/600/depositphotos_566092608-stock-video-boy-of-9-years-is.mp4'),
    );
    flickManager3 = FlickManager(
      videoPlayerController: VideoPlayerController.network('https://st.depositphotos.com/2923991/56609/v/600/depositphotos_566092908-stock-video-boy-of-9-years-is.mp4'),
      autoPlay: false,
    );
    flickManager4 = FlickManager(
      videoPlayerController: VideoPlayerController.network('https://st.depositphotos.com/2923991/56710/v/600/depositphotos_567103784-stock-video-boy-of-9-years-is.mp4'),
      autoPlay: false,
    );
    flickManager5 = FlickManager(
      videoPlayerController: VideoPlayerController.network('https://st.depositphotos.com/2923991/56919/v/600/depositphotos_569198438-stock-video-boy-of-9-years-is.mp4'),
      autoPlay: false,
    );
    flickManager6 = FlickManager(
      // videoPlayerController: VideoPlayerController.network("https://www.youtube.com/watch?v=WpQZtRA9m94"),
      videoPlayerController:VideoPlayerController.asset('img/spong.mp4'),
      autoPlay: false,
    );
    flickManager7 = FlickManager(
      // videoPlayerController: VideoPlayerController.network("https://www.youtube.com/watch?v=WpQZtRA9m94"),
      videoPlayerController:VideoPlayerController.asset('img/spong.mp4'),
      autoPlay: false,
    );
    flickManager8 = FlickManager(
      // videoPlayerController: VideoPlayerController.network("https://www.youtube.com/watch?v=WpQZtRA9m94"),
      videoPlayerController:VideoPlayerController.asset('img/spong.mp4'),
      autoPlay: false,
    );
    flickManager9 = FlickManager(
      // videoPlayerController: VideoPlayerController.network("https://www.youtube.com/watch?v=WpQZtRA9m94"),
      videoPlayerController:VideoPlayerController.asset('img/spong.mp4'),
      autoPlay: false,
    );
    flickManager10 = FlickManager(
      // videoPlayerController: VideoPlayerController.network("https://www.youtube.com/watch?v=WpQZtRA9m94"),
      videoPlayerController:VideoPlayerController.asset('img/spong.mp4'),
      autoPlay: false,
    );
    flickManager11 = FlickManager(
      // videoPlayerController: VideoPlayerController.network("https://www.youtube.com/watch?v=WpQZtRA9m94"),
      videoPlayerController:VideoPlayerController.asset('img/spong.mp4'),
      autoPlay: false,
    );
  }


}
