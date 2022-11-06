import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/homepage.dart';
import 'package:flutter_application_1/pages/latter.dart';
import 'package:flutter_application_1/pages/mainpage.dart';
import 'package:flutter_application_1/pages/speaktest.dart';
import 'package:flutter_application_1/pages/speechtotext.dart';
import 'package:flutter_application_1/pages/testlogin.dart';
import 'package:flutter_application_1/pages/voice.dart';


void main() {
  runApp(StartPoint());
}
class StartPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BDTM',
      theme: ThemeData.light(),
     home: voicex(),
     //  home: LoginPage(),
     //   home: testlog(title: "Login PAge"),
     //  home: log(title: "k",),
      // home: audio(),
      // home: HomePage(uname: null,),
      // home: sign(),
    );
  }
}
