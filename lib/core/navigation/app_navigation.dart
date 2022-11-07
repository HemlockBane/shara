import 'package:flutter/material.dart';
import 'package:shara_movies/app/ui/views/screens/movie_details_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppNavigation {
  AppNavigation._();

  static const String movieDetails = "movieDetails";

  static MaterialPageRoute? generateRouteWithSettings(RouteSettings settings) {
    switch(settings.name) {
      case movieDetails:
        return MovieDetailsScreen.buildRoute(settings);
    }
    return MaterialPageRoute(builder: (ctx) => const SizedBox.shrink());

  }
}
