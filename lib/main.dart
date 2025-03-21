import 'package:characters_app/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CharactersApp(appRouter: AppRouter() ,));
}

class CharactersApp extends StatelessWidget {
  const CharactersApp({super.key, required this.appRouter});
final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
