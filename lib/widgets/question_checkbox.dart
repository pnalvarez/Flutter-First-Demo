import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum QuestionCheckboxContext {
  notSelected,
  selected,
  correct,
  wrong;

  Color get color {
    switch (this) {
      case QuestionCheckboxContext.notSelected:
        return const Color.fromARGB(255, 21, 1, 63);
      case QuestionCheckboxContext.selected:
        return const Color.fromARGB(255, 214, 194, 17);
      case QuestionCheckboxContext.correct:
        return const Color.fromARGB(218, 6, 220, 13);
      case QuestionCheckboxContext.wrong:
        return const Color.fromARGB(218, 237, 8, 0);
    }
  }
}

class QuestionCheckbox extends StatelessWidget {
  final String title;
  final QuestionCheckboxContext questionCheckboxContext;
  final VoidCallback? onPressed;

  const QuestionCheckbox(
      {super.key,
      required this.title,
      required this.questionCheckboxContext,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            backgroundColor: questionCheckboxContext.color,
          ),
          child: Text(
            title,
            style: GoogleFonts.lato(color: Colors.white, fontSize: 16),
          )),
    );
  }
}
