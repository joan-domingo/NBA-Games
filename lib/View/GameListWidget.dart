import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nba_games/View/LoadingIndicator.dart';
import 'package:nba_games/model/Game.dart';

class GameListWidget extends StatelessWidget {
  final List<Game> games;
  final bool isLoadingGames;

  GameListWidget({@required this.games, @required this.isLoadingGames});

  @override
  Widget build(BuildContext context) {
    return isLoadingGames
        ? LoadingIndicator()
        : ListView(
            children: this.games.map((Game game) =>
                    ListTile(title: Text("${game.vTeam}-${game.hTeam}")))
                .toList());
  }
}
