import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/home/container/poke_container.dart';
import 'package:pokedex/shared/repo/pokemon_repository.dart';

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
    return Stack(children: [
      Container(
        color: Colors.white,
      ),
      Positioned(
        top: 30,
        left: 130,
        child: Image.asset(
          'images/pokeball.png',
          scale: 3.5,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Pokedex',
            style: TextStyle(color: Colors.black, fontSize: 26),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListWheelScrollView(
            itemExtent: 100,
            diameterRatio: 1.5,
            offAxisFraction: 0.3,
            children: list
                .map((pkm) => PokeContainer(
                    repo: PokemonRepository(dio: Dio()),
                    pokemon: pkm,
                    onPokeTap: onPokeTap))
                .toList(),
          ),
        ),
      ),
    ]);
  }
}
