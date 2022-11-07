// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsResponse _$MovieDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    MovieDetailsResponse(
      type: json['type'] as String?,
      id: json['id'] as String?,
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
      runningTimeInMinutes: json['runningTimeInMinutes'] as int?,
      nextEpisode: json['nextEpisode'] as String?,
      numberOfEpisodes: json['numberOfEpisodes'] as int?,
      seriesEndYear: json['seriesEndYear'] as int?,
      seriesStartYear: json['seriesStartYear'] as int?,
      title: json['title'] as String?,
      titleType: $enumDecodeNullable(_$TitleTypeEnumMap, json['titleType']),
      year: json['year'] as int?,
    );

Map<String, dynamic> _$MovieDetailsResponseToJson(
        MovieDetailsResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'image': instance.image,
      'runningTimeInMinutes': instance.runningTimeInMinutes,
      'nextEpisode': instance.nextEpisode,
      'numberOfEpisodes': instance.numberOfEpisodes,
      'seriesEndYear': instance.seriesEndYear,
      'seriesStartYear': instance.seriesStartYear,
      'title': instance.title,
      'titleType': _$TitleTypeEnumMap[instance.titleType],
      'year': instance.year,
    };

const _$TitleTypeEnumMap = {
  TitleType.tvSeries: 'tvSeries',
  TitleType.movie: 'movie',
  TitleType.video: 'video',
  TitleType.short: 'short',
  TitleType.tvEpisode: 'tvEpisode',
  TitleType.tvMiniSeries: 'tvMiniSeries',
  TitleType.tvMovie: 'tvMovie',
  TitleType.tvSpecial: 'tvSpecial',
  TitleType.tvShort: 'tvShort',
};
