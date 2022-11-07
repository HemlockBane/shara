import 'package:json_annotation/json_annotation.dart';
import 'package:shara_movies/core/data/model/movie.dart';
import 'package:shara_movies/core/data/remote/model/image.dart';
import 'package:shara_movies/core/data/remote/model/title_type.dart';
import 'package:shara_movies/core/utils/utils.dart';

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

extension MovieDetailsResponseX on MovieDetailsResponse {
  Movie get toMovie {
    return Movie(
      id: beautifyTitleId(id),
      title: title,
      image: image,
      titleType: titleType,
      durationInMinutes: runningTimeInMinutes,
      year: year,
    );
  }
}


