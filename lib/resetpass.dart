import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class reset extends StatefulWidget {
  const reset({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  State<reset> createState() => _resetState();
}

class _resetState extends State<reset> {
  var EmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 50,
      //   elevation: 0,
      //   backgroundColor: const Color.fromRGBO(131, 190, 99, 1),
      //
      // ),
      backgroundColor: const Color.fromRGBO(131, 190, 99, 1),
      body: Container(
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("تغيير كلمة المرور",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "DroidKufi",
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("تغيير كلمة المرور",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "DroidKufi",
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.85),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: TextFormField(
                    controller: EmailController,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  ),
                ),
              ],
            ),
            // Center(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Visibility(
            //         visible: showReset,
            //         child: ElevatedButton(
            //             onPressed: () {
            //
            //             },
            //             style: ElevatedButton.styleFrom(
            //               backgroundColor: Colors.white,
            //               padding: const EdgeInsets.symmetric(
            //                   horizontal: 30, vertical: 5),
            //             ),
            //             child:  Text("تغيير كلمة المرور",
            //                 style: TextStyle(
            //                   color: Colors.green[700],
            //                   fontFamily: "DroidKufi",
            //                   fontSize: 22.0,
            //                 ))),
            //       ),
            //       SizedBox(width: 15,),
            //       ElevatedButton(
            //           onPressed: () {
            //           },
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: Colors.white,
            //             padding: const EdgeInsets.symmetric(
            //                 horizontal: 30, vertical: 5),
            //           ),
            //           child:  Text("البحث عن البريد الإلكتروني",
            //               style: TextStyle(
            //                 color: Colors.green[700],
            //                 fontFamily: "DroidKufi",
            //                 fontSize: 22.0,
            //               ))),
            //
            //
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );




  }
}
