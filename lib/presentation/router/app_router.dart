import 'package:cubit_learn_1/presentation/screens/home_screen.dart';
import 'package:cubit_learn_1/presentation/screens/second_screen.dart';
import 'package:cubit_learn_1/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
            title: 'Home Screen',
            color: Colors.blueAccent,
          ),
        );

      case '/second':
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(
            title: 'Second Screen',
            color: Colors.redAccent,
          ),
        );

      case '/third':
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(
            title: 'Third Screen',
            color: Colors.greenAccent,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
            title: 'Home Screen',
            color: Colors.blueAccent,
          ),
        );
    }
  }
}
