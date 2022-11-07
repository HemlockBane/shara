import 'package:shara_movies/core/data/remote/model/image.dart';
import 'package:shara_movies/core/data/remote/model/title_type.dart';

class Movie {
  Movie(
      {this.type,
      this.id,
      this.image,
      this.durationInMinutes,
      this.nextEpisode,
      this.numberOfEpisodes,
      this.seriesEndYear,
      this.seriesStartYear,
      this.title,
      this.titleType,
      this.year,
      this.rating,
      this.synopsis});

  String? type;
  String? id;
  Image? image;
  int? durationInMinutes;
  String? nextEpisode;
  int? numberOfEpisodes;
  int? seriesEndYear;
  int? seriesStartYear;
  String? title;
  TitleType? titleType;
  int? year;
  String? synopsis;
  double? rating;

  Movie copyWith(
      {String? type,
      String? id,
      Image? image,
      int? durationInMinutes,
      String? nextEpisode,
      int? numberOfEpisodes,
      int? seriesEndYear,
      int? seriesStartYear,
      String? title,
      TitleType? titleType,
      int? year,
      String? synopsis,
      double? rating}) {
    return Movie(
        type: type ?? this.type,
        id: id ?? this.id,
        image: image ?? this.image,
        durationInMinutes: durationInMinutes ?? this.durationInMinutes,
        nextEpisode: nextEpisode ?? this.nextEpisode,
        numberOfEpisodes: numberOfEpisodes ?? this.numberOfEpisodes,
        seriesEndYear: seriesEndYear ?? this.seriesEndYear,
        seriesStartYear: seriesStartYear ?? this.seriesStartYear,
        title: title ?? this.title,
        titleType: titleType ?? this.titleType,
        year: year ?? this.year,
        rating: rating ?? this.rating,
        synopsis: synopsis ?? this.synopsis);
  }
}
