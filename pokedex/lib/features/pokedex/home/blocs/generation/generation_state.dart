part of 'generation_bloc.dart';

abstract class GenerationState extends Equatable {
  const GenerationState({this.pokemons});
  final List<Pokemon>? pokemons;

  @override
  List<Object?> get props => [pokemons];
}

class GenerationInitialState extends GenerationState {
  GenerationInitialState() : super(pokemons: []);
}

class GenerationSuccessState extends GenerationState {
  const GenerationSuccessState({required List<Pokemon> list})
      : super(pokemons: list);
}

class GenerationErrorState extends GenerationState {
  GenerationErrorState({required String errorMessage}) : super(pokemons: []);
}
