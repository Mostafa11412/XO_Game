import 'package:flutter/material.dart';
import 'package:route/xo/xoButton.dart';

class Xoscreen extends StatefulWidget {
  const Xoscreen({super.key});

  @override
  State<Xoscreen> createState() => _XoscreenState();
}

class _XoscreenState extends State<Xoscreen> {
  int score1 = 0;
  int score2 = 0;
  List<String> boardstate = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('XO Game'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Player One",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      score1.toString(),
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Player One",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      score2.toString(),
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XoButton(
                  label: boardstate[0],
                  onClick: onclick,
                  index: 0,
                ),
                XoButton(
                  label: boardstate[1],
                  onClick: onclick,
                  index: 1,
                ),
                XoButton(
                  label: boardstate[2],
                  onClick: onclick,
                  index: 2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XoButton(
                  label: boardstate[3],
                  onClick: onclick,
                  index: 3,
                ),
                XoButton(
                  label: boardstate[4],
                  onClick: onclick,
                  index: 4,
                ),
                XoButton(
                  label: boardstate[5],
                  onClick: onclick,
                  index: 5,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XoButton(
                  label: boardstate[6],
                  onClick: onclick,
                  index: 6,
                ),
                XoButton(
                  label: boardstate[7],
                  onClick: onclick,
                  index: 7,
                ),
                XoButton(
                  label: boardstate[8],
                  onClick: onclick,
                  index: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onclick(index) {
    if (boardstate[index].isNotEmpty) {
      return;
    }
    if (count.isEven) {
      boardstate[index] = "X";
      bool win = checkWin("X");
      if (win) {
        score1 += 1;
        resetBoard();
      }
    }else if (count.isOdd) {
      boardstate[index] = "O";
      bool win = checkWin("O");

      if (win) {
        score2 += 1;
        resetBoard();
      }
    }

    count++;
    setState(() {});
    if (count == 10) {
      resetBoard();
    }
  }

  resetBoard() {
    boardstate = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    count = 0;
  }

  bool checkWin(String state) {
    for (int i = 0; i < 9; i += 3) {
      if (state == boardstate[i] &&
          state == boardstate[i + 1] &&
          state == boardstate[i + 2]) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (state == boardstate[i] &&
          state == boardstate[i + 3] &&
          state == boardstate[i + 6]) {
        return true;
      }
    }
    if (state == boardstate[0] &&
        state == boardstate[4] &&
        state == boardstate[8]) {
      return true;
    }
    if (state == boardstate[2] &&
        state == boardstate[4] &&
        state == boardstate[6]) {
      return true;
    }
    return false;
  }
}
