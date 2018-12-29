import 'dart:async';

import 'package:nba_games/AppState.dart';
import 'package:nba_games/NbaApi.dart';
import 'package:nba_games/redux/actions.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/transformers.dart';

class FetchGamesEpic implements EpicClass<AppState> {
  final NbaApi api;

  FetchGamesEpic(this.api);

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) {
    return Observable(actions)
        .ofType(TypeToken<FetchGamesAction>())
        .asyncMap((action) => this.api.fetchGames()
            .then((response) {
              action.completer.complete();
              return new FetchGamesSucceededAction(response);
            }).catchError(() => new FetchGamesFailedAction()));
  }
}
