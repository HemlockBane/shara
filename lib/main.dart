import 'package:flutter/material.dart';
import 'package:shara_movies/app/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/di/di.dart';

void main() async {
  setup();
  runApp(const App());
}

setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await dotenv.load();
}
