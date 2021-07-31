import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/constants/types.dart';
import 'package:tic_tac_toe/controllers/user-choose-controller.dart';
import 'package:tic_tac_toe/widgets/icons/cross-icon.dart';
import 'package:tic_tac_toe/widgets/icons/zero-icon.dart';

class PickSideWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserChooseController>(builder: (state) {
      return Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
          child: Row(
            children: [
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  updatePick(UserSide.CROSS);
                },
                child: Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width / 2 - 10,
                    child: Column(
                      children: [
                        AnimatedOpacity(
                          opacity: state.userSide == UserSide.CROSS ? 1 : 0.5,
                          duration: Duration(milliseconds: 250),
                          child: CrossIcon(
                            iconSize: IconSize.MAXIMAL,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 70),
                          child: Transform.scale(
                            scale: 1.75,
                            child: ListTile(
                              leading: Radio(
                                value: UserSide.CROSS,
                                groupValue: state.userSide,
                                onChanged: (value) {
                                  updatePick(value);
                                },
                                activeColor: kPrimaryColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  updatePick(UserSide.ZERO);
                },
                child: Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width / 2 - 10,
                    child: Column(
                      children: [
                        AnimatedOpacity(
                          opacity: state.userSide == UserSide.ZERO ? 1 : 0.5,
                          duration: Duration(milliseconds: 250),
                          child: ZeroIcon(
                            iconSize: IconSize.MAXIMAL,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40, left: 70),
                          child: Transform.scale(
                            scale: 1.75,
                            child: ListTile(
                              leading: Radio(
                                value: UserSide.ZERO,
                                groupValue: state.userSide,
                                onChanged: (value) {
                                  updatePick(value);
                                },
                                activeColor: kZeroIconColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      );
    });
  }

  updatePick(UserSide userSide) {
    Get.find<UserChooseController>().updateUserChoose(newUserSide: userSide);
  }
}
