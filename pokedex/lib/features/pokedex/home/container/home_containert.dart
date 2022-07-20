import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/details/container/detail_container.dart';
import 'package:pokedex/shared/errors/failiure.dart';

import '../../../../shared/models/pokemon.dart';
import '../../../../shared/repo/pokemon_repository.dart';
import '../../../../shared/widgets/poke_error.dart';
import '../../../../shared/widgets/poke_loading.dart';
import '../pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    super.key,
    required this.repo,
    required this.onPokeTap,
  });
  final IPokemonRepository repo;
  final Function(String, DetailArguments) onPokeTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repo.getAllPkm(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const PokeLoading();
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return HomePage(list: snapshot.data!, onPokeTap: onPokeTap);
          }

          if (snapshot.hasError) {
            return PokeError(
              errorMessage: (snapshot.error as Failiure).message!,
            );
          }
          return Container();
        });
  }
}
