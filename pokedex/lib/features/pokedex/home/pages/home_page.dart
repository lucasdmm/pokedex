import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/home/container/poke_container.dart';
import 'package:pokedex/features/pokedex/home/pages/widgets/home_app_bar_widget.dart';
import 'package:pokedex/shared/repo/pokemon_repository.dart';
import 'package:pokedex/shared/widgets/pokeball_rotate_widget.dart';

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
        left: 15,
        child: PokeballRotateWidget(
          child: Image.asset(
            'images/pkbc.png',
            scale: 2.5,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const HomeAppBarWidget(),
        body: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 35),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: list
                  .map((pk) => PokeContainer(
                      repo: PokemonRepository(dio: Dio()),
                      pokemon: pk,
                      onPokeTap: onPokeTap))
                  .toList(),
            )),
      ),
    ]);
  }
}
