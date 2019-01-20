import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nba_games/gameDetails/GameDetailsScreen.dart';
import 'package:nba_games/gameList/gameList.redux.dart';
import 'package:nba_games/shared/model/Game.dart';
import 'package:nba_games/shared/widget/LoadingIndicatorWidget.dart';

class GameListWidget extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  final List<Game> games;
  final bool isLoadingGames;
  final Function() refreshGames;
  final RefreshGamesAction refreshGamesAction;

  GameListWidget({
    @required this.games,
    @required this.isLoadingGames,
    @required this.refreshGames,
    @required this.refreshGamesAction,
  });

  @override
  Widget build(BuildContext context) {
    return isLoadingGames
        ? LoadingIndicatorWidget()
        : RefreshIndicator(
            child: ListView.separated(
              separatorBuilder: (context, i) => Divider(),
              itemCount: games.length,
              itemBuilder: (context, i) => _buildRow(games[i], context),
            ),
            onRefresh: () {
              refreshGames();
              return refreshGamesAction.completer.future;
            });
  }

  Widget _buildRow(Game game, BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GameDetailsScreen(gameId: game.id),
          )),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              '${game.vTeam} ${game.vScore} - ${game.hScore} ${game.hTeam}',
              style: _biggerFont,
              textAlign: TextAlign.center,
            ),
            Text(
              '${game.venue} (${game.city})',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
