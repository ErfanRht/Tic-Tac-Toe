import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/constants/routes.dart';
import 'package:tic_tac_toe/controllers/user-choose-controller.dart';
import 'package:tic_tac_toe/screens/with-ai/game/game-box/game-box.dart';
import 'package:tic_tac_toe/screens/with-ai/game/game-controller.dart';
import 'package:tic_tac_toe/screens/with-ai/game/scoreboard.dart';
import 'package:tic_tac_toe/widgets/icon-button.dart';

class GameAiScreen extends StatelessWidget {
  final UserChooseController globalController = Get.put(UserChooseController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: closePage,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScoreBoard(),
              SizedBox(
                height: 20,
              ),
              GameBox(),
              SizedBox(
                height: 75,
              ),
              Center(
                  child: PrimaryIconButton(
                icon: Icons.settings,
                onTap: () {
                  Get.toNamed(settings_route);
                },
              ))
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> closePage() async {
    Get.find<GameAiController>().reset();
    Get.offAndToNamed(menu_route);
    return true;
  }
}
