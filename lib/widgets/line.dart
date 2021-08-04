import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/constants/types.dart';

class Line extends StatefulWidget {
  LineMode lineMode;
  Line(this.lineMode);

  @override
  _LineState createState() => _LineState();
}

class _LineState extends State<Line> {
  double height;
  double width;
  @override
  void initState() {
    super.initState();
    height = 0;
    width = 0;
    animationManage();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1250),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: kPrimaryColor,
      ),
    );
  }

  animationManage() async {
    await Future.delayed(Duration(milliseconds: 250));
    setState(() {
      height = widget.lineMode == LineMode.VERTICAL
          ? MediaQuery.of(context).size.width - 40
          : 3;
      width = widget.lineMode == LineMode.VERTICAL
          ? 3
          : MediaQuery.of(context).size.width - 40;
    });
  }
}
