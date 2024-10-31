import 'package:flutter/material.dart';

class DefaultGradient extends StatelessWidget {
  final Widget? child;

  const DefaultGradient({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.deepPurple, Colors.purple]),
      ),
      child: child,
    );
  }
}
