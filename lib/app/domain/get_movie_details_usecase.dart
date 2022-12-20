import 'package:injectable/injectable.dart';
import 'package:shara_movies/core/data/model/movie.dart';
import 'package:shara_movies/core/data/remote/model/movie_ratings_response.dart';
import 'package:shara_movies/core/data/remote/model/movie_synopsis_response.dart';
import 'package:shara_movies/core/data/repository/movie_repository.dart';
import 'package:shara_movies/core/data/resource.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class GetMovieDetailsUseCase {
  GetMovieDetailsUseCase({
    required MovieRepository movieRepository,
  }) : _movieRepository = movieRepository;

  final MovieRepository _movieRepository;

  Stream<Resource<Movie>> getMovieDetails(String id) async* {
    final movieDetailsStream = _movieRepository.getMovieDetails(id: id).asStream();
    final movieRatingsStream =  _movieRepository.getMovieRatings(id: id).asStream();
    final movieSynopsisStream = _movieRepository.getMovieSynopsis(id: id).asStream();

    final completeDataStream = Rx.combineLatest3(
        movieDetailsStream,
        movieRatingsStream,
        movieSynopsisStream,
        toMovie);

  }

  Triple<Resource<Movie>,
      Resource<MovieRatingsResponse>,
      Resource<List<MovieSynopsisResponse>>> toTriple(detailsResource,
      ratingsResource, synopsisResource) =>
      Triple(detailsResource, ratingsResource, synopsisResource);

  Resource<Movie> toMovie(
    Resource<Movie> detailsResource,
    Resource<MovieRatingsResponse> ratingsResource,
    Resource<List<MovieSynopsisResponse>> synopsisResource,
  ) {
    if (detailsResource.isSuccess()) {
      final movieDetails = detailsResource.data;
      
      if(ratingsResource.isFailure() || synopsisResource.isFailure()){
        // return ...
      }

      var rating =
          ratingsResource.isSuccess() ? ratingsResource.data?.rating : null;

      var synopsis = synopsisResource.isSuccess()
          ? synopsisResource.data?.first.text
          : null;

      final movie = movieDetails?.copyWith(
        rating: rating,
        synopsis: synopsis,
      );

      return Resource.success(movie);
    } else {
      return detailsResource;
    }
  }
}
//
//   Stream<Resource<Object>> _fetchOthers(String id) {
//     return _movieRepository.getMovieRatings(id: id).flatMap((event) async*{
//       if (event.isSuccess()) {
//         final synopsisStream = _movieRepository.getMovieSynopsis(id: id);
//         await for (var event in synopsisStream){
//           if (event.isSuccess()){
//
//
//         }
//       }
//
//       yield event;
//     });
//   }
// }

class Triple<A, B, C> {
  Triple(this.first, this.second, this.third);
  A first;
  B second;
  C third;
}

class Pair<A, B> {
  Pair(this.first, this.second);
  A first;
  B second;
}

extension StreamX<T> on Stream<T> {
  Stream<Resource<T>> asResource() async* {
    try {
      yield Resource.loading();
      yield* map<Resource<T>>((T event) => Resource.success(event));
    } catch (e) {
      yield Resource.failure();
    }
  }
}
