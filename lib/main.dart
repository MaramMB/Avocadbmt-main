import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/expl.dart';
import 'package:flutter_application_1/pages/mobile/admin.dart';
import 'package:flutter_application_1/pages/mobile/homepagemobile.dart';
import 'package:flutter_application_1/pages/mobile/loginmobile.dart';
import 'package:flutter_application_1/pages/mobile/mainmobailepage.dart';
import 'package:flutter_application_1/pages/mobile/managemobile.dart';
import 'package:flutter_application_1/pages/voice.dart';
import 'package:flutter_application_1/scroll.dart';
// import 'package:flutter_application_1/pages/mobile/mainmobailepage.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:firebase_core_web/firebase_core_web.dart';


Future main()  async {
  runApp(StartPoint());
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: "flutterproject1337",
    options: kIsWeb || Platform.isAndroid ? FirebaseOptions(
      apiKey: "AIzaSyCHMOTWmG8K5j8A_3fnK5LmM49Lwyw6YmE",
      appId: "1:865215937003:web:c04c8ddca5b010aa1d81ae",
      messagingSenderId: "865215937003",
      projectId: "flutterproject1337",
      storageBucket: "flutterproject1337.appspot.com",
    ):null,
  );
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
          desktop: (BuildContext context) =>  expage(),
          // desktop: (BuildContext context) => const voicex(),
        ),

    );
  }
}
