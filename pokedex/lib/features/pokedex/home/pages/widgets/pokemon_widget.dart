import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/home/pages/widgets/poke_type_widget.dart';
import 'package:pokedex/shared/theme/color_type.dart';
import 'package:pokedex/shared/util/util_method.dart';

import '../../../../../shared/models/pokemon.dart';

class PokemonWidget extends StatelessWidget {
  const PokemonWidget(
      {Key? key,
      required this.pokemon,
      required this.onPokeTap,
      required this.detail})
      : super(key: key);
  final Pokemon pokemon;
  final PokeDetailData detail;
  final Function(String, DetailArguments) onPokeTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPokeTap('/details', DetailArguments(pokemon: pokemon)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 10),
        foregroundDecoration: BoxDecoration(
            color: ColorType.getColorType(
                    detail.types.isEmpty ? 'normal' : detail.types[0])
                .withOpacity(.2),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 3,
                  blurStyle: BlurStyle.outer,
                  offset: Offset(2, 2))
            ]),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      UtilMethod.upCaseFirstLetter(text: pokemon.name),
                      style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '#${detail.num}',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(.70),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: detail.types
                        .map((type) => PokeTypeWidget(typeName: type))
                        .toList(),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 60,
                      width: 90,
                      child: CachedNetworkImage(
                        imageUrl: detail.frontImg,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Image.asset('images/pkbc.png'),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
