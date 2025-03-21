import 'package:characters_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route ? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());

    }
  }
}
