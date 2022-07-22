import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/details/pages/widgets/detail_bar.dart';
import 'package:pokedex/shared/theme/color_type.dart';

import '../../../../shared/models/pokemon.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.pokemon,
    required this.list,
    //  required this.detail,
  }) : super(key: key);
  final Pokemon pokemon;
  //final PokeDetailData detail;
  final List<Pokemon> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DetailBar(
          pokemon: pokemon,
          width: MediaQuery.of(context).size.width,
        ),
        body: Column(
          children: [
            Material(
              color: Colors.white,
              elevation: 8,
              child: Container(
                height: 200,
                margin:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                decoration: BoxDecoration(
                  //  color: ColorType.getColorType(detail.types[0]),
                  borderRadius: BorderRadius.circular(10),
                ),
                //  child: Center(child: Image.network(pokemon.img)),
              ),
            ),
          ],
        ));
  }
}
