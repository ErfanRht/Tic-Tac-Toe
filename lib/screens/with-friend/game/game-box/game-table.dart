import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/constants/types.dart';
import 'package:tic_tac_toe/screens/with-friend/game/game-controller.dart';
import 'package:tic_tac_toe/widgets/icons/cross-icon.dart';
import 'package:tic_tac_toe/widgets/icons/zero-icon.dart';
import 'package:tic_tac_toe/widgets/line.dart';

class GameTable extends StatefulWidget {
  @override
  _GameTableState createState() => _GameTableState();
}

class _GameTableState extends State<GameTable> {
  Turn turn;
  List<BoxValue> gameState;

  @override
  void initState() {
    super.initState();
    turn = Turn.CROSS;
    gameState = [
      BoxValue.EMPTY,
      BoxValue.EMPTY,
      BoxValue.EMPTY,
      BoxValue.EMPTY,
      BoxValue.EMPTY,
      BoxValue.EMPTY,
      BoxValue.EMPTY,
      BoxValue.EMPTY,
      BoxValue.EMPTY,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Line(LineMode.VERTICAL),
            Line(LineMode.VERTICAL),
            SizedBox()
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Line(LineMode.HORIZONTAL),
            Line(LineMode.HORIZONTAL),
            SizedBox()
          ],
        ),
        GridView.count(
          crossAxisCount: 3,
          children: List.generate(gameState.length, (index) {
            return GestureDetector(
                onTap: () {
                  playGame(index);
                },
                child: intoBox(gameState[index]));
          }),
        ),
      ],
    );
  }

  setWinner(BoxValue value) async {
    WinnerMode winner;
    if (value == BoxValue.CROSS) {
      await Future.delayed(Duration(milliseconds: 1000));
      winner = WinnerMode.USER;
      Get.find<GameController>().addUserWins();
    } else if (value == BoxValue.ZERO) {
      await Future.delayed(Duration(milliseconds: 1000));
      winner = WinnerMode.FRIEND;
      Get.find<GameController>().addFriendWins();
    } else {
      await Future.delayed(Duration(milliseconds: 1000));
      winner = WinnerMode.TIE;
      Get.find<GameController>().addTie()();
    }
    Get.find<GameController>()
        .updateGame(newIntoBox: IntoBox.RESULT, newwinner: winner);
  }

  checkWin() async {
    if ((gameState[0] != BoxValue.EMPTY) &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setWinner(gameState[0]);
    } else if ((gameState[3] != BoxValue.EMPTY) &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setWinner(gameState[3]);
    } else if ((gameState[6] != BoxValue.EMPTY) &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setWinner(gameState[6]);
    } else if ((gameState[0] != BoxValue.EMPTY) &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setWinner(gameState[0]);
    } else if ((gameState[1] != BoxValue.EMPTY) &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setWinner(gameState[1]);
    } else if ((gameState[2] != BoxValue.EMPTY) &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setWinner(gameState[2]);
    } else if ((gameState[0] != BoxValue.EMPTY) &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setWinner(gameState[0]);
    } else if ((gameState[2] != BoxValue.EMPTY) &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setWinner(gameState[2]);
    } else if (!gameState.contains(BoxValue.EMPTY)) {
      setWinner(BoxValue.EMPTY);
    }
  }

  playGame(int index) {
    if (gameState[index] == BoxValue.EMPTY) {
      setState(() {
        if (turn == Turn.CROSS) {
          gameState[index] = BoxValue.CROSS;
          turn = Turn.ZERO;
        } else {
          gameState[index] = BoxValue.ZERO;
          turn = Turn.CROSS;
        }
        checkWin();
      });
    }
  }

  // ignore: missing_return
  Widget intoBox(BoxValue value) {
    switch (value) {
      case (BoxValue.EMPTY):
        return Text('');
        break;
      case (BoxValue.CROSS):
        return Center(
            child: CrossIcon(
          iconSize: IconSize.MINIMAL,
          animation: true,
        ));
        break;
      case (BoxValue.ZERO):
        return Center(
            child: Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: ZeroIcon(
            iconSize: IconSize.MINIMAL,
            animation: true,
          ),
        ));
        break;
    }
  }
}
