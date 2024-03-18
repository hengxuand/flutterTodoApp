import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    super.key,
    required this.color,
    this.child,
  });
  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9.0),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: color,
          width: 2,
        ),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
