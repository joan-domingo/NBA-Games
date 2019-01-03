import 'package:mockito/mockito.dart';
import 'package:nba_games/NbaApi.dart';
import 'package:nba_games/configureStore.dart';
import 'package:nba_games/gameList/gameList.redux.dart';
import 'package:nba_games/root.redux.dart';
import 'package:redux/redux.dart';
import 'package:test_api/test_api.dart';

class MockNbaApi extends Mock implements NbaApi {}

main() {
  group('after FetchGamesAction', () {
    test('fetchGames is called', () {
      final api = MockNbaApi();

      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initialState(),
        middleware: configureMiddleware(api),
      );

      var stubResponse = FetchedGamesResult([]);
      // final testFetchGamesEpic = new FetchGamesEpic(mockNbaApi);

      when(api.fetchGames()).thenAnswer((_) => Future.value(stubResponse));

      store.dispatch(FetchGamesAction());

      verify(api.fetchGames());
    });
  });
}
