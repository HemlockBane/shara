import 'package:injectable/injectable.dart';
import 'package:shara_movies/core/data/remote/model/movie_list_response.dart';
import 'package:shara_movies/core/data/remote/movie_api_client.dart';
import 'package:shara_movies/core/data/resource.dart';

import '../remote/model/movie_details_response.dart';

const String errorMessage = "An error occurred";
const String titleType =
    "movie,tvSeries,short,tvEpisode,tvMiniSeries,tvMovie,tvSpecial,tvShort,video";

@Singleton()
class MovieRepository {
  MovieRepository({required MovieApiClient movieApiClient})
      : _movieApiClient = movieApiClient;

  final MovieApiClient _movieApiClient;

  Future<Resource<List<MovieSummary>>> findMovie({
    required String title,
    int limit = 20,
  }) async {
    Resource<List<MovieSummary>>resource;
    try {
      final response = await _movieApiClient.findMovie(title, titleType, limit,);
      resource = Resource.success(response.results ?? []);
    } catch (e) {
      resource = Resource.failure(errorMessage: "");
    }
    return resource;
  }

  Future<Resource<MovieDetailsResponse>> getMovieDetails({required String id}) async {
    Resource<MovieDetailsResponse> resource;
    try {
      final response = await _movieApiClient.getMovieDetails(id);
      resource = Resource.success(response);
    } catch (e) {
      resource = Resource.failure(errorMessage: errorMessage);
    }
    return resource;
  }
}
