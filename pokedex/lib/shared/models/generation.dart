// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Generation {
  Generation(
      {required this.id, required this.mainRegion, required this.pokemons});
  final int id;
  final String mainRegion;
  final List<String> pokemons;
  int get getId => id;
  String get getRegion => mainRegion;
  List<String> get getPkm => pokemons;

  factory Generation.fromMap(Map<String, dynamic> map) {
    return Generation(
        id: map['id'] as int,
        mainRegion: map['main_region'] as String,
        pokemons: List<String>.from(
          (map['pokemon_species'].map((pk) => pk['name'] as String).toList()),
        ));
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'mainRegion': mainRegion,
      'pokemons': pokemons,
    };
  }

  factory Generation.fromJson(String source) =>
      Generation.fromMap(json.decode(source) as Map<String, dynamic>);

  Generation copyWith({
    int? id,
    String? mainRegion,
    List<String>? pokemons,
  }) {
    return Generation(
      id: id ?? this.id,
      mainRegion: mainRegion ?? this.mainRegion,
      pokemons: pokemons ?? this.pokemons,
    );
  }
}
