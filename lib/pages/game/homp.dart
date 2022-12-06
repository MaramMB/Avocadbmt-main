import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/game/score.dart';
import 'package:flutter_application_1/pages/game/taptoplay.dart';
import 'barrier.dart';
import 'dino.dart';
import 'gameover.dart';

class game extends StatefulWidget {
  const game({Key? key}) : super(key: key);

  @override
  _gameState createState() => _gameState();
}

class _gameState extends State<game> {
  // dino variables (out of 2)
  double dinoX = -0.5;
  double dinoY = 1.05;
  double dinoWidth = 0.2;
  double dinoHeight = 0.4;

  // barrier variables (out of 2)
  double barrierX = 1;
  double barrierY = 1.2;
  double barrierWidth = 0.25;
  double barrierHeight = 0.5;

  // jump variables
  double time = 0;
  double height = 0;
  double gravity = 7.5;
  double velocity = 5; // how strong the jump is

  // game settings
  bool gameHasStarted = false;
  bool midJump = false;
  bool gameOver = false;
  int score = 0;
  int highscore = 0;
  bool dinoPassedBarrier = false;

  // this will make the map start moving, ie. barriers will start to move
  void startGame() {
    setState(() {
      gameHasStarted = true;
    });

    Timer.periodic(Duration(milliseconds: 10), (timer) {
      // check for if dino hits barrier
      if (detectCollision()) {
        gameOver = true;
        timer.cancel();
        setState(() {
          if (score > highscore) {
            highscore = score;
          }
        });
      }

      // loop barrier to keep the map going
      loopBarriers();

      // update score
      updateScore();

      setState(() {
        barrierX -= 0.01;
      });
    });
  }

  // update score
  void updateScore() {
    if (barrierX < dinoX && dinoPassedBarrier == false) {
      setState(() {
        dinoPassedBarrier = true;
        score++;
      });
    }
  }

  // loop barriers
  void loopBarriers() {
    setState(() {
      if (barrierX <= -1.2) {
        barrierX = 1.2;
        dinoPassedBarrier = false;
      }
    });
  }

  // barrier collision detection
  bool detectCollision() {
    if (barrierX <= dinoX + dinoWidth &&
        barrierX + barrierWidth >= dinoX &&
        dinoY >= barrierY - barrierHeight) {
      return true;
    }

    return false;
  }

  // dino jump
  void jump() {
    midJump = true;
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      height = -gravity / 2 * time * time + velocity * time;

      setState(() {
        if (1 - height > 1) {
          resetJump();
          dinoY = 1;
          timer.cancel();
        } else {
          dinoY = 1 - height;
        }
      });

      // check if dead
      if (gameOver) {
        timer.cancel();
      }

      // keep the time going
      time += 0.01;
    });
  }

  void resetJump() {
    midJump = false;
    time = 0;
  }

  void playAgain() {
    setState(() {
      gameOver = false;
      gameHasStarted = false;
      barrierX = 1.2;
      score = 0;
      dinoY = 1;
      midJump = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameOver
          ? (playAgain)
          : (gameHasStarted ? (midJump ? null : jump) : startGame),
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Center(
                  child: Stack(
                    children: [
                      // tap to play
                      TapToPlay(
                        gameHasStarted: gameHasStarted,
                      ),

                      // game over screen
                      GameOverScreen(
                        gameOver: gameOver,
                      ),

                      // scores
                      ScoreScreen(
                        score: score,
                        highscore: highscore,
                      ),

                      // dino
                      MyDino(
                        dinoX: dinoX,
                        dinoY: dinoY - dinoHeight,
                        dinoWidth: dinoWidth,
                        dinoHeight: dinoHeight,
                      ),

                      // barrier
                      MyBarrier(
                        barrierX: barrierX,
                        barrierY: barrierY - barrierHeight,
                        barrierWidth: barrierWidth,
                        barrierHeight: barrierHeight,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green[600],
                child: Center(
                  child: Text(
                    'AVOCADO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
