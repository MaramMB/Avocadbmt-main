import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/audio.dart';
import 'package:flutter_application_1/pages/contact.dart';
import 'package:flutter_application_1/pages/expl.dart';
import 'package:flutter_application_1/pages/join.dart';
import 'package:flutter_application_1/pages/loginpage.dart';
import 'package:flutter_application_1/pages/homepage.dart';
import 'package:flutter_application_1/pages/mainpage.dart';
import 'package:flutter_application_1/pages/map.dart';
import 'package:flutter_application_1/pages/massege.dart';
import 'package:flutter_application_1/pages/signup.dart';
import 'package:flutter_application_1/pages/testlogin.dart';
import 'package:flutter_application_1/pages/voice.dart';

import 'pages/manag.dart';
import 'pages/speaktest.dart';
// import 'package:flutter_application_1/pages/homepage/dart';

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
     home: sptest(),
      // home: LoginPage(),
      //  home: testlog(title: "Login PAge"),
      // home: log(title: "k",),
      // home: audio(),
      // home: HomePage(uname: null,),
      // home: sign(),
    );
  }
}
