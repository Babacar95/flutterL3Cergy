import 'dart:math';

import 'package:flutter/material.dart';
import 'package:second_windows_project/widgets/second_page.dart';

import '../models/Player.dart';

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _players = [];
  final List _colors = [Colors.yellow, Colors.red, Colors.blue, Colors.green, Colors.purple];
  final List _names = ["ThÃ©orrible", "Anissa", "Magalix", "Pierro", "Etiennou", "Elliot", "Kimmy", "Clem"];

  void _createPlayer() {
    setState(() {
      var player = Player();
      Random random = Random();
      player.age = random.nextInt(100);
      player.color = _colors[random.nextInt(_colors.length)];
      player.name = _names[random.nextInt(_names.length)];
      _players.add(player);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("CodingFactory"),
        leading: Icon(Icons.account_circle),
        actions: [
          Icon(Icons.access_alarm),
          Icon(Icons.golf_course),
          Icon(Icons.directions_bike),
        ],
        elevation: 10.0,
        centerTitle: true,


      ),
      backgroundColor: Colors.teal,
      body: Center(
          child: ListView.builder(
            itemCount: _players.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                              'Name: ${_players[index].name}',
                              style: TextStyle( color: _players[index].color)
                          ),
                          subtitle: Text('Age: ${_players[index].age}'),
                        ),
                      ]
                  )
              );
            },
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){Navigator.of(context).pushNamed(SecondPage.tag);},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );


  }
}