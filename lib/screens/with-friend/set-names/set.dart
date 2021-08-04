import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/constants/types.dart';
import 'package:tic_tac_toe/controllers/user-choose-controller.dart';
import 'package:tic_tac_toe/screens/with-friend/set-names/set-controller.dart';
import 'package:tic_tac_toe/widgets/icons/cross-icon.dart';
import 'package:tic_tac_toe/widgets/icons/zero-icon.dart';

class SetNamesWidget extends StatelessWidget {
  final SetController globalController = Get.put(SetController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SetController>(builder: (state) {
      return Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
          child: Row(
            children: [
              Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width / 2 - 10,
                  child: Column(
                    children: [
                      CrossIcon(
                        iconSize: IconSize.MAXIMAL,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          maxLength: 25,
                          style: GoogleFonts.workSans(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w700),
                          cursorColor: kPrimaryColor,
                          decoration: InputDecoration(
                            errorText: state.error1
                                ? "This feild can't be empty"
                                : null,
                            border: new UnderlineInputBorder(
                                borderSide:
                                    new BorderSide(color: kPrimaryColor)),
                            counterText: '',
                            hintText: 'Enter name',
                          ),
                          onTap: () {
                            Get.find<SetController>()
                                .updateUserChoose(newError1Status: false);
                          },
                          onChanged: (text) {
                            updateSets(UserMode.USER, text);
                          },
                          onSubmitted: (text) {
                            updateSets(UserMode.USER, text);
                          },
                        ),
                      ),
                    ],
                  )),
              Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width / 2 - 10,
                  child: Column(children: [
                    ZeroIcon(
                      iconSize: IconSize.MAXIMAL,
                    ),
                    SizedBox(
                      height: 42.55,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 10),
                      child: TextField(
                        textAlign: TextAlign.center,
                        maxLength: 25,
                        style: GoogleFonts.workSans(
                            color: kZeroIconColor, fontWeight: FontWeight.w700),
                        cursorColor: kZeroIconColor,
                        decoration: InputDecoration(
                          errorText:
                              state.error2 ? "This feild can't be empty" : null,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kZeroIconColor),
                          ),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: kZeroIconColor,
                                  style: BorderStyle.solid)),
                          counterText: '',
                          hintText: 'Enter name',
                        ),
                        onTap: () {
                          Get.find<SetController>()
                              .updateUserChoose(newError2Status: false);
                        },
                        onChanged: (text) {
                          updateSets(UserMode.FRIEND, text);
                        },
                        onSubmitted: (text) {
                          updateSets(UserMode.FRIEND, text);
                        },
                      ),
                    )
                  ]))
            ],
          ),
        ),
      );
    });
  }

  updateSets(UserMode userMode, String name) {
    if (userMode == UserMode.USER) {
      Get.find<UserChooseController>().updateUserChoose(newUserName: name);
    } else if (userMode == UserMode.FRIEND) {
      Get.find<UserChooseController>().updateUserChoose(newFriendName: name);
    }
  }
}
