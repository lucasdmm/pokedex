import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/details/pages/widgets/detail_bar.dart';
import 'package:pokedex/features/pokedex/details/pages/widgets/detail_decoration_list.dart';
import 'package:pokedex/shared/theme/color_type.dart';
import 'package:pokedex/shared/util/util_method.dart';
import 'package:pokedex/shared/widgets/pokeball_rotate_widget.dart';

import '../../../../shared/models/pokemon.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.pokemon,
    required this.detail,
  }) : super(key: key);
  final Pokemon pokemon;
  final PokeDetailData detail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailBar(
        detail: detail,
        pokemon: pokemon,
        width: MediaQuery.of(context).size.width,
        backgroundColor: ColorType.getColorType(detail.types[0]),
      ),
      body: Container(
        color: ColorType.getColorType(detail.types[0]).withAlpha(100),
        child: Column(children: [
          Stack(children: [
            Material(
              color: Colors.white,
              elevation: 8,
              child: Container(
                height: 200,
                margin:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                decoration: BoxDecoration(
                  color:
                      ColorType.getColorType(detail.types[0]).withOpacity(.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Stack(children: [
                  PokeballRotateWidget(
                    miliseconds: 1500,
                    child: Image.asset(
                      'images/pokeball.png',
                      color: Colors.black45,
                    ),
                  ),
                  Image.network(
                    detail.frontImg,
                    scale: .01,
                  ),
                ])),
              ),
            ),
            ...DetailDecorationList.list
          ]),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Types:',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        ...detail.types
                            .map(
                              (e) => Container(
                                color: ColorType.getColorType(e),
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  UtilMethod.upCaseFirstLetter(text: e),
                                  style: const TextStyle(
                                      color: Colors.black45,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                            .toList()
                            .cast<Widget>()
                      ],
                    )
                  ],
                ),
                const Text('Moves:',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 5,
                          color: ColorType.getColorType(detail.types[0]))),
                  margin: const EdgeInsets.only(top: 10),
                  height: 150,
                  child: GridView.count(
                    childAspectRatio: 2,
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    children: [
                      ...detail.moves
                          .map((e) => Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: ColorType.getColorType(
                                            detail.types[0])),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                      color: Colors.black45,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))
                          .toList()
                          .cast<Widget>()
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Weight:',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${detail.weight}lb',
                      style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Height:',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${detail.height}cm',
                      style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
