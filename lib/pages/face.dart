import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:animate_do/animate_do.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/facevideo.dart';
import 'package:flutter_application_1/pages/testlogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'dart:html' as html;
const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;
var tid;
var bfile;
var filename;
bool addVideo = false;
late final videos;
class faceex extends StatefulWidget {
  const faceex({Key? key}) : super(key: key);
  @override
  State<faceex> createState() => _faceexState();
}
class _faceexState extends State<faceex> {
  String? userKind;
  String userId = '';

  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userKind = prefs.getString('userKind') ?? '';
      userId = prefs.getString('userId') ?? '';
    });
  }
 var flickManager;
  var flickManager1;
  var flickManager2;
  var flickManager3;
  var flickManager4;
  var flickManager5;

  late List<FlickManager> myfilk = [
    flickManager,
    flickManager1,
    flickManager2,
    flickManager3,
    flickManager4,
    flickManager5,

  ];
  @override

  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 900), () {
      setState(() {
      });
    });
    getUserData();

    Future.delayed(const Duration(milliseconds: 900), () {
      setState(() {

      });
    });
    x();

    flickManager = FlickManager(
      autoPlay: false,
      videoPlayerController:VideoPlayerController.asset('faceVideos/1.mp4'),
    );
    flickManager1 = FlickManager(
      autoPlay: false,
      videoPlayerController:VideoPlayerController.asset('faceVideos/2.mp4'),
    );    flickManager2 = FlickManager(
      autoPlay: false,
      videoPlayerController: VideoPlayerController.asset('faceVideos/3.mp4'),
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
          child: FutureBuilder<List<dynamic>?>(future: videos,builder: (context, snapshot) {
            if (snapshot.hasData)
              {
                return Column(
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
                                    child: FadeInDown(
                                      child: Row(
                                        children: [
                                          FloatingActionButton(onPressed: (){
                                            showDialog(context: context, builder: (_)=>AlertDialog(
                                              title: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text("اضافة فيديو الى القائمة",
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 17,
                                                          fontFamily: "DroidKufi",
                                                          fontWeight: FontWeight.w700)),
                                                  SizedBox(height: 20,),

                                                  SizedBox(height: 20,),
                                                  Visibility(
                                                    visible: addVideo,
                                                    child:addVideo ? SizedBox(
                                                      height: 200,
                                                      width: 200,
                                                      child: FlickVideoPlayer(
                                                        flickManager: FlickManager(
                                                          autoPlay: false,
                                                          videoPlayerController:VideoPlayerController.asset('../faceVideos/'+filename),
                                                        ),

                                                      ),
                                                    ):Container(),
                                                  ),


                                                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green),onPressed: (){
                                                    getVideo();
                                                  }, child: Text("إضافة فيديو",style: TextStyle(fontFamily: "DroidKufi"),)),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green),onPressed: (){
                                                        Videoadd(filename,tid);
                                                        Navigator.push (
                                                          context,
                                                          MaterialPageRoute (
                                                            builder: (BuildContext context) =>  faceex(),
                                                          ),
                                                        );
                                                      }, child: Text("حفظ",style: TextStyle(fontFamily: "DroidKufi"),)),
                                                      SizedBox(width: 20,),
                                                      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green),onPressed: (){
                                                        Navigator.pop(context);
                                                      }, child: Text("رجوع",style: TextStyle(fontFamily: "DroidKufi"),)),
                                                    ],
                                                  ),



                                                ],
                                              ),
                                            ));
                                          },child: Icon(Icons.add),),

                                          Spacer(flex: 2,),

                                          Text("التدريبات الحركية للوجه",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 25,
                                                  fontFamily: "DroidKufi",
                                                  fontWeight: FontWeight.w700)),
                                          Spacer(flex: 2,),
                                        ],

                                      ),
                                    ),

                                  ),
                                  SizedBox(height: 10,),
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
                                    itemCount: snapshot.data?.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return FadeInUpBig(
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: AspectRatio(
                                            aspectRatio: 5.5,
                                            child: videos != null ?  SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  FlickVideoPlayer(
                                                    flickManager: FlickManager(
                                                      autoPlay: false,
                                                      videoPlayerController:VideoPlayerController.asset(snapshot.data![index]['path']),
                                                    ),

                                                  ),
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
                                              ),
                                            )
                                                : Center(child: CircularProgressIndicator()),
                                          ),
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
                );
              }
            else
              return Center(child: CircularProgressIndicator());
          } ,)


        ),
      ),
    );

  }
  Videoadd(String path , String tid)async {
    print(filename+'---'+userId);
    var url = 'http://localhost/addVideo.php';
    var response = await http.post(Uri.parse(url), body: {
      'path': path,
      'tid': userId,
    });
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
    }
  }
  Future getVideo () async {
    FilePickerResult? file = await FilePicker.platform.pickFiles(type: FileType.video, allowMultiple: false);
    if (file!=null) {
      setState(() {
        bfile = file.files.first.bytes;
        filename = file.files.first.name;
        addVideo=true;


      });

    }
    else {
      // error please choose file !

    }
    // var url = 'http://bara111.000webhostapp.com/uploadtest.php';
    var url = 'http://localhost/uploadtest.php';
    var response = await http.post(Uri.parse(url), body: {
      'file':base64Encode(bfile),
      'name':filename,
    });

  }
   x() async {
     tid = await getTid(userKind);
     videos = getData(tid);
     print('++'+tid+userKind!);
  }
  getTid( String? userKind) async {

    print ('get tid');
    if (userKind == 'student'){
      var url = 'http://localhost/getTid.php';
      var response = await http.post(Uri.parse(url), body :{
        'id': userId,
      });
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data[0]['tid']);
        return data[0]['tid'];
      }
    }
    else
    {
      return userId;
    }


  }

  Future<List<dynamic>?> getData(String? tid) async{

if (userKind == 'teacher')
  {
    print('object'+userId);
    var url = 'http://localhost/getVideos.php';
    var response = await http.post(Uri.parse(url), body :{
      'tid': userId,
    });
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;

    }
  }
else
  {
    var url = 'http://localhost/getVideos.php';
    var response = await http.post(Uri.parse(url), body :{
      'tid': userId,
    });
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;

    }

  }




  }
}


