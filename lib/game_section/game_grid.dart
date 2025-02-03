import 'package:flutter/material.dart';

class GameGrid extends StatefulWidget {
  const GameGrid({super.key, required this.tilesMaker});
  final Function tilesMaker;

  @override
  State<GameGrid> createState() => _GameGridState();
}

class _GameGridState extends State<GameGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.all(10),
      // crossAxisSpacing: 10,
      // mainAxisSpacing: 10,
      crossAxisCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      children: widget.tilesMaker(),
    );
  }
}
