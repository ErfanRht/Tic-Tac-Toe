import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/constants/types.dart';
import 'package:tic_tac_toe/screens/with-friend/game/game-controller.dart';

class ResultBox extends StatefulWidget {
  @override
  _ResultBoxState createState() => _ResultBoxState();
}

class _ResultBoxState extends State<ResultBox> {
  bool showText;

  @override
  void initState() {
    super.initState();
    showText = false;
    manageAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameController>(
      builder: (state) {
        return Container(
            child: Stack(
          children: [
            Center(
              child: AnimatedOpacity(
                opacity: showText ? 1 : 0,
                duration: Duration(milliseconds: 500),
                child: Text(
                  state.lastWinnerName,
                  style: GoogleFonts.workSans(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                      color: state.lastWinner == WinnerMode.FRIEND
                          ? kZeroIconColor
                          : kPrimaryColor),
                ),
              ),
            ),
          ],
        ));
      },
    );
  }

  manageAnimation() async {
    await Future.delayed(Duration(milliseconds: 250));
    setState(() {
      showText = true;
    });
  }
}
