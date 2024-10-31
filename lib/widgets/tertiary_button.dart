import 'package:flutter/material.dart';

class TertiaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const TertiaryButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ));
  }
}
