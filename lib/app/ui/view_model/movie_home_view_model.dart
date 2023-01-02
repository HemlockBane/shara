import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shara_movies/core/data/remote/model/movie_list_response.dart';
import 'package:shara_movies/core/data/repository/movie_repository.dart';
import 'package:shara_movies/core/di/di.dart';
import 'package:rxdart/rxdart.dart';

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

class MovieHomeViewModel extends Cubit<MovieHomeUiState> {
  MovieHomeViewModel({MovieRepository? movieRepository})
      : _movieRepository = movieRepository ?? locator<MovieRepository>(),
        super(DefaultState());

  static const int debounceTimeInMillis = 300;
  static const Duration debounceDuration = Duration(milliseconds: debounceTimeInMillis);

  final MovieRepository _movieRepository;


  void findMovie({required String title}) async {
    Stream.value(title)
        .debounce((event) => TimerStream(event, debounceDuration))
        .distinct()
        .listen(_triggerSearch);
  }

  Future<void> _triggerSearch(String title) async {
    if (title.isEmpty) {
      emit(DefaultState());
    } else {
      emit(LoadingState());
      final response = await _movieRepository.findMovie(title: title);
      if (response.isSuccess()) {
        emit(SuccessState(data: response.data ?? []));
      } else if (response.isFailure()) {
        emit(FailureState());
      }
    }
  }
}
