import 'package:injectable/injectable.dart';
import 'package:shara_movies/core/data/model/movie.dart';
import 'package:shara_movies/core/data/repository/movie_repository.dart';
import 'package:shara_movies/core/data/resource.dart';

@singleton
class GetMovieDetailsUseCase {
  GetMovieDetailsUseCase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  final MovieRepository _movieRepository;

  Stream<Resource<Movie>> getMovieDetails(String id) async* {
    try {
      final movieDetails = await _movieRepository.getMovieDetails(id: id);
      final movieRatings = await _movieRepository.getMovieRatings(id: id);
      final movieSynopsis = await _movieRepository.getMovieSynopsis(id: id);

      final movie = movieDetails.copyWith(
        rating: movieRatings.rating,
        synopsis: movieSynopsis.text
      );
      yield Resource.success(movie);
    } on Exception catch (e) {
      yield Resource.failure(errorMessage: "An error occurred");
    }
  }
}
