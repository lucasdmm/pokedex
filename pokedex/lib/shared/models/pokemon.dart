// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Pokemon {
  Pokemon({required this.name, required this.url});

  final String name;
  final String url;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) =>
      Pokemon.fromMap(json.decode(source) as Map<String, dynamic>);
}

class PokeDetailData {
  PokeDetailData({
    required this.name,
    required this.moves,
    required this.types,
    required this.id,
    required this.weight,
    required this.height,
    required this.backImg,
    required this.frontImg,
  });

  final String name;
  final List<String> types;
  final List<String> moves;
  final int id;
  final int weight;
  final int height;
  final String backImg;
  final String frontImg;

  String get num {
    switch (id.toString().length) {
      case 1:
        return '00${id.toString()}';

      case 2:
        return '0${id.toString()}';
      case 3:
        return id.toString();
    }
    return '';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'types': types,
      'moves': moves,
      'id': id,
      'weight': weight,
      'height': height,
      'backImg': backImg,
      'frontImg': frontImg,
    };
  }

  factory PokeDetailData.fromMap(Map<String, dynamic> map) {
    return PokeDetailData(
        name: (map['name'] ?? '') as String,
        moves: (map['moves'] ?? [])
            .map((e) => e['move']['name'] as String)
            .toList()
            .cast<String>(),
        types: (map['types'] ?? [])
            .map((e) => e['type']['name'] as String)
            .toList()
            .cast<String>(),
        id: (map['id'] ?? 0) as int,
        weight: (map['weight'] ?? 0) as int,
        height: (map['height'] ?? 0) as int,
        backImg: (map['sprites']['back_default'] ?? '') as String,
        frontImg: (map['sprites']['front_default'] ?? '') as String);
  }

  String toJson() => json.encode(toMap());

  factory PokeDetailData.fromJson(String source) =>
      PokeDetailData.fromMap(json.decode(source) as Map<String, dynamic>);
}
