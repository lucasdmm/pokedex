import 'package:flutter/material.dart';
import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/util/util_method.dart';

class DetailBar extends StatelessWidget implements PreferredSize {
  const DetailBar(
      {Key? key,
      required this.pokemon,
      required this.detail,
      required this.width,
      required this.backgroundColor})
      : super(key: key);
  final double width;
  final Pokemon pokemon;
  final PokeDetailData detail;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: InkWell(
          onTap: () => Navigator.maybePop(context),
          child: const Material(
            elevation: 8,
            shape: CircleBorder(),
            color: Colors.blue,
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      title: Text(
        UtilMethod.upCaseFirstLetter(text: pokemon.name),
        style: const TextStyle(color: Colors.black, fontSize: 26),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Center(
            child: Text("#${detail.num}",
                style: const TextStyle(color: Colors.black, fontSize: 20)),
          ),
        )
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size(width, 60);
}
