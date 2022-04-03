import 'package:simple_tic_tac_toe/screens/home_screen.dart';
import 'package:simple_tic_tac_toe/screens/splash_screen.dart';

var routes = {
  RouteConfig.defaultRoute: (context) => SplashScreen(),
  RouteConfig.homeScreen: (context) => HomeScreen(),
};

class RouteConfig {
  static final defaultRoute = "/";
  static final homeScreen = "homeScreen";
}
