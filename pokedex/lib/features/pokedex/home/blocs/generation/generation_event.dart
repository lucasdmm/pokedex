part of 'generation_bloc.dart';

abstract class GenerationEvent extends Equatable {
  const GenerationEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class GenerationLoadEvent extends GenerationEvent {
  GenerationLoadEvent({required this.generation});
  //{required this.pokemons, required this.start, required this.limit});
  //List<Pokemon> pokemons;
  //int start;
  //int limit;
  String generation;
  @override
  List<Object> get props => [generation];
}

// ignore: must_be_immutable
class AllGenerationEvent extends GenerationEvent {
  const AllGenerationEvent();

  @override
  List<Object> get props => [];
}
