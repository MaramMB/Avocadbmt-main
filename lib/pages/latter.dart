import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/expl.dart';
import 'package:flutter_application_1/pages/faceexpl.dart';
import 'package:flutter_application_1/pages/laterss.dart';
import 'package:flutter_application_1/pages/latterexpl.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/speaktest.dart';
import 'package:flutter_application_1/pages/voiceexpl.dart';

import '../Components.dart';
import 'manag.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;
class letterex extends StatefulWidget {
  const letterex({Key? key}) : super(key: key);

  @override
  State<letterex> createState() => _letterexState();
}

class _letterexState extends State<letterex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: Container(
        child: Column(
          children: [
            const SelectionButton(),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.2,
              width: MediaQuery.of(context).size.width / 1.8,
              decoration: const BoxDecoration(
                // color: Color(0x6BFFFFFF),
                gradient:LinearGradient(
                    colors: [
                      Color(0x6BFFFFFF),
                      Color(0x5FC3FFC3),
                      Color(0xA65D86A6),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        letter(L1: 'ج',L2: 'ش',L3: 'ض',L4: '', title: 'الحروف الشجرية',),
                        letter(L1: 'ق',L2: 'ك',L3: '',L4: '', title: 'الحروف اللهوية',),
                        letter(L1: 'ع',L2: 'غ',L3: 'ح',L4: 'خ', title: 'الحروف الحلقية',),



                      ],
                    ),
                            SizedBox(height: 17,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        letter(L1: 'ظ',L2: 'ذ',L3: 'ث',L4: '', title: 'الحروف اللثوية',),
                        letter(L1: 'ط',L2: 'ت',L3: 'د',L4: '', title: 'الحروف النطعية',),
                        letter(L1: 'ز',L2: 'س',L3: 'ص',L4: '', title: 'الحروف الأسلية',),
                      ],
                    ),
                    SizedBox(height: 17,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        letter(L1: 'ا',L2: 'و',L3: 'ي',L4: 'ء', title: 'الحروف الهوائية',),
                        letter(L1: 'ف',L2: 'ب',L3: 'م',L4: '', title: 'الحروف الشفوية',),
                        letter(L1: 'ر',L2: 'ل',L3: 'ن',L4: '', title: 'الحروف اللهوية',),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
