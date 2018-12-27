import 'package:flutter_app/NbaApi.dart';

class FetchGamesAction {}

class FetchGamesSucceededAction {
  final FetchedGamesResult fetchedGamesResult;

  FetchGamesSucceededAction(this.fetchedGamesResult);
}

class FetchGamesFailedAction {}
