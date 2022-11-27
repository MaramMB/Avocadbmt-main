import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

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
              Container(
                height: 1200,
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
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5,
                          childAspectRatio: 1.3,
                          mainAxisSpacing: 0,
                          crossAxisCount: 4,
                        ),
                        itemCount: 28,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                AspectRatio(
                                  aspectRatio: 2.0,
                                  child: _controller != null
                                      ? YoutubePlayerIFrame(
                                          controller: myControllers[index])
                                      : Center(
                                          child: CircularProgressIndicator()),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  names[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
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
              )
            ],
          ),
        ),
      ),
    );
  }

  var names = [
    "يسبيسبسي",
    "name2",
    "name3",
    "name4",
    "name5",
    "name6",
    "name7",
    "name8",
    "name9",
    "name10",
    "name11",
    "name12",
    "name12",
    "name12",
    "name12",
    "name12",
    "name12",
    "name12",
    "name12",
    "name12",
    "name12",
    "name12",
    "name12",
    "name12",
    "name12",
    "name12",
    "name12",
    "name12",
  ];

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
  late YoutubePlayerController _controller15;
  late YoutubePlayerController _controller16;
  late YoutubePlayerController _controller17;
  late YoutubePlayerController _controller18;
  late YoutubePlayerController _controller19;
  late YoutubePlayerController _controller20;
  late YoutubePlayerController _controller21;
  late YoutubePlayerController _controller22;
  late YoutubePlayerController _controller23;
  late YoutubePlayerController _controller24;
  late YoutubePlayerController _controller25;
  late YoutubePlayerController _controller26;
  late YoutubePlayerController _controller27;

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
    _controller15,
    _controller16,
    _controller17,
    _controller18,
    _controller19,
    _controller20,
    _controller21,
    _controller22,
    _controller23,
    _controller24,
    _controller25,
    _controller26,
    _controller27,
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
    _controller15 = YoutubePlayerController()
      ..onInit = () {
        _controller15.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
    _controller16 = YoutubePlayerController()
      ..onInit = () {
        _controller16.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
    _controller17 = YoutubePlayerController()
      ..onInit = () {
        _controller17.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
    _controller18 = YoutubePlayerController()
      ..onInit = () {
        _controller18.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
    _controller19 = YoutubePlayerController()
      ..onInit = () {
        _controller19.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
    _controller20 = YoutubePlayerController()
      ..onInit = () {
        _controller20.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
    _controller21 = YoutubePlayerController()
      ..onInit = () {
        _controller21.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
    _controller22 = YoutubePlayerController()
      ..onInit = () {
        _controller22.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
    _controller23 = YoutubePlayerController()
      ..onInit = () {
        _controller23.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
    _controller24 = YoutubePlayerController()
      ..onInit = () {
        _controller24.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
    _controller25 = YoutubePlayerController()
      ..onInit = () {
        _controller25.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
    _controller26 = YoutubePlayerController()
      ..onInit = () {
        _controller26.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
    _controller27 = YoutubePlayerController()
      ..onInit = () {
        _controller27.loadVideoById(videoId: 'mxHICfk1Hj0', startSeconds: 30);
      };
  }
}
