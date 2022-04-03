import 'package:flutter/cupertino.dart';
import 'package:simple_tic_tac_toe/data/database.dart';

class ScoreCardService extends ChangeNotifier {
  int get playerOneScores => db.scores.get("X", defaultValue: 0);
  int get playerTwoScores => db.scores.get("O", defaultValue: 0);
  int get draws => db.scores.get("draws", defaultValue: 0);

  Future addScore(String player, score) async {
    await db.scores.put(player, score);
    notifyListeners();
  }

  Future clearScores() async {
    await db.scores.clear();
    notifyListeners();
  }
}

var scoreCardService = ScoreCardService();
