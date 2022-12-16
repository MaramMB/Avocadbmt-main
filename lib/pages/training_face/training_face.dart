import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/testlogin.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;

class TrainingFace extends StatefulWidget {
  const TrainingFace({Key? key}) : super(key: key);

  @override
  State<TrainingFace> createState() => _TrainingFaceState();
}

class _TrainingFaceState extends State<TrainingFace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: Container(
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text("التدريبات الحركية للفم",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 25,
                              fontFamily: "DroidKufi",
                              fontWeight: FontWeight.w700)),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5,
                          childAspectRatio: 1.7,
                          mainAxisSpacing: 0,
                          crossAxisCount: 3,
                        ),
                        itemCount: 15,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: AspectRatio(
                              aspectRatio: 6,
                              child: _controller != null
                                  ? YoutubePlayerIFrame(
                                      controller: myControllers[index])
                                  : Center(child: CircularProgressIndicator()),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

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
  late YoutubePlayerController _controller12;
  late YoutubePlayerController _controller13;
  late YoutubePlayerController _controller14;

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
    _controller12,
    _controller13,
    _controller14,
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
        _controller6.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
    _controller7 = YoutubePlayerController()
      ..onInit = () {
        _controller7.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
    _controller8 = YoutubePlayerController()
      ..onInit = () {
        _controller8.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
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
    _controller12 = YoutubePlayerController()
      ..onInit = () {
        _controller12.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
    _controller13 = YoutubePlayerController()
      ..onInit = () {
        _controller13.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
    _controller14 = YoutubePlayerController()
      ..onInit = () {
        _controller14.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
  }
}
