import 'package:flutter/material.dart';

class PokeDataErrorWidget extends StatelessWidget {
  const PokeDataErrorWidget({Key? key, required this.errorMessage})
      : super(key: key);
  final String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 10),
        foregroundDecoration: BoxDecoration(
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
        child: Center(child: Text(errorMessage ?? 'Erro durante a operação')));
  }
}
