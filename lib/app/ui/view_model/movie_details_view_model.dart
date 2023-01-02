

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:rxdart/subjects.dart';
import 'package:shara_movies/app/domain/get_movie_details_usecase.dart';
import 'package:shara_movies/core/data/model/movie.dart';
import 'package:shara_movies/core/data/resource.dart';
import 'package:shara_movies/core/di/di.dart';

import 'movie_details_ui_state.dart';



class MovieDetailsViewModel{
  MovieDetailsViewModel({GetMovieDetailsUseCase? getMovieDetailsUseCase})
      : _getMovieDetailsUseCase = getMovieDetailsUseCase ?? locator<GetMovieDetailsUseCase>();

  final GetMovieDetailsUseCase _getMovieDetailsUseCase;
  static const loadingState = MovieDetailsUiState.loading();
  final _uiStateController = BehaviorSubject<MovieDetailsUiState>.seeded(loadingState);

  Stream<MovieDetailsUiState> get uiStateStream =>
      _uiStateController.stream;

  void getMovieDetails({required String id}) async {
    if (_uiStateController.state is! Loading) {
      _uiStateController.emit(loadingState);
    }

    final movieDetailsStream = _getMovieDetailsUseCase.getMovieDetails(id);
    await for (final event in movieDetailsStream) {
      if (event.isFailure()) {
        const failedState = MovieDetailsUiState.failed();
        _uiStateController.emit(failedState);
      } else {
        final successState = MovieDetailsUiState.success(data: event.data);
        _uiStateController.emit(successState);
      }
    }
  }
}


extension StateX<T> on BehaviorSubject<T>{
  T get state => value; 

  void emit(T state){
   try {
      if (isClosed) {
        throw StateError('Cannot emit new states after calling close');
      }
      add(state);
    } catch (error, stackTrace) {
      log(error.toString());
    }
  }
}
