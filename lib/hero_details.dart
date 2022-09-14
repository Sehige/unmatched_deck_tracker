import 'package:flutter/material.dart';
import 'main.dart';

class HeroDetails extends StatelessWidget {
  const HeroDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: list[nPassedIndex].color,
        appBar: AppBar(),
        body: Column(
          children: [
            Hero(
              tag: list[nPassedIndex].image,
              child: Image.asset(
                list[nPassedIndex].image,
                alignment: Alignment.topLeft,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(list[nPassedIndex].name),
                      ),
                      Expanded(
                        child: Text(list[nPassedIndex].sidekick),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text("HP: 14"),
                      ),
                      Expanded(
                        child: Text("<--- Move -->"),
                      ),
                      Expanded(
                        child: Text("HP: 6"),
                      ),
                    ],
                  ),
                  Text("HERO abillity"),
                  Text("Essential Cards(this is title for next Row"),
                  Row(
                    children: [],
                  ),
                ],
              ),
            ),
          ],
        )

        /*ElevatedButton(
              child: const Text('Open Route'),
              onPressed: () => {Navigator.pop(context)},
            ),*/
        );
  }
}
