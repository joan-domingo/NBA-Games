import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nba_games/View/GameList.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Games'),
        ),
        body: GameList());
  }
}
