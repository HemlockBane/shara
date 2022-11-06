// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      height: json['height'] as int?,
      id: json['id'] as String?,
      url: json['url'] as String?,
      width: json['width'] as int?,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'height': instance.height,
      'id': instance.id,
      'url': instance.url,
      'width': instance.width,
    };
