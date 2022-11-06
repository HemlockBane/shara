import 'package:json_annotation/json_annotation.dart';

enum TitleType {
  @JsonValue("tvSeries")
  tvSeries,
  @JsonValue("movie")
  movie,
  @JsonValue("video")
  video
}