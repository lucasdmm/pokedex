import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex/shared/errors/failiure.dart';

import '../models/pokemon.dart';
import 'constants.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPkm();
}

class PokemonRepository implements IPokemonRepository {
  final Dio dio;

  PokemonRepository({required this.dio});

  @override
  Future<List<Pokemon>> getAllPkm() async {
    try {
      final response = await dio.get(PokeAPI.allPokemonsURL);

      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw Failiure(message: 'Não Foi Possível carregar os dados!');
    }
  }
}
