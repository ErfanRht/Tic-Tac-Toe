import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'gradient-icon.dart';

class PrimaryIconButton extends StatefulWidget {
  final dynamic icon;
  PrimaryIconButton({@required this.icon});
  @override
  _PrimaryIconButtonState createState() => _PrimaryIconButtonState();
}

class _PrimaryIconButtonState extends State<PrimaryIconButton> {
  dynamic icon;

  @override
  void initState() {
    super.initState();
    icon = widget.icon;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 4,
                blurRadius: 7,
              ),
            ],
          ),
          child: GradientIcon(
            Icons.settings,
            30.0,
            LinearGradient(
              colors: <Color>[
                kPrimaryColor,
                kPrimaryColor.withOpacity(0.5),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
        ));
  }
}
