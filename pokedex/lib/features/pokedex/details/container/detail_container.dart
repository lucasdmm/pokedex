import 'package:flutter/material.dart';

import '../../../../shared/errors/failiure.dart';
import '../../../../shared/models/pokemon.dart';
import '../../../../shared/repo/pokemon_repository.dart';
import '../../../../shared/widgets/poke_error_widget.dart';
import '../../../../shared/widgets/poke_loading_widget.dart';
import '../pages/detail_page.dart';

class DetailArguments {
  DetailArguments({required this.pokemon, required this.detail});

  final Pokemon pokemon;
  final PokeDetailData detail;
}

class DetailContainer extends StatelessWidget {
  const DetailContainer({Key? key, required this.repo, required this.arguments})
      : super(key: key);

  final IPokemonRepository repo;
  final DetailArguments arguments;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repo.getAllPkm(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const PokeLoadingWidget();
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return DetailPage(
              pokemon: arguments.pokemon,
              detail: arguments.detail,
            );
          }

          if (snapshot.hasError) {
            return PokeErrorWidget(
              errorMessage: (snapshot.error as Failiure).message!,
            );
          }
          return Container();
        });
  }
}
