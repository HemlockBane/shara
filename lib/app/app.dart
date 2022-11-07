
import 'package:flutter/material.dart';
import 'package:shara_movies/app/ui/views/screens/movie_home_screen.dart';
import 'package:shara_movies/core/navigation/app_navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MovieHomeScreen(),
      onGenerateRoute: AppNavigation.generateRouteWithSettings,
    );
  }
}
