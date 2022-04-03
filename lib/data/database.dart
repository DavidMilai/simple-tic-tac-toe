import 'package:hive/hive.dart';

class Database {
  late Box scores;

  _initBoxes() async {
    scores = await Hive.openBox('scores');
  }

  init() async {
    await Hive.initFlutter();
    await _initBoxes();
  }
}

var db = Database();
