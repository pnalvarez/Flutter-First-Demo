import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/data/question_result.dart';
import 'package:quiz_app/screens/results_screen.dart';
import 'package:quiz_app/widgets/default_gradient.dart';
import 'package:quiz_app/widgets/primary_button.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/widgets/question_checkbox.dart';
import 'package:quiz_app/widgets/tertiary_button.dart';
import 'package:google_fonts/google_fonts.dart';

const _spacing = SizedBox(
  height: 8,
);

class QuestionScreen extends StatefulWidget {
  final List<Question> questions;

  const QuestionScreen({super.key, required this.questions});

  @override
  State<StatefulWidget> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentIndex = 0;
  Question currentQuestion = const Question();
  int? selectedAnswer;
  bool didCheckAnswer = false;
  List<QuestionResult> results = [];

  @override
  void initState() {
    currentQuestion = widget.questions[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(60, 60),
        child: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text(
            "Question ${currentIndex + 1}/${widget.questions.length}",
            style: const TextStyle(color: Colors.white),
          ),
          flexibleSpace: const DefaultGradient(),
        ),
      ),
      body: DefaultGradient(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(currentQuestion.title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 40,
              ),
              QuestionCheckbox(
                  title: currentQuestion.option1,
                  questionCheckboxContext: _getCheckboxContext(1),
                  onPressed: () {
                    if (!didCheckAnswer) _selectOption(1);
                  }),
              _spacing,
              QuestionCheckbox(
                  title: currentQuestion.option2,
                  questionCheckboxContext: _getCheckboxContext(2),
                  onPressed: () {
                    if (!didCheckAnswer) _selectOption(2);
                  }),
              _spacing,
              QuestionCheckbox(
                  title: currentQuestion.option3,
                  questionCheckboxContext: _getCheckboxContext(3),
                  onPressed: () {
                    if (!didCheckAnswer) _selectOption(3);
                  }),
              _spacing,
              QuestionCheckbox(
                  title: currentQuestion.option4,
                  questionCheckboxContext: _getCheckboxContext(4),
                  onPressed: () {
                    if (!didCheckAnswer) _selectOption(4);
                  }),
              const SizedBox(
                height: 24,
              ),
              _buttonStack,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _buttonStack {
    return Stack(
      children: [
        Opacity(
          opacity: !didCheckAnswer && selectedAnswer != null ? 1.0 : 0.0,
          child: IgnorePointer(
            ignoring: didCheckAnswer || selectedAnswer == null,
            child: TertiaryButton(
              title: "Check answer",
              onPressed: () {
                setState(() {
                  didCheckAnswer = true;
                });
              },
            ),
          ),
        ),
        Opacity(
          opacity: didCheckAnswer ? 1.0 : 0.0,
          child: IgnorePointer(
            ignoring: !didCheckAnswer,
            child: PrimaryButton(
                title: "Continue",
                onPressed: () {
                  setState(() {
                    results.add(QuestionResult(
                        index: currentIndex + 1,
                        title: currentQuestion.title,
                        isCorrect:
                            currentQuestion.correctAnswer == selectedAnswer,
                        correctAnswer: currentQuestion
                            .answerText(currentQuestion.correctAnswer),
                        chosenAnswer:
                            currentQuestion.answerText(selectedAnswer ?? 0)));
                    if (currentIndex < widget.questions.length - 1) {
                      _showNext();
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ResultsScreen(results: results)));
                    }
                  });
                }),
          ),
        )
      ],
    );
  }

  void _selectOption(int index) {
    setState(() {
      selectedAnswer = index;
    });
  }

  void _showNext() {
    didCheckAnswer = false;
    currentIndex++;
    currentQuestion = widget.questions[currentIndex];
    selectedAnswer = null;
  }

  QuestionCheckboxContext _getCheckboxContext(int index) {
    if (didCheckAnswer) {
      if (index == currentQuestion.correctAnswer) {
        return QuestionCheckboxContext.correct;
      } else if (index == selectedAnswer) {
        return QuestionCheckboxContext.wrong;
      } else {
        return QuestionCheckboxContext.notSelected;
      }
    } else if (selectedAnswer == index) {
      return QuestionCheckboxContext.selected;
    } else {
      return QuestionCheckboxContext.notSelected;
    }
  }
}
