import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/question_dummy.dart';
import 'package:quiz_app/screens/question_screen.dart';
import 'package:quiz_app/widgets/default_gradient.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});
  @override
  State<StatefulWidget> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultGradient(
        child: Transform.translate(
          offset: const Offset(0, -20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: 0.6,
                child: Image.asset(
                  'assets/images/quiz-logo.png',
                  width: 300,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                "Learn Flutter in the fun way",
                style: GoogleFonts.lato(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(
                height: 40,
              ),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuestionScreen(
                                questions: questions,
                              )));
                },
                style: OutlinedButton.styleFrom(
                    iconColor: Colors.white, foregroundColor: Colors.white),
                label: const Text("Start quiz"),
                icon: const Icon(Icons.arrow_right_alt),
              )
            ],
          ),
        ),
      ),
    );
  }
}
