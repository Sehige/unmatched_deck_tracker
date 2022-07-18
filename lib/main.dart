import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UnMatched',
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
    crossAxisCount: 2, childAspectRatio: 0.5,
    //crossAxisSpacing: 10.0,
    //mainAxisSpacing: 10.0,
  ),
  itemCount: 4,
  itemBuilder: (BuildContext context, int index) {
    double dAspectRatio = 0.6; //zoom out 1.8, zoom in 0.6
    int nNrOfClicks = 0;
    //return Center(child: Text('Item $index'));
    //return Center(child: Image.asset('images/square.png'));
    return Card(
      color: _list[index].color,
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: dAspectRatio,
            child: Image.asset(
              _list[index].image,
              fit: BoxFit.fitWidth,
            ),
          ),
          TextButton(
            onPressed: () {
              nNrOfClicks++;
              if (nNrOfClicks % 2 == 0) {
                dAspectRatio = 0.75;
              } else {
                dAspectRatio = 1.8;
              }
            },
            child: AutoSizeText(
              _list[index].name,
            ),
          ),
        ],
      ),
    );
  },
);

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
