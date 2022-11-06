import 'package:json_annotation/json_annotation.dart';
import 'package:shara_movies/core/data/remote/model/image.dart';
import 'package:shara_movies/core/data/remote/model/title_type.dart';

part 'movie_details_response.g.dart';

@JsonSerializable()
class MovieDetailsResponse {
  MovieDetailsResponse({
    this.type,
    this.id,
    this.image,
    this.runningTimeInMinutes,
    this.nextEpisode,
    this.numberOfEpisodes,
    this.seriesEndYear,
    this.seriesStartYear,
    this.title,
    this.titleType,
    this.year,
  });

  String? type;
  String? id;
  Image? image;
  int? runningTimeInMinutes;
  String? nextEpisode;
  int? numberOfEpisodes;
  int? seriesEndYear;
  int? seriesStartYear;
  String? title;
  TitleType? titleType;
  int? year;

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) => _$MovieDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsResponseToJson(this);
}

