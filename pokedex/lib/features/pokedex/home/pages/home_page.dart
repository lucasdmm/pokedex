import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/details/container/detail_container.dart';

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
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(list[index].name),
              onTap: () => onPokeTap(
                '/details',
                DetailArguments(name: list[index].name),
              ),
            );
          }),
    );
  }
}
