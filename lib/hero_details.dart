import 'package:flutter/material.dart';
import 'main.dart';

class HeroDetails extends StatelessWidget {
  const HeroDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: list[nPassedIndex].color,
        appBar: AppBar(),
        body: Hero(
          tag: list[nPassedIndex].image,
          child: Image.asset(
            list[nPassedIndex].image,
            alignment: Alignment.topLeft,
          ),
        )
        /*ElevatedButton(
              child: const Text('Open Route'),
              onPressed: () => {Navigator.pop(context)},
            ),*/
        );
  }
}
