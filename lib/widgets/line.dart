import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/constants/types.dart';

class Line extends StatelessWidget {
  LineMode lineMode;
  Line(this.lineMode);
  @override
  Widget build(BuildContext context) {
    double height = lineMode == LineMode.VERTICAL
        ? MediaQuery.of(context).size.width - 40
        : 3;
    double width = lineMode == LineMode.VERTICAL
        ? 3
        : MediaQuery.of(context).size.width - 40;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: kPrimaryColor,
      ),
    );
  }
}
