import 'package:get/get.dart';
import 'package:tic_tac_toe/constants/types.dart';

class UserChooseController extends GetxController {
  PlayMode playMode;
  UserSide userSide = UserSide.CROSS;

  String userName = '';
  String friendName = '';

  updateUserChoose(
      {PlayMode newPlayMode,
      UserSide newUserSide,
      String newUserName,
      String newFriendName}) {
    playMode = newPlayMode != null ? newPlayMode : playMode;
    userSide = newUserSide != null ? newUserSide : userSide;
    userName = newUserName != null ? newUserName : userName;
    friendName = newFriendName != null ? newFriendName : friendName;
    update();
  }
}
