// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/remote/movie_api_client.dart' as _i4;
import '../data/repository/movie_repository.dart' as _i5;
import 'module.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.Dio>(registerModule.dio);
  gh.singleton<_i4.MovieApiClient>(registerModule.movieApiClient);
  gh.singleton<_i5.MovieRepository>(
      _i5.MovieRepository(movieApiClient: get<_i4.MovieApiClient>()));
  return get;
}

class _$RegisterModule extends _i6.RegisterModule {}
