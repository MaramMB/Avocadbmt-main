import 'dart:math';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:wave_progress_bars/wave_progress_bars.dart';
class audio extends StatefulWidget {
    late String path;
    audio( {required this.path} );

  @override
  _audioState createState() => _audioState();
}

class _audioState extends State<audio>
    with SingleTickerProviderStateMixin {
  late AnimationController
  iconController; // make sure u have flutter sdk > 2.12.0 (null safety)

  bool isAnimated = false;
  bool showPlay = true;
  bool shopPause = false;

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    iconController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));

    audioPlayer.open(Audio(widget.path),autoStart: false,showNotification: true);

  }
  @override
  Widget build(BuildContext context) {
    return Container(
          width: MediaQuery.of(context).size.width/5,
          decoration: BoxDecoration(
              // color: Colors.green,
              borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.green,width: 1.5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*InkWell(child: Icon(CupertinoIcons.backward_fill,color: Colors.green,),onTap: (){
                  audioPlayer.seekBy(Duration(seconds: -10));
                },),*/
                SizedBox(width: 12,),
                Container(
                  decoration: BoxDecoration(
                  color: Colors.green,
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: GestureDetector(
                    onTap: () {
                      AnimateIcon();
                    },
                    child: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: iconController,
                      size: 35,
                      color: Colors.white,

                    ),
                  ),
                ),
                SizedBox(width: 12,),

               /* InkWell(child: Icon(CupertinoIcons.forward_fill,color: Colors.green,),onTap: (){
                  audioPlayer.seekBy(Duration(seconds: 10));
                  audioPlayer.seek(Duration(seconds: 10));
                  audioPlayer.next();
                },),*/
              ],
            ),
          ),
        );
  }

  void AnimateIcon() {
    setState(() {
      isAnimated = !isAnimated;

      if(isAnimated)
      {
        iconController.forward();
        audioPlayer.play();
      }else{
        iconController.reverse();
        audioPlayer.pause();
      }


    });
  }
   @override
  void dispose() {
    // TODO: implement dispose
    iconController.dispose();
    audioPlayer.dispose();
    super.dispose();
  }


}