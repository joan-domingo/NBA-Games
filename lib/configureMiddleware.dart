import 'package:nba_games/AppState.dart';
import 'package:nba_games/NbaApi.dart';
import 'package:nba_games/redux/epics.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

List<Middleware<AppState>> configureMiddleware() {
  final apiClient = NbaApi();

  return [
    EpicMiddleware<AppState>(FetchGamesEpic(apiClient)),
  ];
}
