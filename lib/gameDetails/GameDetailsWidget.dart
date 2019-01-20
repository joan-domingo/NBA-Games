import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nba_games/shared/model/Game.dart';

class GameDetailsWidget extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 40.0);

  final Game game;

  GameDetailsWidget({@required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          // decoration: new BoxDecoration(color: Colors.red),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                '${game.vTeam} - ${game.hTeam}',
                style: _biggerFont,
                textAlign: TextAlign.center,
              ),
              Text(
                '${game.vScore} - ${game.hScore}',
                style: _biggerFont,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
