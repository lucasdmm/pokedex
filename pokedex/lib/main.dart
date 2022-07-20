import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/route.dart';

import 'shared/repo/pokemon_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(primarySwatch: Colors.red),
      home: PokedexRoute(repo: PokemonRepository(dio: Dio())),
    );
  }
}
