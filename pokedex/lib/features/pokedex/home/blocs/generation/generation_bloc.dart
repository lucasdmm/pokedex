import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/shared/repo/pokemon_repository.dart';

import '../../../../../shared/models/pokemon.dart';

part 'generation_event.dart';
part 'generation_state.dart';

final _repo = PokemonRepository(dio: Dio());

class GenerationBloc extends Bloc<GenerationEvent, GenerationState> {
  GenerationBloc() : super(GenerationInitialState()) {
    on<GenerationLoadEvent>((event, emit) async {
      try {
        var list =
            await _repo.getPkByGeneration(generationId: event.generation);
        emit(GenerationSuccessState(list: list));
        //  list: list.sublist(event.start, event.limit)));
      } catch (e) {
        emit(GenerationErrorState(
            errorMessage: 'Não foi Possível carregar os dados.'));
      }
    });

    on<AllGenerationEvent>(((event, emit) async {
      try {
        var list = await _repo.getAllPkm();
        emit(GenerationSuccessState(list: list));
      } catch (e) {
        emit(GenerationErrorState(
            errorMessage: 'Não foi Possível carregar os dados.'));
      }
    }));
    // final List<Pokemon> pokemon;
  }
}
