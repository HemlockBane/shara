import 'package:flutter_dotenv/flutter_dotenv.dart';

const String xRapidApiKey = "X-RapidAPI-Key";
const String xRapidApiHost = "X-RapidAPI-Host";


class ApiConfig {
  static String get xRapidApiKey => dotenv.env["xRapidApiKey"] ?? "";
  static const String xRapidApiHost = "imdb8.p.rapidapi.com";
  static const String xRapidApiBaseUrl = "https://imdb8.p.rapidapi.com";
}