import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/home/pages/widgets/pokemon_widget.dart';

import '../../../../shared/models/pokemon.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.list,
    required this.onPokeTap,
  }) : super(key: key);
  final List<Pokemon> list;
  final Function(String, DetailArguments) onPokeTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        children: list.map((e) => PokemonWidget(pokemon: e)).toList(),
      ),
    );
  }
}
