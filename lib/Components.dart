import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/audio.dart';
import 'package:flutter_application_1/pages/laterss.dart';

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
            offset: const Offset(0, 5),
          ),
        ],
          border: Border.all(
              color: const Color(0xFF83BE63), width: 3.5),
          borderRadius: BorderRadius.circular(30),),
      child: GestureDetector(
        onTap: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (_) =>  AlertDialog(
                contentPadding: const EdgeInsets.only(top: 30,right: 20,left: 20,bottom: 15),
                content: Container(
                  width: MediaQuery.of(context).size.width/3.7,
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
                          style: const TextStyle(
                              color: Colors.green,
                              fontSize: 25,
                              fontFamily: "DroidKufi",
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 10,),
                      audio(path: Spath),
                      const SizedBox(height: 15,),

                      ElevatedButton(
                        onPressed: () {
                          audioPlayer.dispose();
                          Navigator.of(context, rootNavigator: true).pop();
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
                    borderRadius: BorderRadius.circular(30.0),side: const BorderSide(color: Colors.black87,width: 3.0)),
                // Border.all(color: Colors.black87,width: 3.5),

              )

          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: /*Image.memory(s),*/ Image.asset(
            Ipath,
            width: MediaQuery.of(context).size.width / 9,
            fit: BoxFit.fill,
          ),
        ),

      ),
    );
  }
}

//       Letters Page

class letter extends StatefulWidget {
  late String L1,L2,L3,L4,title; // L = letter
  letter({
    required this.L1,
    required this.L2,
    required this.L3,
    required this.L4,
    required this.title,
});
  @override
  State<letter> createState() => _letterState();
}

class _letterState extends State<letter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return  letterss(L1: widget.L1,L2: widget.L2,L3: widget.L3,L4: widget.L4,title: widget.title,);
            }));
          },
          child: Stack(
            alignment: Alignment.center,

            children: [
              Container(
                width: MediaQuery.of(context).size.width / 9.5,
                height: MediaQuery.of(context).size.height /5.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueAccent,
                    boxShadow:const [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: Offset.zero
                      ),
                    ]
                ),
              ),
              Row(
                children: [
                  Visibility(
                    visible: widget.L4=='' ? false:true,
                    child: Text("${widget.L4} ",
                        style:  const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: "DroidKufi",
                            fontWeight: FontWeight.w700)),
                  ),
                  Visibility(
                    visible: widget.L3=='' ? false:true,
                    child: Text("${widget.L3} ",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: "DroidKufi",
                            fontWeight: FontWeight.w700)),
                  ),
                  Visibility(
                    visible: widget.L2=='' ? false:true,
                    child: Text("${widget.L2} ",
                        style: const TextStyle(

                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: "DroidKufi",
                            fontWeight: FontWeight.w700)),
                  ),
                  Visibility(
                    visible: widget.L1=='' ? false:true,
                    child: Text("${widget.L1} ",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: "DroidKufi",
                            fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ],
          ),
        ),
         Text(widget.title,
            style: const TextStyle(
                shadows:[
                  Shadow(
                      color: Colors.black,
                      blurRadius: 5
                  )
                ],
                color: Colors.white,
                fontSize: 18,
                fontFamily: "DroidKufi",
                fontWeight: FontWeight.w700)),
      ],
    );
  }
}


