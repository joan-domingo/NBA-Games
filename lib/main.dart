import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nba_games/AppState.dart';
import 'package:nba_games/NbaApi.dart';
import 'package:nba_games/View/HomeScreen.dart';
import 'package:nba_games/redux/actions.dart';
import 'package:nba_games/redux/epics.dart';
import 'package:nba_games/redux/reducers.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

void main() => runApp(NbaGamesApp());

class NbaGamesApp extends StatelessWidget {
  final store = new Store<AppState>(appStateReducers,
      initialState: AppState.loading(),
      middleware: [
        EpicMiddleware<AppState>(FetchGamesEpic(NbaApi())),
      ]);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: new MaterialApp(title: 'NBA games',
          home: new StoreBuilder<AppState>(
              onInit: (store) => store.dispatch(new FetchGamesAction()),
              builder: (context, store) => new HomeScreen())),
    );
  }
}
