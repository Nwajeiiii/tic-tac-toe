import 'package:flutter/material.dart';

import '../constants.dart';

class GameBoard extends StatefulWidget {
  GameBoard({
    super.key,
    required this.isX,
    required this.xScore,
    required this.oScore,
    required this.restart,
    required this.winner, required this.resetScore,
  });
  final bool isX;
  int xScore;
  int oScore;
  final VoidCallback restart;
  final String winner;
  final VoidCallback resetScore;

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          widget.isX
              ? const Text(
                  'X TURN',
                  style: kGameBoardTurnStyle,
                )
              : const Text(
                  'O TURN',
                  style: kGameBoardTurnStyle,
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'X:${widget.xScore}',
                style: kGameBoardScoreStyle,
              ),
              Text(
                'O:${widget.oScore}',
                style: kGameBoardScoreStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  widget.restart();
                },
                child: const Text('Reset'),
              ),
              Text(
                widget.winner,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
              InkWell(
                onTap: () {
                  widget.restart();
                  widget.resetScore();
                },
                child: const Text('Restart'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}