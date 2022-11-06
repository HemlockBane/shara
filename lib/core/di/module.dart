import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shara_movies/core/data/remote/interceptor/auth_interceptor.dart';
import 'package:shara_movies/core/data/remote/movie_api_client.dart';

@module
abstract class RegisterModule {
  @singleton
  Dio get dio {
    final baseOptions = BaseOptions();
    void logger(Object data) => log(data.toString());

    return Dio(baseOptions)
      ..interceptors.addAll([
        AuthInterceptor(),
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: logger,
        )
      ]);
  }

  @singleton
  MovieApiClient get movieApiClient => MovieApiClient(dio);
}