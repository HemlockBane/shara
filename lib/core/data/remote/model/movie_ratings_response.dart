import 'package:json_annotation/json_annotation.dart';

part 'movie_ratings_response.g.dart';

@JsonSerializable()
class MovieRatingsResponse {
  MovieRatingsResponse({
    this.rating,
  });

  double? rating;
  factory MovieRatingsResponse.fromJson(Map<String, dynamic> json) => _$MovieRatingsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieRatingsResponseToJson(this);
}
