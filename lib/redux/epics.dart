import 'dart:async';

import 'package:flutter_app/NbaApi.dart';
import 'package:flutter_app/model/AppState.dart';
import 'package:flutter_app/redux/actions.dart';
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
        .asyncMap((action) => this.api.fetchGames())
        .map((response) => new FetchGamesSucceededAction(response));
        // .catchError(() => new FetchGamesFailedAction());
  }
}
