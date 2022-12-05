import 'package:flutter/material.dart';

class TapToPlay extends StatelessWidget {
  final bool gameHasStarted;

  TapToPlay({required this.gameHasStarted});

  @override
  Widget build(BuildContext context) {
    return gameHasStarted
        ? Container()
        : Stack(
      children: [
        Container(
          alignment: Alignment(0, 0),
          child: Text(
            'TAP TO PLAY',
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 18,
            ),
          ),
        ),
        Container(
          alignment: Alignment(0, -0.3),
          child: Text(
            'M A R A M',
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
