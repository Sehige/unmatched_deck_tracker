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
          title: const Text('Welcome to Flutter'),
        ),
        body: Container(
          child: HeroGrid,
        ),
      ),
    );
  }
}

Widget HeroGrid = GridView.count(
  crossAxisCount: 2,
  children: List.generate(4, (index) {
    return Center(child: Text('Item $index'));
  }),
);
