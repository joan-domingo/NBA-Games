import 'package:flutter/widgets.dart';
import 'package:nba_games/gameDetails/GameDetailsScreen.dart';
import 'package:nba_games/gameList/GameListScreen.dart';

class AppRoutes {
  static const gameList = '/';
  static const gameDetails = '/gameDetails';

  static String initialRoute() {
    return gameList;
  }

  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      AppRoutes.gameList: (context) => GameListScreen(),
      AppRoutes.gameDetails: (context) => GameDetailsScreen(),
    };
  }
}
