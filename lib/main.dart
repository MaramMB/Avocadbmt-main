import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/mobile/homepagemobile.dart';
import 'package:flutter_application_1/pages/testlogin.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_application_1/pages/mobile/mainmobailepage.dart';
import 'package:responsive_builder/responsive_builder.dart';

Future main() async {
  runApp(StartPoint());
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: "flutterproject1337",
    options: kIsWeb || Platform.isAndroid
        ? const FirebaseOptions(
            apiKey: "AIzaSyCHMOTWmG8K5j8A_3fnK5LmM49Lwyw6YmE",
            appId: "1:865215937003:web:c04c8ddca5b010aa1d81ae",
            messagingSenderId: "865215937003",
            projectId: "flutterproject1337",
            storageBucket: "flutterproject1337.appspot.com",
          )
        : null,
  );
}

class StartPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // localizationsDelegates: const [
      //   GlobalCupertinoLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      // supportedLocales: const [
      //   Locale('ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales
      // ],
      // locale: const Locale(
      //     'ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales,

      title: 'BDTM',
      theme: ThemeData.light(),
      home: ScreenTypeLayout.builder(
        // mobile: (BuildContext context) => const HomemobailPage(uname: null,),
        mobile: (BuildContext context) => const HomemobailPage(
          uname: null,
        ),
        tablet: (BuildContext context) => const HomemobailPage(
          uname: null,
        ),
        desktop: (BuildContext context) => testlog(),
        // desktop: (BuildContext context) => result(userId: '1337',),
      ),
    );
  }
}
