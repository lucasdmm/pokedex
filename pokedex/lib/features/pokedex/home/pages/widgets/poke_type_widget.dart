import 'package:flutter/cupertino.dart';
import 'package:pokedex/shared/theme/color_type.dart';
import 'package:pokedex/shared/theme/poke_style.dart';
import 'package:pokedex/shared/util/util_method.dart';

class PokeTypeWidget extends StatelessWidget {
  const PokeTypeWidget({Key? key, required this.typeName}) : super(key: key);
  final String typeName;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
          color: ColorType.getColorType(typeName),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              UtilMethod.upCaseFirstLetter(text: typeName),
              style: PokeStyle.pokeName,
            ),
          ],
        ));
  }
}
