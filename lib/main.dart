import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Heroes'),
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: HeroGrid,
        ),
      ),
    );
  }
}

Widget HeroGrid = GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
    ),
    itemCount: 4,
    itemBuilder: (BuildContext context, int index) {
      //return Center(child: Text('Item $index'));
      //return Center(child: Image.asset('images/square.png'));
      return Container(
        alignment: Alignment.center,
        height: double.infinity,
        decoration: BoxDecoration(
            color: _list[index].color, borderRadius: BorderRadius.circular(4)),
        child: Image.asset(_list[index].image),
      );
    });

class PortraitItem {
  final String image;
  final String name;
  final Color color;
  PortraitItem(this.image, this.name, this.color);
}

final List<PortraitItem> _list = [
  PortraitItem('images/alice.jpg', 'Alice', Color.fromARGB(255, 152, 208, 236)),
  PortraitItem('images/arthur.jpg', 'Arthur', Colors.red),
  PortraitItem('images/medusa.jpg', 'Medusa', Color.fromARGB(255, 127, 255, 7)),
  PortraitItem('images/sinbad.jpg', 'Sinbad', Colors.amber),
];
