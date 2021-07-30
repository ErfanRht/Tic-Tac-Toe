import 'package:get/get.dart';
import 'package:tic_tac_toe/constants/types.dart';

class UserChooseController extends GetxController {
  PlayMode playMode;
  UserSide userSide;

  updateUserChoose({PlayMode newPlayMode, UserSide newUserSide}) {
    playMode = newPlayMode != null ? newPlayMode : playMode;
    userSide = newUserSide != null ? newUserSide : userSide;
    update();
  }
}
