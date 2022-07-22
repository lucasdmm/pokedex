import 'package:flutter/material.dart';
import 'package:pokedex/shared/models/pokemon.dart';

class DetailBar extends StatelessWidget implements PreferredSize {
  const DetailBar({Key? key, required this.pokemon, required this.width})
      : super(key: key);
  final double width;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
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
        pokemon.name,
        style: const TextStyle(color: Colors.black, fontSize: 26),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Center(
            child: Text("numero",
                style: TextStyle(color: Colors.black, fontSize: 20)),
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
