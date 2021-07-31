import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/types.dart';
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
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: MediaQuery.of(context).size.width - 40,
      padding: EdgeInsets.all(35),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 7,
          ),
        ],
      ),
      child: Stack(
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
      ),
    );
  }

  checkWin() {
    if ((gameState[0] != BoxValue.EMPTY) &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      // if any user Win update the message state
      setState(() {
        // this.message = '${this.gameState[0]} wins';
        // this.Delay();
      });
    } else if ((gameState[3] != BoxValue.EMPTY) &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        // this.message = '${this.gameState[3]} wins';
        // this.Delay();
      });
    } else if ((gameState[6] != BoxValue.EMPTY) &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        // this.message = '${this.gameState[6]} wins';
        // this.Delay();
      });
    } else if ((gameState[0] != BoxValue.EMPTY) &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        // this.message = '${this.gameState[0]} wins';
        // this.Delay();
      });
    } else if ((gameState[1] != BoxValue.EMPTY) &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        // this.message = '${this.gameState[1]} wins';
        // this.Delay();
      });
    } else if ((gameState[2] != BoxValue.EMPTY) &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        // this.message = '${this.gameState[2]} wins';
        // this.Delay();
      });
    } else if ((gameState[0] != BoxValue.EMPTY) &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        // this.message = '${this.gameState[0]} wins';
        // this.Delay();
      });
    } else if ((gameState[2] != BoxValue.EMPTY) &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        // this.message = '${this.gameState[2]} wins';
        // this.Delay();
      });
    } else if (!gameState.contains(BoxValue.EMPTY)) {
      setState(() {
        // this.message = 'Game Draw';
        // this.Delay();
      });
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

  Widget intoBox(BoxValue value) {
    switch (value) {
      case (BoxValue.EMPTY):
        return Text('');
        break;
      case (BoxValue.CROSS):
        return Center(child: CrossIcon(iconSize: IconSize.MINIMAL));
        break;
      case (BoxValue.ZERO):
        return Center(child: ZeroIcon(iconSize: IconSize.MINIMAL));
        break;
    }
  }
}
