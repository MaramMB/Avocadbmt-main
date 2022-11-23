import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Videos/single_video.dart';
import 'package:flutter_application_1/pages/expl.dart';
import 'package:flutter_application_1/pages/faceexpl.dart';
import 'package:flutter_application_1/pages/facevideo.dart';
import 'package:flutter_application_1/pages/latterexpl.dart';
import 'package:flutter_application_1/pages/mainpage.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/speaktest.dart';
import 'package:flutter_application_1/pages/voiceexpl.dart';
import 'package:video_player/video_player.dart';

import 'manag.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;
class faceex extends StatefulWidget {
  const faceex({Key? key}) : super(key: key);

  @override
  State<faceex> createState() => _faceexState();
}

class _faceexState extends State<faceex> {
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
    flickManager = FlickManager(
      autoPlay: false,
      // videoPlayerController: VideoPlayerController.network("https://www.youtube.com/watch?v=WpQZtRA9m94"),
      videoPlayerController:VideoPlayerController.asset('img/spong.mp4'),
    );
    flickManager1 = FlickManager(
      autoPlay: false,
      // videoPlayerController: VideoPlayerController.network("https://www.youtube.com/watch?v=WpQZtRA9m94"),
      videoPlayerController:VideoPlayerController.asset('img/spong.mp4'),
    );    flickManager2 = FlickManager(
      autoPlay: false,
      // videoPlayerController: VideoPlayerController.network("https://www.youtube.com/watch?v=WpQZtRA9m94"),
      videoPlayerController:VideoPlayerController.asset('img/spong.mp4'),
    );
    flickManager3 = FlickManager(
      // videoPlayerController: VideoPlayerController.network("https://www.youtube.com/watch?v=WpQZtRA9m94"),
      videoPlayerController:VideoPlayerController.asset('img/spong.mp4'),
      autoPlay: false,
    );
    flickManager4 = FlickManager(
      // videoPlayerController: VideoPlayerController.network("https://www.youtube.com/watch?v=WpQZtRA9m94"),
      videoPlayerController:VideoPlayerController.asset('img/spong.mp4'),
      autoPlay: false,
    );
    flickManager5 = FlickManager(
      // videoPlayerController: VideoPlayerController.network("https://www.youtube.com/watch?v=WpQZtRA9m94"),
      videoPlayerController:VideoPlayerController.asset('img/spong.mp4'),
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

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
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
              SelectionButton(),
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
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(
                    // fit: StackFit.expand,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children:  [
                            Center(
                              child: Text("التدريبات الحركية للفم",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 25,
                                      fontFamily: "DroidKufi",
                                      fontWeight: FontWeight.w700)),

                            ),
                            SizedBox(height: 10,),
                            GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 9,
                                childAspectRatio: 1.35,
                                mainAxisSpacing: 0,
                                crossAxisCount: 3,
                              ),
                              itemCount: 12,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: AspectRatio(
                                    aspectRatio: 5.5,
                                    child: flickManager != null ?  Column(
                                      children: [
                                        FlickVideoPlayer(
                                            flickManager: myfilk[index],

                                        ),
                                        
                                        // SizedBox(height: 10,),
                                        // IconButton(
                                        //     onPressed: () {
                                        //       Navigator.push(
                                        //           context,
                                        //           MaterialPageRoute(
                                        //               builder: (context) => SingleVideo(index: index,)));
                                        //     },
                                        //     icon: Icon(
                                        //       Icons.start,
                                        //       size: 20,
                                        //       color: Colors.green,
                                        //     )),
                                        SizedBox(height: 7,),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(builder: (context) {
                                              return  facevideo(index: index,);
                                            }));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            alignment: Alignment.bottomCenter,
                                            backgroundColor: Colors.green,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.all(Radius.circular(14))),
                                            elevation: 2.0,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 18, vertical: 10),
                                          ),
                                          child: const Text("انتقل للتدريب",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "DroidKufi",
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w600,

                                              )),
                                        ),
                                      ],
                                    )
                                        : Center(child: CircularProgressIndicator()),
                                  ),
                                );
                              },
                            ),



                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
