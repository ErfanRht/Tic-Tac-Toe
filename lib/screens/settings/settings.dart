import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/screens/settings/sets/darkmode.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Settings",
            style: GoogleFonts.workSans(
                fontWeight: FontWeight.w600,
                color: kPrimaryColor,
                fontSize: 22.5)),
        iconTheme: IconThemeData(color: kPrimaryColor),
      ),
      body: Column(
        children: [
          DarkModeSet(),
          Divider(
            indent: 0.2,
          )
        ],
      ),
    );
  }
}
