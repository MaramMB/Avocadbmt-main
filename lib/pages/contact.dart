import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/map.dart';

const backgreen = Color.fromRGBO(131, 190, 99, 1);

class contact extends StatelessWidget {
  const contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(131, 190, 99, 1),
        // iconTheme: IconThemeData.lerp(null, null, 90),
      ),
      body: Container(
        color: backgreen,
        // padding: const EdgeInsets.only(top: 40),

        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,

          children: [
            FadeInDownBig(
              child: const Text(
                "تواصل معنا",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontFamily: "DroidKufi",
                  fontSize: 60,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Stack(
              children: [
                Center(
                    child: Image.asset("img/ss.png",
                        height: MediaQuery.of(context).size.height / 1.6)),
                FadeInLeft(
                  child: Container(
                    padding: const EdgeInsets.only(top: 180),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            " : يسعدنا الاجابة على جميع استفسارتكم",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black87,
                                fontFamily: "DroidKufi",
                                fontWeight: FontWeight.w100,
                                fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green,width: 1.5),
                                    borderRadius: BorderRadius.circular(6)
                                ),
                                child: const Icon(
                                  Icons.alternate_email,
                                  size: 25,),
                              ),
                              const Text(
                                "  nabraa.ps@gmail.com ",
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.black87,
                                    fontFamily: "Merienda",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green,width: 1.5),
                                  borderRadius: BorderRadius.circular(6)
                              ),
                              child: const Icon(
                                Icons.phone,
                                size: 25,),
                            ),
                            // Icon(Icons.phone,size: 25),
                            const Text(
                              "  +972 0569209948      ",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.black87,
                                  fontFamily: "Merienda",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green,width: 1.5),
                                  borderRadius: BorderRadius.circular(6)
                              ),
                              child: const Icon(
                                Icons.phone,
                                size: 25,),
                            ),
                            // Card(shape:BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(35),)),color: Colors.green, child: Icon(Icons.phone,size: 28)),
                            // Card(shape:Border(left: Border.fromBorderSide(side)), child: Icon(Icons.phone,size: 25)),
                            const Text(
                              "  +972 0592455301      ",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.black87,
                                  fontFamily: "Merienda",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
