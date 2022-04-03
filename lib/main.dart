import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_tic_tac_toe/routes.dart';
import 'package:simple_tic_tac_toe/services/score_card_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: scoreCardService),
      ],
      child: MaterialApp(
        title: 'Simple Tic Tac Toe',
        theme: ThemeData(primarySwatch: Colors.amber),
        routes: routes,
        initialRoute: RouteConfig.defaultRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
