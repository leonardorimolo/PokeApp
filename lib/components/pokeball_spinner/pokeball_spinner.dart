import 'package:flutter/material.dart';

class PokeballSpinner extends StatefulWidget {
  final double width;
  final double height;
  const PokeballSpinner({super.key, required this.width, required this.height});

  @override
  _PokeballSpinnerState createState() => _PokeballSpinnerState();
}

class _PokeballSpinnerState extends State<PokeballSpinner> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
      child: Image.asset('assets/images/pokeball_splash.png', width: widget.width, height: widget.height),
    );
  }
}
