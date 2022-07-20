import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/home/pages/widgets/poke_type_widget.dart';
import 'package:pokedex/shared/theme/color_type.dart';
import 'package:pokedex/shared/theme/poke_style.dart';

import '../../../../../shared/models/pokemon.dart';

class PokemonWidget extends StatelessWidget {
  const PokemonWidget({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: ColorType.getColorType(pokemon.type[0]).withOpacity(.2),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
                blurRadius: 3, blurStyle: BlurStyle.outer, offset: Offset(2, 2))
          ]),
      child: Column(
        children: [
          Text(
            pokemon.name,
            style: const TextStyle(
                color: Colors.black45,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: pokemon.type
                      .map((e) => PokeTypeWidget(typeName: e))
                      .toList(),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(147, 255, 255, 255),
                      radius: 50,
                      child: Image.network(
                        pokemon.img,
                        scale: 1.5,
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
