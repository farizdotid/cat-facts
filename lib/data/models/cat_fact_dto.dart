import 'package:cat_fact/domain/entities/cat_fact.dart';

class CatFactDto {
  final String id;
  final String text;

  CatFactDto({required this.id, required this.text});

  factory CatFactDto.fromJson(Map<String, dynamic> json) {
    return CatFactDto(id: json['_id'], text: json['text']);
  }

  CatFact toEntity() {
    return CatFact(id: id, text: text);
  }
}