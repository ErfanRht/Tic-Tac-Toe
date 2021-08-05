import 'package:get/get.dart';
import 'package:tic_tac_toe/constants/types.dart';
import 'package:tic_tac_toe/controllers/user-choose-controller.dart';

class GameAiController extends GetxController {
  IntoBox intoBox = IntoBox.TABLE;
  IntoBox boxStatus = IntoBox.TABLE;
  WinnerMode lastWinner = WinnerMode.NONE;
  String lastWinnerName = '';
  int userWins = 0;
  int aiWins = 0;
  int tie = 0;

  updateGame({IntoBox newIntoBox, IntoBox newBoxStatus, WinnerMode newwinner}) {
    intoBox = newIntoBox != null ? newIntoBox : intoBox;
    boxStatus = newBoxStatus != null ? newBoxStatus : boxStatus;
    lastWinner = newwinner != null ? newwinner : lastWinner;

    if (lastWinner == WinnerMode.USER) {
      lastWinnerName = "${Get.find<UserChooseController>().userName} won";
    } else if (lastWinner == WinnerMode.AI) {
      lastWinnerName = "AI won";
    } else {
      lastWinnerName = "Draw";
    }
    update();
  }

  reset() {
    intoBox = IntoBox.TABLE;
    lastWinner = WinnerMode.NONE;
    lastWinnerName = '';
    userWins = 0;
    aiWins = 0;
    tie = 0;
  }

  addUserWins() {
    userWins++;
    update();
  }

  addAiWins() {
    aiWins++;
    update();
  }

  addTie() {
    tie++;
    update();
  }
}
