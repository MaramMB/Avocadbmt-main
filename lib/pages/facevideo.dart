import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/testlogin.dart';
import 'package:flutter_application_1/pages/voicetestbe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;
var tid;
class facevideo extends StatefulWidget {

  int index;
  String id;
  String? Kind;
  facevideo({Key? key, required this.index,required this.id,required this.Kind}) : super(key: key);

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

  late final videos = getData(tid);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: Scrollbar(
        thickness: 10,
        isAlwaysShown: true,
        radius: const Radius.circular(10),
        child: FutureBuilder<List<dynamic>?>(future: videos,builder: (context, snapshot){
          if(snapshot.hasData)
            {
              return Column(
                children: [
                  SelectionButton(),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.15,
                    width: MediaQuery.of(context).size.width / 1.5,
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
                                child: videos != null
                                    ? FlickVideoPlayer(
                                  flickManager:FlickManager(
                                    videoPlayerController: VideoPlayerController.asset(snapshot.data![widget.index]['path']),
                                    autoPlay: false,
                                  ),
                                  // flickVideoWithControls: FlickVideoWithControls(videoFit: BoxFit.fill,),
                                  flickVideoWithControls:FlickVideoWithControls(videoFit: BoxFit.fill,),
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
                                    if(widget.index != (snapshot.data?.length)!-1){
                                      widget.index ++;
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) => super.widget));
                                    }
                                    else {
                                      Fluttertoast.showToast(msg: "الفيديو الاخير");
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
                                      Fluttertoast.showToast(msg: "الفيديو الاول");

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
              );

            }
          else
            {
              return Center(child: CircularProgressIndicator(),);
            }
        }),

      ),
    );
  }



  @override


  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500));

    getUserData();
    Future.delayed(Duration(milliseconds: 300));
    x();
  }
  x()async{
      tid = await getTid();
      print(tid);
  }
  getTid() async {
    print ('get tid'+widget.id);
    if (widget.Kind =='student'){
      var url = 'http://localhost/getTid.php';

      var response = await http.post(Uri.parse(url), body :{
        'id':widget.id,
      });
      if (response.statusCode == 200) {
        var data = await json.decode(response.body);
        print('ss'+data[0]['tid']);
        return data[0]['tid'];
      }
    }
    else
    {
      return widget.id;
    }


  }
  Future<List<dynamic>?> getData(String? tid) async{
    tid = await getTid();
    if (widget.Kind == 'teacher')
    {
      print('object'+userId);
      var url = 'http://localhost/getVideos.php';
      var response = await http.post(Uri.parse(url), body :{
        'tid': widget.id,
      });
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data;

      }
    }
    else
    {
      print(tid);
      var url = 'http://localhost/getVideos.php';
      var response = await http.post(Uri.parse(url), body :{
        'tid': tid,
      });
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data;

      }

    }




  }

}
