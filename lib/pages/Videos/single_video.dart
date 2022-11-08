import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;

class SingleVideo extends StatefulWidget {
  int index;
  SingleVideo({Key? key, required this.index}) : super(key: key);

  @override
  State<SingleVideo> createState() => _SingleVideoState();
}

class _SingleVideoState extends State<SingleVideo> {
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
            const SelectionButton(),
            const SizedBox(
              height: 30,
            ),
            Container(
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        Container(),
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
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: backgreen),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: IconButton(
                                onPressed: () {
                                  if (widget.index == 11) {
                                    Fluttertoast.showToast(msg: "Doen");
                                  } else {
                                    setState(() {
                                      widget.index++;
                                    });
                                  }
                                },
                                icon: Icon(
                                  Icons.arrow_left,
                                  color: Colors.white,
                                  size: 40,
                                ))),
                        Expanded(
                          flex: 5,
                          child: AspectRatio(
                            aspectRatio: 2,
                            child: _controller != null
                                ? YoutubePlayerIFrame(
                                    controller: myControllers[widget.index])
                                : Center(child: CircularProgressIndicator()),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: IconButton(
                                onPressed: () {
                                  if (widget.index == 0) {
                                    Fluttertoast.showToast(msg: "No Videos");
                                  } else {
                                    setState(() {
                                      widget.index = widget.index - 1;
                                    });
                                  }
                                },
                                icon: Icon(
                                  Icons.arrow_right,
                                  color: Colors.white,
                                  size: 40,
                                ))),
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

  late YoutubePlayerController _controller;
  late YoutubePlayerController _controller1;
  late YoutubePlayerController _controller2;
  late YoutubePlayerController _controller3;
  late YoutubePlayerController _controller4;
  late YoutubePlayerController _controller5;
  late YoutubePlayerController _controller6;
  late YoutubePlayerController _controller7;
  late YoutubePlayerController _controller8;
  late YoutubePlayerController _controller9;
  late YoutubePlayerController _controller10;
  late YoutubePlayerController _controller11;

  late List<YoutubePlayerController> myControllers = [
    _controller,
    _controller1,
    _controller2,
    _controller3,
    _controller4,
    _controller5,
    _controller6,
    _controller7,
    _controller8,
    _controller9,
    _controller10,
    _controller11,
  ];

  bool autoPlay = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = YoutubePlayerController()
      ..onInit = () {
        _controller.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
    _controller1 = YoutubePlayerController()
      ..onInit = () {
        _controller1.loadVideoById(videoId: 'HHjSdy9l7Kc', startSeconds: 30);
      };
    _controller2 = YoutubePlayerController()
      ..onInit = () {
        _controller2.loadVideoById(videoId: 'LTA9bwp-RrU', startSeconds: 30);
      };
    _controller3 = YoutubePlayerController()
      ..onInit = () {
        _controller3.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
    _controller4 = YoutubePlayerController()
      ..onInit = () {
        _controller4.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
    _controller5 = YoutubePlayerController()
      ..onInit = () {
        _controller5.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
    _controller6 = YoutubePlayerController()
      ..onInit = () {
        _controller6.loadVideoById(videoId: '1mgA2wKQF8', startSeconds: 30);
      };
    _controller7 = YoutubePlayerController()
      ..onInit = () {
        _controller7.loadVideoById(videoId: '9bx40C_3giQ', startSeconds: 30);
      };
    _controller8 = YoutubePlayerController()
      ..onInit = () {
        _controller8.loadVideoById(videoId: 'srQiGhegTCs', startSeconds: 30);
      };
    _controller9 = YoutubePlayerController()
      ..onInit = () {
        _controller9.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
    _controller10 = YoutubePlayerController()
      ..onInit = () {
        _controller10.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
    _controller11 = YoutubePlayerController()
      ..onInit = () {
        _controller11.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
  }

  // bool? autoPlay;
  // final controller1 = YoutubePlayerController(
  //   initialVideoId: 'K18cpp_-gP8',
  //   params: YoutubePlayerParams(
  //     startAt: Duration(seconds: 30),
  //     autoPlay: true,
  //   ),
  // );
  // final _con2 = YoutubePlayerController()
  //   ..onInit = () {
  //     if (autoPlay) {
  //       _controller.loadVideoById(videoId: 'K18cpp_-gP8', startSeconds: 30);
  //     } else {
  //       _controller.cueVideoById(videoId: 'K18cpp_-gP8', startSeconds: 30);
  //     }
  //   };
  // @override
  // void initState() {
  //   super.initState();
  //   _setOrientation([
  //     DeviceOrientation.landscapeRight,
  //     DeviceOrientation.landscapeLeft,
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ]);

  //   WidgetsBinding.instance!.addPostFrameCallback((_) {
  //     setState(() {
  //       _controller = YoutubePlayerController(
  //         initialVideoId: "K18cpp_-gP8",
  //         params: YoutubePlayerParams(
  //           showFullscreenButton: true,
  //           autoPlay: false,
  //         ),
  //       );
  //     });
  //   });
  //   _controller = VideoPlayerController.network(
  //       'https://www.youtube.com/watch?v=HHjSdy9l7Kc')
  //     ..initialize().then((_) {
  //       // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //       setState(() {});
  //     });
  // _controller1 =
  //     VideoPlayerController.network('https://youtu.be/mxHICfk1Hj0 ')
  //       ..initialize().then((_) {
  //         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //         setState(() {});
  //       });
  // _controller2 =
  //     VideoPlayerController.network('https://youtu.be/mxHICfk1Hj0 ')
  //       ..initialize().then((_) {
  //         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //         setState(() {});
  //       });
  // _controller3 =
  //     VideoPlayerController.network('https://youtu.be/mxHICfk1Hj0 ')
  //       ..initialize().then((_) {
  //         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //         setState(() {});
  //       });
  // _controller4 =
  //     VideoPlayerController.network('https://youtu.be/mxHICfk1Hj0 ')
  //       ..initialize().then((_) {
  //         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //         setState(() {});
  //       });
  // _controller2 =
  //     VideoPlayerController.network('https://youtu.be/mxHICfk1Hj0 ')
  //       ..initialize().then((_) {
  //         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //         setState(() {});
  //       });
  // _controller5 =
  //     VideoPlayerController.network('https://youtu.be/mxHICfk1Hj0 ')
  //       ..initialize().then((_) {
  //         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //         setState(() {});
  //       });
  // _controller6 =
  //     VideoPlayerController.network('https://youtu.be/mxHICfk1Hj0 ')
  //       ..initialize().then((_) {
  //         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //         setState(() {});
  //       });
  // _controller7 =
  //     VideoPlayerController.network('https://youtu.be/mxHICfk1Hj0 ')
  //       ..initialize().then((_) {
  //         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //         setState(() {});
  //       });
  // _controller8 =
  //     VideoPlayerController.network('https://youtu.be/mxHICfk1Hj0 ')
  //       ..initialize().then((_) {
  //         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //         setState(() {});
  //       });
  // _controller9 =
  //     VideoPlayerController.network('https://youtu.be/mxHICfk1Hj0 ')
  //       ..initialize().then((_) {
  //         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //         setState(() {});
  //       });
  // _controller10 =
  //     VideoPlayerController.network('https://youtu.be/mxHICfk1Hj0 ')
  //       ..initialize().then((_) {
  //         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //         setState(() {});
  //       });
  // _controller11 = VideoPlayerController.network(
  //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
  //   ..initialize().then((_) {
  //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //     setState(() {});
  //   });
  // }
}
