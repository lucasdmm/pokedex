import 'dart:math';

import 'package:flutter/material.dart';

class PokeballRotateWidget extends StatefulWidget {
  const PokeballRotateWidget(
      {Key? key, required this.child, this.hasToStop = true})
      : super(key: key);
  final Widget child;
  final bool hasToStop;

  @override
  State<PokeballRotateWidget> createState() => _PokeballRotateWidgetState();
}

class _PokeballRotateWidgetState extends State<PokeballRotateWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _ani;
  void setRotation(int degrees) {
    final angle = degrees * pi / 180;
    _ani = Tween<double>(begin: 0, end: angle).animate(_ctrl);
  }

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    setRotation(360);
    _ctrl.forward(from: 0);

    _ctrl.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        _ctrl.repeat(period: const Duration(milliseconds: 500));
      }
    });
    if (widget.hasToStop) {
      Future.delayed(const Duration(seconds: 12))
          .whenComplete(() => _ctrl.stop());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _ctrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ani,
      builder: (ctx, child) {
        return Transform.rotate(
          angle: _ani.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
