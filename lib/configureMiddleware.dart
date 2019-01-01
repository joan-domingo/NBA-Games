import 'package:nba_games/NbaApi.dart';
import 'package:nba_games/gameList/gameList.redux.dart';
import 'package:nba_games/root.redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

List<Middleware<AppState>> configureMiddleware() {
  final apiClient = NbaApi();

  return [
    EpicMiddleware<AppState>(FetchGamesEpic(apiClient)),
  ];
}
