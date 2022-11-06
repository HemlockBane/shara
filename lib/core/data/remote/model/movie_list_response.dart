import 'package:json_annotation/json_annotation.dart';
import 'package:shara_movies/core/data/remote/model/image.dart';
import 'package:shara_movies/core/data/remote/model/title_type.dart';
part 'movie_list_response.g.dart';


@JsonSerializable()
class MovieListResponse {
  MovieListResponse({this.results, this.paginationKey});

  @JsonKey(name: "results")
  List<MovieSummary>? results;
  String? paginationKey;

  factory MovieListResponse.fromJson(Map<String, dynamic> json) => _$MovieListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListResponseToJson(this);
}

@JsonSerializable()
class MovieSummary {
  MovieSummary({
    this.id,
    this.image,
    this.title,
    this.titleType,
    this.year,
    this.disambiguation,
  });

  String? id;
  Image? image;
  String? title;
  TitleType? titleType;
  int? year;
  String? disambiguation;

  factory MovieSummary.fromJson(Map<String, dynamic> json) => _$MovieSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$MovieSummaryToJson(this);
}
