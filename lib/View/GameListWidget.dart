import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nba_games/View/LoadingIndicator.dart';
import 'package:nba_games/model/Game.dart';
import 'package:nba_games/redux/actions.dart';

class GameListWidget extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  final List<Game> games;
  final bool isLoadingGames;
  final Function() refreshGames;
  final FetchGamesAction fetchGamesAction;

  GameListWidget({
    @required this.games,
    @required this.isLoadingGames,
    @required this.refreshGames,
    @required this.fetchGamesAction,
  });

  @override
  Widget build(BuildContext context) {
    return isLoadingGames
        ? LoadingIndicator()
        : RefreshIndicator(
            child: ListView.separated(
              padding: const EdgeInsets.all(16.0),
              separatorBuilder: (context, i) => Divider(),
              itemCount: games.length,
              itemBuilder: (context, i) => _buildRow(games[i]),
            ),
            onRefresh: () {
              refreshGames();
              return fetchGamesAction.completer.future;
            });
  }

  Widget _buildRow(Game game) {
    return ListTile(
      leading: Text(game.id),
      title: Text(
        "${game.vTeam}-${game.hTeam}",
        style: _biggerFont,
        textAlign: TextAlign.center,
      ),
      trailing: Text(game.location),
    );
  }
}
