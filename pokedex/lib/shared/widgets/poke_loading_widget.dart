import 'package:flutter/material.dart';

class PokeLoadingWidget extends StatelessWidget {
  const PokeLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
