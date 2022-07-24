import 'package:flutter/material.dart';

class PokeErrorWidget extends StatelessWidget {
  const PokeErrorWidget({Key? key, this.errorMessage}) : super(key: key);
  final String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(errorMessage ?? 'Erro durante a operação')),
    );
  }
}
