import 'package:flutter/material.dart';

const kGameBoardTurnStyle =
    TextStyle(fontSize: 35, fontWeight: FontWeight.bold);

const kGameBoardScoreStyle = TextStyle(
  fontSize: 22.0,
  letterSpacing: 10,
);

const kWelcomePageStyle = TextStyle(
  fontSize: 50.0,
  color: Colors.white,
);

const kWelcomePageStyle2 = TextStyle(
  fontSize: 100.0,
  color: Colors.white,
  fontWeight: FontWeight.w900,
);

var kWelcomePageButtonStyle = ButtonStyle(
  overlayColor: MaterialStateProperty.all(Colors.greenAccent.shade700),
  minimumSize: MaterialStateProperty.all(const Size(200, 100)),
  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
  elevation: MaterialStateProperty.all(8),
  shape: MaterialStateProperty.all(
    const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30),
      ),
    ),
  ),
  side: MaterialStateProperty.all(
    const BorderSide(
      color: Colors.white,
      width: 5,
    ),
  ),
);
