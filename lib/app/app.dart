
import 'package:flutter/material.dart';
import 'package:shara_movies/app/ui/views/movie_home_screen.dart';

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
      home: const MovieHomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
