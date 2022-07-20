import 'package:flutter/material.dart';

class PokeLoading extends StatelessWidget {
  const PokeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
