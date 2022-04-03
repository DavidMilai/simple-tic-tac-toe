import 'package:alert/alert.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPlaying = true;

  List<int> playerOne = [], playerTwo = [];

  late List<String> board;

  checkforWinner(String value) {
    if (board[0] == value && board[1] == value && board[2] == value) {
      print("$value won");
      restartGame();
      Alert(message: 'Test').show();
    } else if (board[0] == value && board[3] == value && board[6] == value) {
      print("$value won");
      restartGame();
    } else if (board[0] == value && board[4] == value && board[8] == value) {
      restartGame();
      print("$value won");
    } else if (board[1] == value && board[4] == value && board[7] == value) {
      restartGame();
      print("$value won");
    } else if (board[2] == value && board[5] == value && board[8] == value) {
      restartGame();
      print("$value won");
    } else if (board[2] == value && board[4] == value && board[6] == value) {
      restartGame();
      print("$value won");
    } else if (board[3] == value && board[4] == value && board[5] == value) {
      restartGame();
      print("$value won");
    } else if (board[6] == value && board[7] == value && board[8] == value) {
      restartGame();
      print("$value won");
    }
  }

  void playGame(int index) {
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

  @override
  void initState() {
    super.initState();
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
    return Scaffold(
      appBar: AppBar(title: Text("Tic Tac Toe")),
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
                      Text(
                        "Player 1\nX",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
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
                      Text(
                        "Player 2\nO",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
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
                  playerOne.add(index);
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
    );
  }
}
