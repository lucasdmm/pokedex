import 'package:flutter/material.dart';

import '../../../../shared/errors/failiure.dart';
import '../../../../shared/models/pokemon.dart';
import '../../../../shared/repo/pokemon_repository.dart';
import '../../../../shared/widgets/poke_error.dart';
import '../../../../shared/widgets/poke_loading.dart';
import '../pages/detail_page.dart';

class DetailArguments {
  DetailArguments({required this.name});

  final String name;
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
            return const PokeLoading();
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return DetailPage(
              name: arguments.name,
              list: snapshot.data!,
            );
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