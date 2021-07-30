import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/constants/routes.dart';
import 'package:tic_tac_toe/constants/types.dart';
import 'package:tic_tac_toe/controllers/user-choose-controller.dart';
import 'package:tic_tac_toe/models/statusbar-color.dart';
import 'package:tic_tac_toe/widgets/button.dart';
import 'package:tic_tac_toe/widgets/icon-button.dart';

class MenuScreen extends StatelessWidget {
  final UserChooseController globalController = Get.put(UserChooseController());
  @override
  Widget build(BuildContext context) {
    StatusBarColor();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              'assets/images/logo.png',
              color: kPrimaryColor,
              height: 200,
            )),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Text(
                'Choose your play mode',
                style: GoogleFonts.workSans(
                    fontSize: 17.5, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Button(
                text: "With AI",
                buttonColor: kPrimaryColor,
                textColor: Colors.white,
                ifClick: () {
                  Get.find<UserChooseController>()
                      .updateUserChoose(newPlayMode: PlayMode.AI);
                  Get.toNamed(pickside_route);
                }),
            SizedBox(
              height: 30,
            ),
            Button(
                text: "With a friend",
                buttonColor: Colors.white,
                textColor: Colors.black,
                ifClick: () {
                  Get.find<UserChooseController>()
                      .updateUserChoose(newPlayMode: PlayMode.Friend);
                  Get.toNamed(pickside_route);
                }),
            SizedBox(
              height: 100,
            ),
            PrimaryIconButton(icon: Icons.settings)
          ],
        ),
      ),
    );
  }
}
