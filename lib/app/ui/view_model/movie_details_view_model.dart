

import 'package:bloc/bloc.dart';
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

class MovieDetailsViewModel extends Cubit<MovieDetailsUiState>{
  MovieDetailsViewModel({GetMovieDetailsUseCase? getMovieDetailsUseCase})
      : _getMovieDetailsUseCase = getMovieDetailsUseCase ?? locator<GetMovieDetailsUseCase>(),
        super(LoadingState());

  final GetMovieDetailsUseCase _getMovieDetailsUseCase;

  void getMovieDetails({required String id})async{
    if (state is! LoadingState){
      emit(LoadingState());
    }

    final movieDetailsStream = _getMovieDetailsUseCase.getMovieDetails(id);
    await for (final event in movieDetailsStream){
      if (event is Failure){
        emit(FailureState());
      }else{
        emit(SuccessState(data: event.data));
      }
    }
  }
}