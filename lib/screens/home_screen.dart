import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> playerOne = [], playerTwo = [];

  late List<String> board;

  checkforWinner(String value) {
    //board[0,1,2]
    //board[0,3,6]
    //board[0,4,8]
    //board[1,4,7]
    //board[2,5,8]
    //board[2,4,6]
    //board[3,4,5]
    //board[6,7,8]
    if (board[0] == value && board[1] == value && board[2] == value) {
      print("$value won");
    } else if (board[0] == value && board[3] == value && board[6] == value) {
      print("$value won");
    } else if (board[0] == value && board[4] == value && board[8] == value) {
      print("$value won");
    } else if (board[1] == value && board[4] == value && board[7] == value) {
      print("$value won");
    } else if (board[2] == value && board[5] == value && board[8] == value) {
      print("$value won");
    } else if (board[2] == value && board[4] == value && board[6] == value) {
      print("$value won");
    } else if (board[3] == value && board[4] == value && board[5] == value) {
      print("$value won");
    } else if (board[6] == value && board[7] == value && board[8] == value) {
      print("$value won");
    }
  }

  void playGame(int index) {
    print(index);
    if (board[index] == 'Y') {
      setState(() {
        board[index] = 'X';
      });
    }
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
