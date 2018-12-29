import 'dart:async';

import 'package:nba_games/NbaApi.dart';

class FetchGamesAction {
  final Completer<Null> completer;

  FetchGamesAction({Completer completer})
      : this.completer = completer ?? Completer<Null>();
}

class FetchGamesSucceededAction {
  final FetchedGamesResult fetchedGamesResult;

  FetchGamesSucceededAction(this.fetchedGamesResult);
}

class FetchGamesFailedAction {}
