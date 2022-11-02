import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/audio.dart';

class soundsWidget extends StatelessWidget {
  late String Spath; //sound path
  late String Ipath;// Image path
  late String Name; // name of the sound

  soundsWidget({
    required this.Spath ,
    required this.Ipath ,
    required this.Name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 5),
          ),
        ],
          border: Border.all(
              color: Color(0xFF83BE63), width: 3.5),
          borderRadius: BorderRadius.circular(30),),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (_) =>  AlertDialog(
                contentPadding: EdgeInsets.only(top: 30,right: 20,left: 20,bottom: 15),
                content: Container(
                  width: MediaQuery.of(context).size.width/3.2,
                  height: MediaQuery.of(context).size.height/1.6,
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
                            Ipath,
                            width: MediaQuery.of(context).size.width / 5,
                            height: MediaQuery.of(context).size.height / 3.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                       Text(Name,
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 25,
                              fontFamily: "DroidKufi",
                              fontWeight: FontWeight.w700)),
                      SizedBox(height: 16,),
                      audio(path: Spath),
                      SizedBox(height: 30,),

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
                              fontSize: 22.0,
                            )),
                      ),
                    ],
                  ),
                ),
                shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),side: BorderSide(color: Colors.black87,width: 4.5)),
                // Border.all(color: Colors.black87,width: 3.5),



              )

          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            Ipath,
            width: MediaQuery.of(context).size.width / 9,
            fit: BoxFit.fill,
          ),
        ),

      ),
    );
  }
}


