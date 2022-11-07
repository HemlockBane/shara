
import 'package:json_annotation/json_annotation.dart';
part 'movie_synopsis_response.g.dart';

@JsonSerializable()
class MovieSynopsisResponse {
  MovieSynopsisResponse({
    this.language,
    this.text,
  });

  String? language;
  String? text;

  factory MovieSynopsisResponse.fromJson(Map<String, dynamic> json) => _$MovieSynopsisResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieSynopsisResponseToJson(this);
}