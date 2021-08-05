import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/constants/colors.dart';

class DarkModeSet extends StatefulWidget {
  @override
  _DarkModeSetState createState() => _DarkModeSetState();
}

class _DarkModeSetState extends State<DarkModeSet> {
  bool darkMode = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Dark Mode",
              style: GoogleFonts.workSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 17.5,
                  color: kPrimaryColor)),
          Switch(
            value: darkMode,
            onChanged: (value) {
              setState(() {
                darkMode = value;
              });
            },
            activeTrackColor: kPrimaryColor.withOpacity(0.6),
            activeColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
