import 'package:collection/collection.dart';

String beautifyTitleId(String? id){
  if (id?.isEmpty == true) return "";
  final parts = id?.split("/") ?? [];
  if(parts.isEmpty) return "";
  final filteredParts = parts.whereNot((item) => item.isEmpty).toList();
  final titleId = filteredParts.last;
  return titleId;
}