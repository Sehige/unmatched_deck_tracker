import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icons.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _FavouriteState();
}

class _FavouriteState extends State<MyApp> {
  @override
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
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.5,
              //crossAxisSpacing: 10.0,
              //mainAxisSpacing: 10.0,
            ),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              double dAspectRatio = 1.8; //zoom out 1.8, zoom in 0.6
              //return Center(child: Text('Item $index'));
              //return Center(child: Image.asset('images/square.png'));
              return Card(
                color: _list[index].color,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      _list[index].image,
                      fit: BoxFit.fitWidth,
                    ),
                    ExpansionTile(
                      title: Text(_list[index].name),
                      trailing: Icon(_list[index].bExpanded
                          ? _list[index].icon_on
                          : _list[index].icon_off),
                      children: const <Widget>[
                        ListTile(title: Text('This is tile number 2')),
                      ],
                      onExpansionChanged: (value) {
                        setState(() {
                          _list[index].bExpanded = !_list[index].bExpanded;
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

@override
Widget HeroGrid() {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, childAspectRatio: 0.5,
      //crossAxisSpacing: 10.0,
      //mainAxisSpacing: 10.0,
    ),
    itemCount: 4,
    itemBuilder: (BuildContext context, int index) {
      double dAspectRatio = 1.8; //zoom out 1.8, zoom in 0.6
      int nNrOfClicks = 0;
      //return Center(child: Text('Item $index'));
      //return Center(child: Image.asset('images/square.png'));
      return Card(
        color: _list[index].color,
        child: Column(
          children: <Widget>[
            Image.asset(
              _list[index].image,
              fit: BoxFit.fitWidth,
            ),
            buildPanel(index),
            /*TextButton(
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
          ),*/
          ],
        ),
      );
    },
  );
}

@override
Widget buildPanel(int index) {
  return ExpansionPanelList(
    children: [
      ExpansionPanel(
        headerBuilder: (context, isExpanded) {
          return ListTile(
            title: Text(
              'Click' + index.toString(),
              style: TextStyle(color: Colors.black),
            ),
          );
        },
        body: ListTile(
          title:
              Text('Description text', style: TextStyle(color: Colors.black)),
        ),
        isExpanded: _list[index].bExpanded,
        canTapOnHeader: true,
      ),
    ],
    dividerColor: Colors.grey,
    expansionCallback: (index2, bool isExpanded) {
      //setState(() {
      index2 = index;
      _list[index2].bExpanded = !isExpanded;
      //});
    },
  );
}

class PortraitItem {
  final String image;
  final IconData icon_on;
  final IconData icon_off;
  final String name;
  final Color color;
  bool bExpanded;
  PortraitItem(this.image, this.icon_on, this.icon_off, this.name, this.color,
      this.bExpanded);
}

List<PortraitItem> _list = [
  PortraitItem('images/alice.jpg', HeroIcons.alice_on, HeroIcons.alice_off,
      'Alice', Color.fromARGB(255, 152, 208, 236), false),
  PortraitItem('images/arthur.jpg', HeroIcons.arthur_on, HeroIcons.arthur_off,
      'Arthur', Colors.red, false),
  PortraitItem('images/medusa.jpg', HeroIcons.medusa_on, HeroIcons.medusa_off,
      'Medusa', Color.fromARGB(255, 127, 255, 7), false),
  PortraitItem('images/sinbad.jpg', HeroIcons.sinbad_on, HeroIcons.sinbad_off,
      'Sinbad', Colors.amber, false),
];
