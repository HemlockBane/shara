import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shara_movies/core/data/remote/model/movie_list_response.dart';
import 'package:shara_movies/core/data/repository/movie_repository.dart';
import 'package:shara_movies/core/data/resource.dart';
import 'package:shara_movies/core/di/di.dart';

abstract class MovieHomeUiState {}

class DefaultState extends MovieHomeUiState {}

class LoadingState extends MovieHomeUiState {}

class SuccessState extends MovieHomeUiState {
  SuccessState({
    this.data = const <MovieSummary>[],
  });

  final List<MovieSummary> data;
}

class FailureState extends MovieHomeUiState {}



const int debounceTime = 300;

class MovieHomeViewModel extends Cubit<MovieHomeUiState> {
  MovieHomeViewModel({MovieRepository? movieRepository})
      : _movieRepository = movieRepository ?? locator<MovieRepository>(),
        super(DefaultState());

  final MovieRepository _movieRepository;
  Timer? _timer;

  void findMovie({required String title}) async {
    if (title.isEmpty) {
      emit(DefaultState());
    } else {
      _timer?.cancel();
      _timer = Timer(const Duration(milliseconds: debounceTime), () => _triggerSearch(title));
    }
  }

  Future<void> _triggerSearch(String title) async {
    emit(LoadingState());
    final resource = await _movieRepository.findMovie(title: title);
    if (resource is Failure<List<MovieSummary>>) {
      emit(FailureState());
    } else {
      final movies = resource.data ?? [];
      if (movies.isEmpty) {
        emit(SuccessState(data: []));
      }
      emit(SuccessState(data: movies));
    }
  }
}
