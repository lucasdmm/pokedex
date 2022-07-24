import 'package:dio/dio.dart';
import 'package:pokedex/shared/errors/failiure.dart';
import 'package:pokedex/shared/models/generation.dart';

import '../models/pokemon.dart';
import 'constants.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPkm();
  Future<PokeDetailData> getDetail({required String pokeName});
  Future<Generation> getGeneration({required int generationId});
}

class PokemonRepository implements IPokemonRepository {
  final Dio dio;

  PokemonRepository({required this.dio});

  @override
  Future<List<Pokemon>> getAllPkm() async {
    Response response;
    try {
      response = await dio.get(PokeAPI.allPoke);
      final data =
          response.data['results'].map((pk) => Pokemon.fromMap(pk)).toList();
      final list = data.cast<Pokemon>();
      return list;
    } catch (e) {
      throw Failiure(message: 'Não Foi Possível carregar os dados!');
    }
  }

  @override
  Future<PokeDetailData> getDetail({required String pokeName}) async {
    try {
      final response = await dio.get(PokeAPI.pokemonV2Url + pokeName);
      final data = PokeDetailData.fromMap(response.data);
      return data;
    } catch (e) {
      throw Failiure(message: 'Não Foi Possível carregar os dados!');
    }
  }

  @override
  Future<Generation> getGeneration({required int generationId}) async {
    try {
      final response =
          await dio.get(PokeAPI.generation + generationId.toString());
      final data = Generation.fromMap(response.data);
      return data;
    } catch (e) {
      throw Failiure(message: 'Não Foi Possível carregar os dados!');
    }
  }
}
