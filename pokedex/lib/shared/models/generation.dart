// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:pokedex/shared/models/pokemon.dart';

class Generation {
  Generation({required this.pokemons});

  final List<Pokemon> pokemons;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pokemons': pokemons.map((x) => x.toMap()).toList(),
    };
  }

  factory Generation.fromMap(Map<String, dynamic> map) {
    return Generation(
      pokemons: List<Pokemon>.from(
        (map['pokemon_species']).map<Pokemon>(
          (x) => Pokemon.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Generation.fromJson(String source) =>
      Generation.fromMap(json.decode(source) as Map<String, dynamic>);
}
