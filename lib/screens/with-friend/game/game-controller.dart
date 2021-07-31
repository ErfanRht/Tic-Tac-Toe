import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/constants/types.dart';

class GameController extends GetxController {
  IntoBox intoBox = IntoBox.TABLE;
  UserMode lastWinner;

  updateGame({IntoBox newIntoBox, UserMode newwinner}) {
    intoBox = newIntoBox != null ? newIntoBox : intoBox;
    lastWinner = newwinner != null ? newwinner : lastWinner;

    update();
  }
}
