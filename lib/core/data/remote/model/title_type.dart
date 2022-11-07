import 'package:json_annotation/json_annotation.dart';

enum TitleType {
  @JsonValue("tvSeries")
  tvSeries,
  @JsonValue("movie")
  movie,
  @JsonValue("video")
  video,
  @JsonValue("short")
  short,
  @JsonValue("tvEpisode")
  tvEpisode,
  @JsonValue("tvMiniSeries")
  tvMiniSeries,
  @JsonValue("tvMovie")
  tvMovie,
  @JsonValue("tvSpecial")
  tvSpecial,
  @JsonValue("tvShort")
  tvShort
}