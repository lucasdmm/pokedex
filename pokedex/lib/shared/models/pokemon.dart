// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Pokemon {
  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.weaknesses,
  });

  final String num;
  final String name;
  final int id;
  final String img;
  final List<String> type;
  final String height;
  final String weight;
  final List<String> weaknesses;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'num': num,
      'name': name,
      'id': id,
      'img': img,
      'type': type,
      'height': height,
      'weight': weight,
      'weaknesses': weaknesses,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      id: map['id'] as int,
      num: map['num'] as String,
      name: map['name'] as String,
      img: map['img'] as String,
      type: (map['type'] as List<dynamic>).map((e) => e as String).toList(),
      height: map['height'] as String,
      weight: map['weight'] as String,
      weaknesses:
          (map['weaknesses'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) =>
      Pokemon.fromMap(json.decode(source) as Map<String, dynamic>);
}
