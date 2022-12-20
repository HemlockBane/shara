// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_synopsis_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieSynopsisResponse _$MovieSynopsisResponseFromJson(
        Map<String, dynamic> json) =>
    MovieSynopsisResponse(
      language: json['language'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$MovieSynopsisResponseToJson(
        MovieSynopsisResponse instance) =>
    <String, dynamic>{
      'language': instance.language,
      'text': instance.text,
    };
