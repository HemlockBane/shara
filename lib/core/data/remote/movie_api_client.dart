import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:shara_movies/core/api_config.dart';
import 'package:shara_movies/core/data/remote/model/movie_details_response.dart';
import 'package:shara_movies/core/data/remote/model/movie_list_response.dart';
import 'package:shara_movies/core/data/remote/model/movie_ratings_response.dart';
import 'package:shara_movies/core/data/remote/model/movie_synopsis_response.dart';

part 'movie_api_client.g.dart';

@RestApi(baseUrl: ApiConfig.xRapidApiBaseUrl)
abstract class MovieApiClient {
  factory MovieApiClient(Dio dio, {String baseUrl}) = _MovieApiClient;

  @GET("/title/v2/find")
  Future<MovieListResponse> findMovie({
    @Query("title") required String title,
    @Query("titleType") String? titleType,
    @Query("limit") int? limit,
  });

  @GET("/title/get-details")
  Future<MovieDetailsResponse> getMovieDetails({
    @Query("tconst") required String titleId,
  });

  @GET("/title/get-synopses")
  Future<List<MovieSynopsisResponse>> getMovieSynopsis({
    @Query("tconst") required String titleId,
  });

  @GET("/title/get-ratings")
  Future<MovieRatingsResponse> getMovieRatings({
    @Query("tconst") required String titleId,
  });
}
