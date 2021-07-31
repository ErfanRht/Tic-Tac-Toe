import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/constants/types.dart';
import 'package:vector_math/vector_math.dart';

class CrossIcon extends StatefulWidget {
  IconSize iconSize;
  CrossIcon({@required this.iconSize});

  @override
  _CrossIconState createState() => _CrossIconState();
}

class _CrossIconState extends State<CrossIcon> {
  IconSize iconSize;
  double height;
  double width;
  @override
  void initState() {
    super.initState();
    iconSize = widget.iconSize;

    if (iconSize == IconSize.MINIMAL) {
      height = 55;
      width = 15;
    } else if (iconSize == IconSize.MEDIUM) {
      height = 0;
      width = 0;
    } else if (iconSize == IconSize.MAXIMAL) {
      height = 175;
      width = 50;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.rotate(
            angle: radians(45),
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.5),
                    spreadRadius: iconSize == IconSize.MAXIMAL ? 4 : 2,
                    blurRadius: iconSize == IconSize.MAXIMAL ? 7 : 5,
                  ),
                ],
              ),
            )),
        Transform.rotate(
            angle: radians(-45),
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: kPrimaryColor.withOpacity(0.5),
                      spreadRadius: iconSize == IconSize.MAXIMAL ? 4 : 2,
                      blurRadius: iconSize == IconSize.MAXIMAL ? 7 : 5,
                    )
                  ]),
            ))
      ],
    );
  }
}
