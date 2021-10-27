import 'package:flutter/material.dart';
import 'package:touch_speed/screens/configuration.dart';
import 'package:touch_speed/screens/home_menu.dart';
import 'package:touch_speed/screens/touch_ball.dart';
import 'package:touch_speed/screens/touch_speed.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainScreen(initialTime: args));
      case '/touch-ball':
        return MaterialPageRoute(builder: (_) => TouchBall(initialTime: args));
      case '/touch-speed':
        return MaterialPageRoute(builder: (_) => const TouchSpeed());
      case '/configuration':
        return MaterialPageRoute(builder: (_) => const Configuration());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text("ERROR"),
        ),
      );
    });
  }
}
