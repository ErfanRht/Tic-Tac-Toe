import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/constants/types.dart';
import 'package:vector_math/vector_math.dart';

// ignore: must_be_immutable
class CrossIcon extends StatefulWidget {
  IconSize iconSize;
  bool animation;
  CrossIcon({@required this.iconSize, this.animation = false});

  @override
  _CrossIconState createState() => _CrossIconState();
}

class _CrossIconState extends State<CrossIcon> {
  IconSize iconSize;
  double height;
  double width;
  List<BoxShadow> boxShadow = [];
  @override
  void initState() {
    super.initState();
    iconSize = widget.iconSize;
    if (widget.animation) {
      height = 2.5;
      width = 2.5;
      animationManage();
    } else {
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
      boxShadow = [
        BoxShadow(
          color: kPrimaryColor.withOpacity(0.5),
          spreadRadius: iconSize == IconSize.MAXIMAL ? 4 : 2,
          blurRadius: iconSize == IconSize.MAXIMAL ? 7 : 5,
        )
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.rotate(
            angle: radians(45),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(50),
                boxShadow: boxShadow,
              ),
            )),
        Transform.rotate(
            angle: radians(-45),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              height: height,
              width: width,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: boxShadow),
            )),
      ],
    );
  }

  animationManage() async {
    await Future.delayed(Duration(milliseconds: 5));
    setState(() {
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
      boxShadow = [
        BoxShadow(
          color: kPrimaryColor.withOpacity(0.5),
          spreadRadius: iconSize == IconSize.MAXIMAL ? 4 : 2,
          blurRadius: iconSize == IconSize.MAXIMAL ? 7 : 5,
        )
      ];
    });
  }
}
