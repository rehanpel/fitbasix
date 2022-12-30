import 'package:fitbasix/Screen/Fitness/FitnessView.dart';
import 'package:fitbasix/Screen/MainBase/View/MainBaseView.dart';
import 'package:flutter/material.dart';

class Router {
  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainBaseView.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const MainBaseView(),
        );
      case FitnessView.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const FitnessView(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Material(
            child: Center(
              child: Text("404 page not founded"),
            ),
          ),
        );
    }
  }
}
