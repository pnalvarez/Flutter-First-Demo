import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/index_badge.dart';
import 'package:quiz_app/data/question_result.dart';

class QuestionResultWidget extends StatelessWidget {
  final QuestionResult result;

  const QuestionResultWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IndexBadge(
          index: result.index,
          uiContext: result.isCorrect
              ? IndexBadgeContext.correct
              : IndexBadgeContext.wrong,
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                result.title,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                result.correctAnswer,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 13, 224, 182),
                    fontSize: 16),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                result.chosenAnswer,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 232, 28, 181),
                    fontSize: 16),
              ),
            ],
          ),
        )
      ],
    );
  }
}
