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
bool errmsg = false;
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

  @override

  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 900), () {
      setState(() {
      });
    });
    getUserData();
    tid =  getTid();
    Future.delayed(const Duration(milliseconds: 900), () {
      setState(() {

      });
    });
    x();




  }

  @override
  void dispose() {
    super.dispose();
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
                                          Visibility(
                                            maintainState: true,
                                            maintainAnimation: true,
                                            maintainSize: true,
                                            visible: userKind=='teacher',
                                            child: FloatingActionButton(backgroundColor: Colors.green,onPressed: (){
                                              showDialog(context: context, builder: (_)=>StatefulBuilder(builder: (context,setState)
                                              {
                                                return   AlertDialog(
                                                  title: Container(
                                                    width: addVideo ? 350:200,
                                                    child: Column(
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
                                                                videoPlayerController:VideoPlayerController.asset('faceVideos/'+filename),
                                                              ),

                                                            ),
                                                          ):Center(child: SizedBox( height: 100 ,width: 100,child: CircularProgressIndicator(color: Colors.green, backgroundColor: Colors.grey,))),
                                                        ),
                                                        SizedBox(height: 20,),
                                                        Visibility(
                                                          visible: errmsg,
                                                          child: Text("لم يتم اضافة فيديو",
                                                              style: TextStyle(
                                                                  color: Colors.red,
                                                                  fontSize: 14,
                                                                  fontFamily: "DroidKufi",
                                                                  fontWeight: FontWeight.w700)),
                                                        ),
                                                        SizedBox(height: 20,),


                                                        SizedBox(
                                                          height: 30,
                                                          child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green),onPressed: (){
                                                            getVideo().then((value) => setState((){}));

                                                          }, child: Text("إضافة فيديو",style: TextStyle(fontFamily: "DroidKufi"),)),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            SizedBox(
                                                              height: 30,
                                                              child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green),onPressed: (){
                                                                if(addVideo)
                                                                  {
                                                                    Videoadd(filename);
                                                                    setState((){
                                                                      addVideo=false;
                                                                      errmsg=false;
                                                                    });
                                                                    Navigator.push (
                                                                      context,
                                                                      MaterialPageRoute (
                                                                        builder: (BuildContext context) =>  faceex(),
                                                                      ),
                                                                    );
                                                                  }
                                                                else
                                                                  {
                                                                    setState((){
                                                                      errmsg=true;
                                                                    });
                                                                  }

                                                              }, child: Text("حفظ",style: TextStyle(fontFamily: "DroidKufi"),)),
                                                            ),
                                                            SizedBox(width: 20,),
                                                            SizedBox(
                                                              height: 30,
                                                              child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green),onPressed: (){
                                                                setState((){
                                                                  addVideo=false;
                                                                  filename='';
                                                                });
                                                                Navigator.pop(context);

                                                              }, child: Text("رجوع",style: TextStyle(fontFamily: "DroidKufi"),)),
                                                            ),
                                                          ],
                                                        ),



                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }));

                                            },child: Icon(Icons.add),),
                                          ),

                                          Spacer(flex: 2,),

                                          Text("التدريبات الحركية للوجه",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 25,
                                                  fontFamily: "DroidKufi",
                                                  fontWeight: FontWeight.w700)),
                                          Spacer(flex: 3,),
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
                                                        return  facevideo(index: index,id: userId,Kind: userKind,);
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
  Videoadd(String path)async {
    print(filename+'---'+userId);
    path = 'faceVideos/'+path;
    var url = 'http://localhost/addVideo.php';
    var response = await http.post(Uri.parse(url), body :{
      'file':path,
      'tid': userId,
    });


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
      'type':'v',
    });

  }
   x() async {
     tid = await getTid();
     print('++'+tid+userKind!);
  }
  getTid() async {
    print ('get tid');
    if (userKind == 'student'){
      var url = 'http://localhost/getTid.php';
      var response = await http.post(Uri.parse(url), body :{
        'id':userId,
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
    tid = await getTid();
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


