import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/constants/routes.dart';
import 'package:tic_tac_toe/controllers/user-choose-controller.dart';
import 'package:tic_tac_toe/screens/with-friend/set-names/set-controller.dart';
import 'package:tic_tac_toe/screens/with-friend/set-names/set.dart';
import 'package:tic_tac_toe/widgets/button.dart';

class SetNamesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserChooseController>(builder: (state) {
      return WillPopScope(
          onWillPop: closePage,
          child: Scaffold(
            backgroundColor: kBackgroundColor,
            body: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text('Set your names',
                        style: GoogleFonts.workSans(
                            fontSize: 17.5, fontWeight: FontWeight.w600))),
                SetNamesWidget(),
                Button(
                    text: 'Continue',
                    buttonColor: Colors.white,
                    textColor: Colors.black,
                    ifClick: () {
                      if (state.userName == '' && state.friendName == '') {
                        Get.find<SetController>().updateUserChoose(
                            newError1Status: true, newError2Status: true);
                      } else if (state.userName == '') {
                        Get.find<SetController>()
                            .updateUserChoose(newError1Status: true);
                      } else if (state.friendName == '') {
                        Get.find<SetController>()
                            .updateUserChoose(newError2Status: true);
                      } else {
                        Get.toNamed(game_friend_route);
                      }
                    })
              ],
            )),
          ));
    });
  }

  Future<bool> closePage() async {
    Get.find<SetController>()
        .updateUserChoose(newError1Status: false, newError2Status: false);
    Get.find<UserChooseController>()
        .updateUserChoose(newUserName: '', newFriendName: '');
    return true;
  }
}
