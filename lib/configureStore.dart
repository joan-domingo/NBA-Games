import 'package:nba_games/NbaApi.dart';
import 'package:nba_games/gameList/gameList.redux.dart';
import 'package:nba_games/root.redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

final appStore = new Store<AppState>(
  appReducer,
  initialState: AppState.initialState(),
  middleware: configureMiddleware(),
);

List<Middleware<AppState>> configureMiddleware() {
  final apiClient = NbaApi();

  return [
    EpicMiddleware<AppState>(FetchGamesEpic(apiClient)),
  ];
}
