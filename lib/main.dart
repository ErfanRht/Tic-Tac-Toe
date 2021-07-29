import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/routes.dart';
import 'package:tic_tac_toe/screens/game/game.dart';
import 'package:tic_tac_toe/screens/menu/menu.dart';
import 'package:tic_tac_toe/screens/result/result.dart';
import 'constants/colors.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: kPrimaryColor),
      debugShowCheckedModeBanner: false,
      initialRoute: menu_route,
      routes: {
        menu_route: (context) => MenuScreen(),
        game_route: (context) => GameScreen(),
        result_route: (context) => ResultScreen()
      },
    );
  }
}
