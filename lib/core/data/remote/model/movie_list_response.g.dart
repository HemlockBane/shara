// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListResponse _$MovieListResponseFromJson(Map<String, dynamic> json) =>
    MovieListResponse(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      paginationKey: json['paginationKey'] as String?,
    );

Map<String, dynamic> _$MovieListResponseToJson(MovieListResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'paginationKey': instance.paginationKey,
    };

MovieSummary _$MovieSummaryFromJson(Map<String, dynamic> json) => MovieSummary(
      id: json['id'] as String?,
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
      title: json['title'] as String?,
      titleType: $enumDecodeNullable(_$TitleTypeEnumMap, json['titleType']),
      year: json['year'] as int?,
      disambiguation: json['disambiguation'] as String?,
    );

Map<String, dynamic> _$MovieSummaryToJson(MovieSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'titleType': _$TitleTypeEnumMap[instance.titleType],
      'year': instance.year,
      'disambiguation': instance.disambiguation,
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
