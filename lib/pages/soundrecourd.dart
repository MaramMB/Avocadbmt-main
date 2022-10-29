import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/audio.dart';
import 'package:flutter_application_1/pages/soundtype.dart';
class soundrecord extends StatefulWidget {
  // const soundrecord({Key? key}) : super(key: key);
  soundrecord({Key? key, required this.sounds})
      : super(key: key);
  final sound sounds;

  String get type {
    if (sounds.type == soundType.beae) {
      return 'بيئية';
    } else if (sounds.type == soundType.asteabe) {
      return 'استيعابية';
    }
    return "";
  }


  @override
  State<soundrecord> createState() => _soundrecordState();
}

class _soundrecordState extends State<soundrecord> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.green, width: 5),
            borderRadius: BorderRadius.circular(30)

        ),
        child: Container(
          child: GestureDetector(

            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) =>  AlertDialog(
                    contentPadding: EdgeInsets.only(top: 30,right: 20,left: 20,bottom: 15),
                    content: Container(

                      width: MediaQuery.of(context).size.width/3.7,
                      height: MediaQuery.of(context).size.height/1.8,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.green, width: 3),
                                borderRadius: BorderRadius.circular(30)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset(
                                'img/avocado.png',
                                width: MediaQuery.of(context).size.width / 5,
                                height: MediaQuery.of(context).size.height / 3.6,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const Text("افوكادو",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 25,
                                  fontFamily: "DroidKufi",
                                  fontWeight: FontWeight.w700)),
                          SizedBox(height: 16,),
                          audio(),
                          SizedBox(height: 20,),

                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pop('dialog');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              elevation: 2.0,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                            ),
                            child: const Text("العودة",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "DroidKufi",
                                  fontSize: 18.0,
                                )),
                          ),
                        ],
                      ),
                    ),
                    shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),side: BorderSide(color: Colors.black87,width: 2.5)),
                    // Border.all(color: Colors.black87,width: 3.5),



                  )

              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                'img/avocado.png',
                width: MediaQuery.of(context).size.width / 7,
                fit: BoxFit.fill,
              ),
            ),

          ),
        ),
    );
  }
}
