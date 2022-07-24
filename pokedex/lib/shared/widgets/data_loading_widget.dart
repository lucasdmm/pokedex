import 'package:flutter/material.dart';

class DataLoading extends StatefulWidget {
  const DataLoading({Key? key}) : super(key: key);

  @override
  State<DataLoading> createState() => _DataLoadingState();
}

class _DataLoadingState extends State<DataLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<Color?> one;
  late Animation<Color?> two;
  @override
  void initState() {
    super.initState();
    _ctrl =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    one = ColorTween(begin: Colors.grey, end: Colors.grey.shade100)
        .animate(_ctrl);
    two = ColorTween(begin: Colors.grey.shade100, end: Colors.grey)
        .animate(_ctrl);
  }

  @override
  void dispose() {
    super.dispose();
    _ctrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 10),
        foregroundDecoration: BoxDecoration(
            // color: ColorType.getColorType(pokemon.type[0]).withOpacity(.2),
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
        child: ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(colors: [one.value!, two.value!])
                .createShader(rect);
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
          ),
        ));
  }
}
