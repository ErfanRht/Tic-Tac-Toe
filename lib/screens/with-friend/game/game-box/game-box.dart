import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/constants/types.dart';
import 'package:tic_tac_toe/screens/with-friend/game/game-controller.dart';
import 'package:tic_tac_toe/screens/with-friend/game/game-box/game-table.dart';

class GameBox extends StatelessWidget {
  final GameController gameController = Get.put(GameController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameController>(builder: (state) {
      return Container(
          width: MediaQuery.of(context).size.width - 40,
          height: MediaQuery.of(context).size.width - 40,
          padding: EdgeInsets.all(35),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 7,
              ),
            ],
          ),
          child: intoBox(state.intoBox));
    });
  }

  Widget intoBox(IntoBox intoBox) {
    switch (intoBox) {
      case (IntoBox.TABLE):
        return GameTable();
        break;
      case (IntoBox.RESULT):
        return null;
        break;
    }
  }
}
