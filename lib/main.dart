import 'package:flutter/material.dart';
import 'package:simple_tic_tac_toe/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Tic Tac Toe',
      theme: ThemeData(primarySwatch: Colors.lime),
      routes: routes,
      initialRoute: RouteConfig.defaultRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
