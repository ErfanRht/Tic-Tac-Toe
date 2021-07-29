import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/statusbar-color.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StatusBarColor();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Image.asset('assets/images/logo.png'),
            )
          ],
        ),
      ),
    );
  }
}
