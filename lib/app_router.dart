import 'package:characters_app/constants/string.dart';
import 'package:characters_app/presentation/screens/character_details_screen.dart';
import 'package:characters_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route ? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case characterScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
    }
  }
}
