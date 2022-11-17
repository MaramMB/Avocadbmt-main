import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/homepage.dart';
import 'package:flutter_application_1/pages/mobile/admin.dart';
import 'package:flutter_application_1/pages/mobile/homepagemobile.dart';
import 'package:flutter_application_1/pages/mobile/loginmobile.dart';
import 'package:flutter_application_1/pages/mobile/mainmobailepage.dart';
import 'package:flutter_application_1/pages/mobile/managemobile.dart';
// import 'package:flutter_application_1/pages/mobile/mainmobailepage.dart';
import 'package:responsive_builder/responsive_builder.dart';


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
        home: ScreenTypeLayout.builder(
          // mobile: (BuildContext context) => const HomemobailPage(uname: null,),
          mobile: (BuildContext context) => mobilelogin(title: '',),
          tablet: (BuildContext context) => const HomemobailPage(uname: null,),
          desktop: (BuildContext context) => const HomePage(uname: "",),
        ),

    );
  }
}
