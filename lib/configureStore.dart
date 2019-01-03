import 'package:nba_games/NbaApi.dart';
import 'package:nba_games/gameList/gameList.redux.dart';
import 'package:nba_games/root.redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:redux_logging/redux_logging.dart';

final appStore = new Store<AppState>(
  appReducer,
  initialState: AppState.initialState(),
  middleware: configureMiddleware(NbaApi()),
);

List<Middleware<AppState>> configureMiddleware(NbaApi api) {
  final epics = combineEpics<AppState>([
    FetchGamesEpic(api),
    RefreshGamesEpic(api),
  ]);

  return [
    new EpicMiddleware(epics),
    new LoggingMiddleware.printer(),
  ];
}
