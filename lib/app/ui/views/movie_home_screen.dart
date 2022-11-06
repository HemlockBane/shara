import 'package:flutter/material.dart';
import 'package:shara_movies/core/data/remote/movie_api_client.dart';
import 'package:shara_movies/core/data/repository/movie_repository.dart';
import 'package:shara_movies/core/di/di.dart';

class MovieHomeScreen extends StatefulWidget {
  const MovieHomeScreen({super.key, required this.title});
  final String title;

  @override
  State<MovieHomeScreen> createState() => _MovieHomeScreenState();
}

class _MovieHomeScreenState extends State<MovieHomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container()
    );
  }
}
