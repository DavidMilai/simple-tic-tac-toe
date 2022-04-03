import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_tic_tac_toe/services/score_card_service.dart';
import 'package:simple_tic_tac_toe/widgets/display_utils.dart';
import 'package:simple_tic_tac_toe/widgets/progress_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPlaying = true;

  late ProgressDialog progressDialog;

  late List<String> board;

  checkforWinner(String value) {
    if (board[0] == value && board[1] == value && board[2] == value) {
      winnerDialog(value);
      addScore(value);
      restartGame();
    } else if (board[0] == value && board[3] == value && board[6] == value) {
      winnerDialog(value);
      addScore(value);
      restartGame();
    } else if (board[0] == value && board[4] == value && board[8] == value) {
      winnerDialog(value);
      addScore(value);
      restartGame();
    } else if (board[1] == value && board[4] == value && board[7] == value) {
      winnerDialog(value);
      addScore(value);
      restartGame();
    } else if (board[2] == value && board[5] == value && board[8] == value) {
      winnerDialog(value);
      addScore(value);
      restartGame();
    } else if (board[2] == value && board[4] == value && board[6] == value) {
      winnerDialog(value);
      addScore(value);
      restartGame();
    } else if (board[3] == value && board[4] == value && board[5] == value) {
      winnerDialog(value);
      addScore(value);
      restartGame();
    } else if (board[6] == value && board[7] == value && board[8] == value) {
      winnerDialog(value);
      addScore(value);
      restartGame();
    } else if (!board.contains('Y')) {
      alert("Drawn game", "GG guys, restart the game", context: context);
      addScore('drawn');
      restartGame();
    }
  }

  playGame(int index) {
    if (board[index] == 'Y') {
      setState(() {
        if (isPlaying) {
          board[index] = 'X';
        } else {
          board[index] = 'O';
        }
      });
    }
    checkforWinner("X");
    checkforWinner("O");
    isPlaying = !isPlaying;
  }

  winnerDialog(String winner) {
    alert("We have a winner", "🎉 $winner won the game! 🎉", context: context);
  }

  addScore(String value) {
    if (value == "X") {
      int score = scoreCardService.playerOneScores;
      score++;
      scoreCardService.addScore("playerOne", score);
    } else if (value == "O") {
      int score = scoreCardService.playerTwoScores;
      score++;
      scoreCardService.addScore("playerTwo", score);
    } else {
      int score = scoreCardService.draws;
      score++;
      scoreCardService.addScore("draws", score);
    }
  }

  void restartGame() {
    setState(() {
      board = [
        "Y",
        "Y",
        "Y",
        "Y",
        "Y",
        "Y",
        "Y",
        "Y",
        "Y",
      ];
    });
  }

  resetScores() async {
    if (await confirm("Reset", "This will reset the game stats",
        cancelButtonText: "NO", okButtonText: "YES", context: context)) {
      progressDialog.message = "Clearing scores";
      progressDialog.show();
      await Future.delayed(Duration(seconds: 1));
      scoreCardService.clearScores();
      progressDialog.hide();
    }
  }

  @override
  void initState() {
    super.initState();
    progressDialog = ProgressDialog(context);
    setState(() {
      board = [
        "Y",
        "Y",
        "Y",
        "Y",
        "Y",
        "Y",
        "Y",
        "Y",
        "Y",
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tic Tac Toe", style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(
                onPressed: resetScores,
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ))
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text("Player 1",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center),
                        Selector<ScoreCardService, int>(
                            selector: (context, scoreCardService) =>
                                scoreCardService.playerOneScores,
                            builder: (context, scores, _) {
                              return Text("X - $scores");
                            }),
                        if (isPlaying)
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text("Draws",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center),
                        Selector<ScoreCardService, int>(
                            selector: (context, scoreCardService) =>
                                scoreCardService.draws,
                            builder: (context, scores, _) {
                              return Text("$scores");
                            }),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          "Player 2",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        Selector<ScoreCardService, int>(
                            selector: (context, scoreCardService) =>
                                scoreCardService.playerTwoScores,
                            builder: (context, scores, _) {
                              return Text("O - $scores");
                            }),
                        if (!isPlaying)
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(20.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                ),
                itemCount: 9,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    playGame(index);
                  },
                  child: Container(
                    height: size.width / 4,
                    width: size.width / 4,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Center(
                        child: Text(
                      board[index] == "Y" ? "" : board[index],
                      style: TextStyle(fontSize: 40),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
