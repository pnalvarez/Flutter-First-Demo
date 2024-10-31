import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/question_result.dart';
import 'package:quiz_app/widgets/default_gradient.dart';
import 'package:quiz_app/widgets/question_result_widget.dart';

class ResultsScreen extends StatelessWidget {
  final List<QuestionResult> results;

  const ResultsScreen({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultGradient(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You answered ${results.where((result) => result.isCorrect).length} correct answers out of ${results.length}",
                style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 480,
                child: ListView.separated(
                  itemCount: results.length,
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 32,
                  ),
                  itemBuilder: (context, index) {
                    return QuestionResultWidget(result: results[index]);
                  },
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextButton.icon(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  iconAlignment: IconAlignment.start,
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Retry quiz",
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
