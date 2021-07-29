import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatefulWidget {
  final String text;
  final Color buttonColor;
  final Color textColor;
  final dynamic ifClick;
  Button(
      {@required this.text,
      @required this.buttonColor,
      @required this.textColor,
      @required this.ifClick});
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  // init data
  String text;
  Color buttonColor;
  Color textColor;
  dynamic ifClick;

  // widget own data
  double buttonWidth;
  double buttonHeight;

  @override
  void initState() {
    super.initState();
    text = widget.text;
    buttonColor = widget.buttonColor;
    textColor = widget.textColor;
    ifClick = widget.ifClick;
    buttonWidth = 170;
    buttonHeight = 45;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ifClick();
      },
      onHighlightChanged: (status) {
        if (status) {
          setState(() {
            buttonWidth = 130;
          });
        }
        if (!status) {
          setState(() {
            buttonWidth = 170;
            buttonHeight = 45;
          });
        }
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: buttonColor,
          boxShadow: [
            BoxShadow(
              color: buttonColor != Colors.white
                  ? buttonColor.withOpacity(0.5)
                  : Colors.grey.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 7,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.workSans(
                fontSize: 15, fontWeight: FontWeight.w600, color: textColor),
          ),
        ),
      ),
    );
  }
}
