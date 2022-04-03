import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> playerOne = [], playerTwo = [];

  late List<String> board;

  winningSpots() {
    //board[0,1,2]
    //board[0,3,6]
    //board[0,4,8]
    //board[1,4,7]
    //board[2,5,8]
    //board[2,4,6]
    //board[3,4,5]
    //board[6,7,8]
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
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
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
              itemBuilder: (context, index) => Container(
                height: size.width / 4,
                width: size.width / 4,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: GestureDetector(
                    onTap: () => print("hello $index"),
                    child: Text("to select")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
