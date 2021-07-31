import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/controllers/user-choose-controller.dart';

class ScoreBoard extends StatelessWidget {
  final UserChooseController userChooseController =
      Get.put(UserChooseController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            userChooseController.userName,
            style: GoogleFonts.workSans(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          SizedBox(
            width: 35,
          ),
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
                "0 - 0",
                style: GoogleFonts.workSans(
                    fontSize: 22.5,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            width: 35,
          ),
          Text(
            userChooseController.friendName,
            style: GoogleFonts.workSans(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
