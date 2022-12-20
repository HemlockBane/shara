

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:rxdart/subjects.dart';
import 'package:shara_movies/app/domain/get_movie_details_usecase.dart';
import 'package:shara_movies/core/data/model/movie.dart';
import 'package:shara_movies/core/data/resource.dart';
import 'package:shara_movies/core/di/di.dart';

class MovieDetailsUiState{}

class LoadingState extends MovieDetailsUiState {}

class SuccessState extends MovieDetailsUiState {
  SuccessState({
    required this.data,
  });

  final Movie? data;
}

class FailureState extends MovieDetailsUiState {}

class MovieDetailsViewModel{
  MovieDetailsViewModel({GetMovieDetailsUseCase? getMovieDetailsUseCase})
      : _getMovieDetailsUseCase = getMovieDetailsUseCase ?? locator<GetMovieDetailsUseCase>();

  final GetMovieDetailsUseCase _getMovieDetailsUseCase;
  final _uiStateController = BehaviorSubject<MovieDetailsUiState>.seeded(LoadingState());

  Stream<MovieDetailsUiState> get uiStateStream =>
      _uiStateController.distinct();

  void getMovieDetails({required String id})async{
    if (_uiStateController.state is! LoadingState){
      _uiStateController.emit(LoadingState());
    }

    final movieDetailsStream = _getMovieDetailsUseCase.getMovieDetails(id);
    await for (final event in movieDetailsStream){
      if (event is Failure){
        _uiStateController.emit(FailureState());
      }else{
        _uiStateController.emit(SuccessState(data: event.data));
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
