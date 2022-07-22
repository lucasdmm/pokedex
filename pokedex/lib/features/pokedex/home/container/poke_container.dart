import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/home/pages/widgets/pokemon_widget.dart';
import 'package:pokedex/shared/widgets/data_loading_widget.dart';

import '../../../../shared/errors/failiure.dart';
import '../../../../shared/models/pokemon.dart';
import '../../../../shared/repo/pokemon_repository.dart';
import '../../../../shared/widgets/poke_data_error_widget.dart';
import '../../details/container/detail_container.dart';

class PokeContainer extends StatelessWidget {
  const PokeContainer(
      {Key? key,
      required this.repo,
      required this.pokemon,
      required this.onPokeTap})
      : super(key: key);
  final Pokemon pokemon;
  final IPokemonRepository repo;
  final Function(String, DetailArguments) onPokeTap;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: repo.getDetail(pokeName: pokemon.name),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const DataLoading();
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return PokemonWidget(
              pokemon: pokemon,
              onPokeTap: onPokeTap,
              detail: snapshot.data as PokeDetailData,
            );
          }
          if (snapshot.hasError) {
            return PokeDataErrorWidget(
              errorMessage: (snapshot.error as Failiure).message!,
            );
          }
          return Container();
        });
  }
}
