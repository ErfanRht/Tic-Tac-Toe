import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/constants/types.dart';
import 'package:tic_tac_toe/controllers/user-choose-controller.dart';

class GameController extends GetxController {
  IntoBox intoBox = IntoBox.TABLE;
  WinnerMode lastWinner = WinnerMode.NONE;
  String lastWinnerName = '';
  int userWins = 0;
  int friendWins = 0;
  int tie = 0;

  updateGame({IntoBox newIntoBox, WinnerMode newwinner}) {
    intoBox = newIntoBox != null ? newIntoBox : intoBox;
    lastWinner = newwinner != null ? newwinner : lastWinner;

    if (lastWinner == WinnerMode.USER) {
      lastWinnerName = "${Get.find<UserChooseController>().userName} won";
    } else if (lastWinner == WinnerMode.FRIEND) {
      lastWinnerName = "${Get.find<UserChooseController>().friendName} won";
    } else {
      lastWinnerName = "Tie";
    }
    update();
  }

  reset() {
    intoBox = IntoBox.TABLE;
    lastWinner = WinnerMode.NONE;
    lastWinnerName = '';
    userWins = 0;
    friendWins = 0;
    tie = 0;
  }

  addUserWins() {
    userWins++;
    update();
  }

  addFriendWins() {
    friendWins++;
    update();
  }

  addTie() {
    tie++;
    update();
  }
}
