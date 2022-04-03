import 'package:flutter/material.dart';
import 'package:simple_tic_tac_toe/data/database.dart';

import '../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigate() async {
    Navigator.pushReplacementNamed(context, RouteConfig.homeScreen);
  }

  void initDatabase() async {
    await db.init();
    await Future.delayed(Duration(seconds: 1), navigate);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Splash Screen")),
    );
  }
}
