import 'package:characters_app/busniess_logic/cubit/characters_cubit.dart';
import 'package:characters_app/constants/string.dart';
import 'package:characters_app/data/Api_services/characters_api_service.dart';
import 'package:characters_app/data/repos/character_repo.dart';
import 'package:characters_app/presentation/screens/character_details_screen.dart';
import 'package:characters_app/presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AppRouter {
  late CharacterRepo characterRepo;
  late CharactersCubit charactersCubit;
  AppRouter() {
    characterRepo = CharacterRepo(CharactersApiService());
    charactersCubit = CharactersCubit(characterRepo);
  }

  Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (BuildContext context) => CharactersCubit(characterRepo),
                child: HomeScreen(),
              ),
        );
      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(body: Center(child: Text('Page Not Found!'))),
        );
    }
  }
}
