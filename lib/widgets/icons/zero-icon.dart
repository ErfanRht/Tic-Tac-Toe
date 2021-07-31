import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/constants/types.dart';

class ZeroIcon extends StatefulWidget {
  IconSize iconSize;
  bool animation;
  ZeroIcon({@required this.iconSize, this.animation = false});

  @override
  _ZeroIconState createState() => _ZeroIconState();
}

class _ZeroIconState extends State<ZeroIcon> {
  IconSize iconSize;
  double bigCircleHeight;
  double bigCirclewidth;
  double smallCircleHeight;
  double smallCircleWidth;
  List<BoxShadow> bigBoxShadow;
  List<BoxShadow> smallBoxShadow;
  @override
  void initState() {
    super.initState();
    iconSize = widget.iconSize;

    if (widget.animation) {
      bigCircleHeight = 2.5;
      bigCirclewidth = 2.5;
      smallCircleHeight = 0;
      smallCircleWidth = 0;
      animationManage();
    } else {
      if (iconSize == IconSize.MINIMAL) {
        bigCircleHeight = 49;
        bigCirclewidth = 49;
        smallCircleHeight = 17.5;
        smallCircleWidth = 17.5;
      } else if (iconSize == IconSize.MEDIUM) {
        bigCircleHeight = 0;
        bigCirclewidth = 0;
        smallCircleHeight = 0;
        smallCircleWidth = 0;
      } else if (iconSize == IconSize.MAXIMAL) {
        bigCircleHeight = 145;
        bigCirclewidth = 145;
        smallCircleHeight = 55;
        smallCircleWidth = 55;
      }
      bigBoxShadow = [
        BoxShadow(
          color: kZeroIconColor.withOpacity(0.5),
          spreadRadius: iconSize == IconSize.MAXIMAL ? 4 : 2,
          blurRadius: iconSize == IconSize.MAXIMAL ? 7 : 5,
        ),
      ];
      smallBoxShadow = [
        BoxShadow(
          color: Colors.white.withOpacity(0.5),
          spreadRadius: iconSize == IconSize.MAXIMAL ? 4 : 2,
          blurRadius: iconSize == IconSize.MAXIMAL ? 7 : 5,
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 250),
          margin: EdgeInsets.only(top: 12.5),
          height: bigCircleHeight,
          width: bigCirclewidth,
          decoration: BoxDecoration(
            color: kZeroIconColor,
            borderRadius: BorderRadius.circular(100),
            boxShadow: bigBoxShadow,
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 250),
          margin: EdgeInsets.only(top: 12.5),
          height: smallCircleHeight,
          width: smallCircleWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: smallBoxShadow,
          ),
        )
      ],
    );
  }

  animationManage() async {
    await Future.delayed(Duration(milliseconds: 5));
    setState(() {
      bigCircleHeight = 49;
      bigCirclewidth = 49;
      smallCircleHeight = 17.5;
      smallCircleWidth = 17.5;
      bigBoxShadow = [
        BoxShadow(
          color: kZeroIconColor.withOpacity(0.5),
          spreadRadius: iconSize == IconSize.MAXIMAL ? 4 : 2,
          blurRadius: iconSize == IconSize.MAXIMAL ? 7 : 5,
        ),
      ];
      smallBoxShadow = [
        BoxShadow(
          color: Colors.white.withOpacity(0.5),
          spreadRadius: iconSize == IconSize.MAXIMAL ? 4 : 2,
          blurRadius: iconSize == IconSize.MAXIMAL ? 7 : 5,
        ),
      ];
    });
  }
}
