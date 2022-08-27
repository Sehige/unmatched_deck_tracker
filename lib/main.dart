import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/hero_details.dart';
import 'icons.dart';
import 'hero_details.dart';

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
      debugShowCheckedModeBanner: false,
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
              crossAxisCount: 2, childAspectRatio: 1.1,
              //crossAxisSpacing: 10.0,
              //mainAxisSpacing: 10.0,
            ),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              double dAspectRatio = 1.8; //zoom out 1.8, zoom in 0.6
              //return Center(child: Text('Item $index'));
              //return Center(child: Image.asset('images/square.png'));
              return Card(
                color: list[index].color,
                child: Column(
                  children: <Widget>[
                    Hero(
                      tag: list[index].image,
                      child: Image.asset(
                        list[index].image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            list[index].name,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            alignment: Alignment.centerRight,
                            icon: Icon(list[index].icon),
                            onPressed: () {
                              nPassedIndex = index;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HeroDetails(),
                                ),
                              );
                              setState(
                                () {},
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    /*ExpansionTile(
                      title: Text(list[index].name),
                      trailing: Icon(list[index].bExpanded
                          ? list[index].icon_on
                          : list[index].icon_off),
                      children: <Widget>[
                        const ListTile(title: Text('Data to be added')),
                        ElevatedButton(
                          child: const Text('Expand'),
                          onPressed: () {
                            nPassedIndex = index;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HeroDetails(),
                              ),
                            );
                          },
                        ),
                      ],
                      onExpansionChanged: (value) {
                        setState(() {
                          list[index].bExpanded = !list[index].bExpanded;
                        });
                      },
                    ),*/
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
        color: list[index].color,
        child: Column(
          children: <Widget>[
            Image.asset(
              list[index].image,
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      );
    },
  );
}

/*@override
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
        isExpanded: list[index].bExpanded,
        canTapOnHeader: true,
      ),
    ],
    dividerColor: Colors.grey,
    expansionCallback: (index2, bool isExpanded) {
      //setState(() {
      index2 = index;
      list[index2].bExpanded = !isExpanded;
      //});
    },
  );
}*/

class PortraitItem {
  final Color color;
  final IconData icon;
  final String image;
  final String name;
  final String sidekick;
  PortraitItem(this.color, this.icon, this.image, this.name, this.sidekick);
}

int nPassedIndex = 0;

List<PortraitItem> list = [
  PortraitItem(Color.fromARGB(255, 152, 208, 236), HeroIcons.alice_on,
      'images/alice.jpg', 'Alice', 'The Jabberwock'),
  PortraitItem(
      Colors.red, HeroIcons.arthur_on, 'images/arthur.jpg', 'Arthur', 'Merlin'),
  PortraitItem(Color.fromARGB(255, 127, 255, 7), HeroIcons.medusa_on,
      'images/medusa.jpg', 'Medusa', 'Harpies'),
  PortraitItem(Colors.amber, HeroIcons.sinbad_on, 'images/sinbad.jpg', 'Sinbad',
      'The Porter'),
];
