import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/details/container/detail_container.dart';
import 'package:pokedex/shared/repo/pokemon_repository.dart';

import 'home/container/home_containert.dart';

class PokedexRoute extends StatelessWidget {
  const PokedexRoute({
    Key? key,
    required this.repo,
  }) : super(key: key);
  final PokemonRepository repo;
  @override
  Widget build(BuildContext context) {
    return Navigator(
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (context) {
                return HomeContainer(
                  repo: repo,
                  onPokeTap: (route, arguments) => Navigator.of(context)
                      .pushNamed(route, arguments: arguments),
                );
              });
            case '/details':
              return MaterialPageRoute(builder: (context) {
                return DetailContainer(
                  repo: repo,
                  arguments: settings.arguments as DetailArguments,
                );
              });
          }
          return null;
        });
  }
}
