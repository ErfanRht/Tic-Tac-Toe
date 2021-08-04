import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/constants/colors.dart';

class MenuHeader extends StatefulWidget {
  @override
  _MenuHeaderState createState() => _MenuHeaderState();
}

class _MenuHeaderState extends State<MenuHeader> {
  bool showImage;
  bool showText;
  EdgeInsets textpadding;

  @override
  void initState() {
    super.initState();
    showImage = false;
    showText = false;
    textpadding = EdgeInsets.only(top: 35);
    animationManage();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedOpacity(
          opacity: showText ? 1 : 0,
          duration: Duration(milliseconds: 500),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            padding: textpadding,
            child: Text(
              'Welcome',
              style: GoogleFonts.workSans(
                  fontSize: 55,
                  fontWeight: FontWeight.w800,
                  color: kPrimaryColor),
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: showImage ? 1 : 0,
          duration: Duration(milliseconds: 500),
          child: Center(
              child: Image.asset(
            'assets/images/logo.png',
            color: kPrimaryColor,
            height: 200,
          )),
        ),
      ],
    );
  }

  animationManage() async {
    await Future.delayed(Duration(milliseconds: 750));
    setState(() {
      showText = true;
      textpadding = EdgeInsets.zero;
    });
    await Future.delayed(Duration(milliseconds: 2500));
    setState(() {
      showText = false;
      textpadding = EdgeInsets.only(top: 35);
    });
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      showImage = true;
    });
  }
}
