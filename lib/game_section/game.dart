import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'game_board.dart';
import 'game_grid.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  var letters = ['', '', '', '', '', '', '', '', ''];
  var clickedLetters = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  var turn = Random().nextInt(2);
  late bool isX;
  var winner = 'still playing';
  var xScore = 0;
  var oScore = 0;
  var tileColor = Colors.greenAccent;
  var textColor = Colors.white;

  bool checkXWins() {
    if ((letters[0] == 'X' && letters[1] == 'X' && letters[2] == 'X') ||
        (letters[3] == 'X' && letters[4] == 'X' && letters[5] == 'X') ||
        (letters[6] == 'X' && letters[7] == 'X' && letters[8] == 'X') ||
        (letters[0] == 'X' && letters[3] == 'X' && letters[6] == 'X') ||
        (letters[1] == 'X' && letters[4] == 'X' && letters[7] == 'X') ||
        (letters[2] == 'X' && letters[5] == 'X' && letters[8] == 'X') ||
        (letters[0] == 'X' && letters[4] == 'X' && letters[8] == 'X') ||
        (letters[2] == 'X' && letters[4] == 'X' && letters[6] == 'X')) {
      setState(() {
        winner = 'X Wins';
        xScore++;
      });
      restartGame();
      return true;
    }
    return false;
  }

  bool checkOWins() {
    if ((letters[0] == 'O' && letters[1] == 'O' && letters[2] == 'O') ||
        (letters[3] == 'O' && letters[4] == 'O' && letters[5] == 'O') ||
        (letters[6] == 'O' && letters[7] == 'O' && letters[8] == 'O') ||
        (letters[0] == 'O' && letters[3] == 'O' && letters[6] == 'O') ||
        (letters[1] == 'O' && letters[4] == 'O' && letters[7] == 'O') ||
        (letters[2] == 'O' && letters[5] == 'O' && letters[8] == 'O') ||
        (letters[0] == 'O' && letters[4] == 'O' && letters[8] == 'O') ||
        (letters[2] == 'O' && letters[4] == 'O' && letters[6] == 'O')) {
      setState(() {
        winner = 'O Wins';
        oScore++;
      });
      restartGame();
      return true;
    }
    return false;
  }

  void checkToRestart() {
    var allClear = clickedLetters.contains(false);
    if (!allClear) {
      restartGame();
    }
  }

  void restart() {
    setState(() {
      winner = 'still playing';
      isX = true;
      letters = ['', '', '', '', '', '', '', '', ''];
      clickedLetters = [
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false
      ];
    });
  }

  void restartGame() async {
    await Future.delayed(const Duration(seconds: 2));
    restart();
  }

  void writeChoice(int index) {
    setState(() {
      if (winner == 'still playing') {
        if (!clickedLetters[index]) {
          if (isX) {
            letters[index] = 'X';
            clickedLetters[index] = true;
            isX = !isX;
          } else {
            letters[index] = 'O';
            clickedLetters[index] = true;
            isX = !isX;
          }
        }
        checkXWins();
        checkOWins();
        checkToRestart();
      }
    });
  }

  void checkTurn() {
    if (turn == 0) {
      isX = true;
    } else {
      isX = false;
    }
  }

  List<Widget> tilesMaker() {
    List<Widget> tiles = [];
    for (int i = 0; i < 9; i++) {
      final tile = InkWell(
        onTap: () {
          writeChoice(i);
        },
        child: Container(
          decoration: BoxDecoration(
            color: tileColor,
            border: Border.all(
              color: Colors.grey,
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              letters[i],
              style: TextStyle(fontSize: 60, color: textColor),
            ),
          ),
        ),
      );
      tiles.add(tile);
    }
    return tiles;
  }

  void resetScore() {
    setState(() {
      oScore = 0;
      xScore = 0;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkTurn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          GameBoard(
            isX: isX,
            xScore: xScore,
            oScore: oScore,
            restart: restart,
            winner: winner,
            resetScore: resetScore,
          ),
          GameGrid(tilesMaker: tilesMaker),
        ],
      ),
    );
  }
}