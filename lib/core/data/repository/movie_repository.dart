import 'package:injectable/injectable.dart';
import 'package:shara_movies/core/data/model/movie.dart';
import 'package:shara_movies/core/data/remote/model/movie_list_response.dart';
import 'package:shara_movies/core/data/remote/model/movie_ratings_response.dart';
import 'package:shara_movies/core/data/remote/model/movie_synopsis_response.dart';
import 'package:shara_movies/core/data/remote/movie_api_client.dart';

import '../remote/model/movie_details_response.dart';

const String errorMessage = "An error occurred";
const String titleType =
    "movie,tvSeries,short,tvEpisode,tvMiniSeries,tvMovie,tvSpecial,tvShort,video";

@Singleton()
class MovieRepository {
  MovieRepository({required MovieApiClient movieApiClient})
      : _movieApiClient = movieApiClient;

  final MovieApiClient _movieApiClient;

  Future<List<MovieSummary>> findMovie({
    required String title,
    int limit = 20,
  }) async {
    try {
      final response = await _movieApiClient.findMovie(title, titleType, limit,);
      return response.results ?? [];
    } catch (e) {
      rethrow;
    }
  }

  Future<Movie> getMovieDetails({required String id}) async {
    try {
      MovieDetailsResponse response = await _movieApiClient.getMovieDetails(id);
      final movie = response.toMovie;
      return movie;
    } catch (e) {
      rethrow;
    }
  }

  Future<MovieSynopsisResponse> getMovieSynopsis({required String id}) async {
    try {
      final response = await _movieApiClient.getMovieSynopsis(id);
      return response.first;
    } catch (e) {
      rethrow;
    }
  }

  Future<MovieRatingsResponse> getMovieRatings({required String id}) async {
    try {
      MovieRatingsResponse response = await _movieApiClient.getMovieRatings(id);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
