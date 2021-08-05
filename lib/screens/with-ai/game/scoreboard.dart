import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/controllers/user-choose-controller.dart';
import 'package:tic_tac_toe/screens/with-ai/game/game-controller.dart';

class ScoreBoard extends StatelessWidget {
  final UserChooseController userChooseController =
      Get.put(UserChooseController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameAiController>(builder: (state) {
      return Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 90,
              height: 40,
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
              child: Center(
                child: Text(
                  "${state.userWins} - ${state.aiWins}",
                  style: GoogleFonts.workSans(
                      fontSize: 22.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text(
                  "You",
                  style: GoogleFonts.workSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor),
                ),
                SizedBox(),
                Text(
                  "AI",
                  style: GoogleFonts.workSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: kZeroIconColor),
                ),
                SizedBox(),
              ],
            ),
          ],
        ),
      );
    });
  }
}
