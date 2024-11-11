import 'package:flutter/material.dart';
import 'package:xo_app/core/constants/colors.dart';
import 'package:xo_app/logic/player.dart';
import 'package:xo_app/logic/xo_logic.dart';

class XoApp extends StatefulWidget {
  const XoApp({super.key});

  @override
  State<XoApp> createState() => _XoAppState();
}

class _XoAppState extends State<XoApp> {
  Color playerXColor = AppColor.white;
  Color playerOColor = AppColor.xoOPlayer;
  BorderSide noneborder = BorderSide.none;
  BorderSide borderSide = BorderSide(color: AppColor.xoBorad, width: 2);

  List<String> board = ['', '', '', '', '', '', '', '', ''];
  bool isXTurn = true;
  XoLogic xoLogic = XoLogic();

  void _resetGame() {
    setState(() {
      board = ['', '', '', '', '', '', '', '', ''];
      isXTurn = true;
      Player.playerX.clear();
      Player.playerO.clear();
    });
  }

  void _newGame() {
    setState(() {
      board = ['', '', '', '', '', '', '', '', ''];
      isXTurn = true;
      Player.playerXWin = 0;
      Player.playerOWin = 0;
      Player.playerX.clear();
      Player.playerO.clear();
    });
  }

  void _handleTap(int index) {
    if (board[index] == '') {
      setState(() {
        String activePlayer = isXTurn ? Player.x : Player.o;
        xoLogic.playGame(activePlayer, index);
        board[index] = activePlayer;
        String winner = xoLogic.checkWinner();
        if (winner != '') {
          _showWinnerDialog(winner);
        } else if (!board.contains('')) {
          _showWinnerDialog('Draw');
        }

        isXTurn = !isXTurn;
      });
    }
  }

  void _showWinnerDialog(String winner) {
    String message = winner == 'Draw' ? "It's a draw!" : 'Player $winner wins!';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Over'),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resetGame();
              },
              child: const Text('New Game'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.xoApp,
      appBar: AppBar(
        leading: IconButton(
    onPressed: () {
      Navigator.pop(context);
    },
    icon: Icon(Icons.arrow_back), // مثال لإضافة أيقونة
  ),
  title: Text('Tic Tac Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 60,
          ),
          Column(
            children: [
              Text(
                'TIC TAC TOE',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: AppColor.white),
              ),
              Text(
                '....................................',
                style: TextStyle(color: AppColor.xoBorad, fontSize: 30),
              )
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                  text: TextSpan(
                      text: Player.playerXWin.toString(),
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 55,
                      ),
                      children: [
                    TextSpan(
                        text: ' : ', style: TextStyle(color: AppColor.xoBorad)),
                    TextSpan(
                        text: Player.playerOWin.toString(),
                        style: TextStyle(color: AppColor.xoBtn)),
                  ]))
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  xoBtnboard(
                      btnFun: () => _handleTap(0),
                      rightSide: borderSide,
                      bottomSide: borderSide,
                      board: board[0]),
                  xoBtnboard(
                      btnFun: () => _handleTap(1),
                      rightSide: borderSide,
                      bottomSide: borderSide,
                      board: board[1]),
                  xoBtnboard(
                      btnFun: () => _handleTap(2),
                      rightSide: noneborder,
                      bottomSide: borderSide,
                      board: board[2]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  xoBtnboard(
                      btnFun: () => _handleTap(3),
                      rightSide: borderSide,
                      bottomSide: borderSide,
                      board: board[3]),
                  xoBtnboard(
                      btnFun: () => _handleTap(4),
                      rightSide: borderSide,
                      bottomSide: borderSide,
                      board: board[4]),
                  xoBtnboard(
                      btnFun: () => _handleTap(5),
                      rightSide: noneborder,
                      bottomSide: borderSide,
                      board: board[5]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  xoBtnboard(
                      btnFun: () => _handleTap(6),
                      rightSide: borderSide,
                      bottomSide: noneborder,
                      board: board[6]),
                  xoBtnboard(
                      btnFun: () => _handleTap(7),
                      rightSide: borderSide,
                      bottomSide: noneborder,
                      board: board[7]),
                  xoBtnboard(
                      btnFun: () => _handleTap(8),
                      rightSide: noneborder,
                      bottomSide: noneborder,
                      board: board[8]),
                ],
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              xoBtn(text: 'Reset Game', btnFun: _resetGame),
              const SizedBox(
                height: 15,
              ),
              xoBtn(text: 'New Game', btnFun: _newGame),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  InkWell xoBtnboard(
      {required void Function()? btnFun,
      required BorderSide rightSide,
      required BorderSide bottomSide,
      required String board}) {
    Color textColor;
    if (board == Player.x) {
      textColor = AppColor.white; // X color (amber)
    } else {
      textColor = AppColor.xoOPlayer; // O color (green)
    }

    return InkWell(
      onTap: btnFun,
      child: Container(
        width: 100,
        height: 100,
        decoration:
            BoxDecoration(border: Border(right: rightSide, bottom: bottomSide)),
        child: Center(
          child: Text(
            board,
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: textColor),
          ),
        ),
      ),
    );
  }

  MaterialButton xoBtn(
      {required void Function()? btnFun, required String text}) {
    return MaterialButton(
      onPressed: btnFun,
      color: AppColor.xoBtn,
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
      child: Text(
        text,
        style: TextStyle(color: AppColor.white, fontSize: 20),
      ),
    );
  }
}
