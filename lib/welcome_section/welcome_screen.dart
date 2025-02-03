import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';
import '../game_section/game.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.greenAccent,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    children: const [
                      Text(
                        'TIC',
                        style: kWelcomePageStyle2,
                      ),
                      Text(
                        'TAC',
                        style: kWelcomePageStyle2,
                      ),
                      Text(
                        'TOE',
                        style: kWelcomePageStyle2,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: StyledButton(
                    function: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Game(),
                        ),
                      );
                    },
                    text: 'PLAY',
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: StyledButton(
                    function: () {
                      SystemNavigator.pop();
                    },
                    text: 'EXIT',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StyledButton extends StatelessWidget {
  const StyledButton({
    Key? key,
    required this.function,
    required this.text,
  }) : super(key: key);

  final VoidCallback function;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: OutlinedButton(
        style: kWelcomePageButtonStyle,
        onPressed: function,
        child: Text(
          text,
          style: kWelcomePageStyle,
        ),
      ),
    );
  }
}
