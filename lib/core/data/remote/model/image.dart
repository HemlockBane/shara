import 'package:json_annotation/json_annotation.dart';
part 'image.g.dart';

@JsonSerializable()
class Image {
  Image({
    this.height,
    this.id,
    this.url,
    this.width,
  });

  int? height;
  String? id;
  String? url;
  int? width;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}