import 'dart:io';
import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Characters/characters.dart';
import 'package:flutter_application_1/pages/EditExercises.dart';
import 'package:flutter_application_1/pages/face.dart';
import 'package:flutter_application_1/pages/mainpage.dart';
import 'package:flutter_application_1/pages/mobile/adminmobile.dart';

import 'package:flutter_application_1/pages/mobile/homemob.dart';
import 'package:flutter_application_1/pages/mobile/mainmobailepage.dart';
import 'package:flutter_application_1/pages/mobile/managemobile.dart';
import 'package:flutter_application_1/pages/widgets/manage_accounts.dart';
import 'package:flutter_application_1/pages/widgets/societies.dart';
import 'package:flutter_application_1/resetpass.dart';
import 'package:flutter_application_1/scroll.dart';
import 'package:responsive_builder/responsive_builder.dart';

Future main() async {
  runApp(StartPoint());
  WidgetsFlutterBinding.ensureInitialized();
}

class StartPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'نـبـرة - Nabra',
      theme: ThemeData.light(),
      home: ScreenTypeLayout.builder(
        // mobile: (BuildContext context) => const HomemobailPage(uname: null,),
        mobile: (BuildContext context) =>  scrollmobile(),
        // tablet: (BuildContext context) => scrollmobile(),
        desktop: (BuildContext context) => scrollhome( ),
        // desktop: (BuildContext context) => game(),
        // desktop: (BuildContext context) => result(userId: '20',),
      ),
    );
  }
}
