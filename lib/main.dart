import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nba_games/AppRoutes.dart';
import 'package:nba_games/AppState.dart';
import 'package:nba_games/gameDetails/GameDetailsScreen.dart';
import 'package:nba_games/gameList/GameListScreen.dart';
import 'package:nba_games/configureMiddleware.dart';
import 'package:nba_games/redux/reducers.dart';
import 'package:redux/redux.dart';

void main() => runApp(NbaGamesApp());

class NbaGamesApp extends StatelessWidget {
  final store = new Store<AppState>(
    appStateReducers,
    initialState: AppState.loading(),
    middleware: configureMiddleware(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: new MaterialApp(
        title: 'NBA games',
        initialRoute: AppRoutes.gameList,
        routes: {
          AppRoutes.gameList: (context) => GameListScreen(),
          AppRoutes.gameDetails: (context) => GameDetailsScreen(),
        },
      ),
    );
  }
}
