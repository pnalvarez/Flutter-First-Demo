import 'package:flutter/material.dart';
import 'package:quiz_app/screens/start_screen.dart';

void main() {
  runApp(MaterialApp(
    title: "Quiz app",
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const StartScreen(),
  ));
}
