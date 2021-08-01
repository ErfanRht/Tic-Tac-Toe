import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/constants/routes.dart';
import 'package:tic_tac_toe/screens/menu/menu.dart';
import 'package:tic_tac_toe/screens/with-ai/game/game.dart';
import 'package:tic_tac_toe/screens/with-ai/pick-side/pick-side.dart';
import 'package:tic_tac_toe/screens/with-friend/game/game.dart';
import 'package:tic_tac_toe/screens/with-friend/set-names/set-names.dart';
import 'constants/colors.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primaryColor: kPrimaryColor),
      debugShowCheckedModeBanner: false,
      initialRoute: menu_route,
      routes: {
        menu_route: (context) => MenuScreen(),
        pickside_route: (context) => PickSideScreen(),
        setnames_route: (context) => SetNamesScreen(),
        game_friend_route: (context) => GameFriendScreen(),
        game_ai_route: (context) => GameScreen(),
      },
    );
  }
}
