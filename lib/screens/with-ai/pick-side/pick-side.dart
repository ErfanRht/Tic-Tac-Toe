import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/constants/routes.dart';
import 'package:tic_tac_toe/screens/with-ai/pick-side/pick.dart';
import 'package:tic_tac_toe/widgets/button.dart';

class PickSideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text('Pick your side',
                  style: GoogleFonts.workSans(
                      fontSize: 17.5, fontWeight: FontWeight.w600))),
          PickSideWidget(),
          Button(
              text: 'Continue',
              buttonColor: Colors.white,
              textColor: Colors.black,
              ifClick: () {
                Get.toNamed(game_route);
              })
        ],
      )),
    );
  }
}
