import 'package:flutter/material.dart';

import '../../../../shared/models/pokemon.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.name, required this.list})
      : super(key: key);
  final String name;
  final List<Pokemon> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(name)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                SizedBox(
                  height: 400,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: list
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(e.name),
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
