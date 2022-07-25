part of 'filter_bloc.dart';

abstract class FilterState extends Equatable {
  const FilterState({required this.pokemons});
  final List<Pokemon> pokemons;
  @override
  List<Object?> get props => [pokemons];
}

class FilterInitialState extends FilterState {
  FilterInitialState() : super(pokemons: []);
}

class FilterSuccessState extends FilterState {
  const FilterSuccessState({required List<Pokemon> list})
      : super(pokemons: list);
}
