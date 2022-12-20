// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_ratings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieRatingsResponse _$MovieRatingsResponseFromJson(
        Map<String, dynamic> json) =>
    MovieRatingsResponse(
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MovieRatingsResponseToJson(
        MovieRatingsResponse instance) =>
    <String, dynamic>{
      'rating': instance.rating,
    };
