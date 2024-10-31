class QuestionResult {
  final int index;
  final String title;
  final bool isCorrect;
  final String correctAnswer;
  final String chosenAnswer;

  const QuestionResult(
      {required this.index,
      required this.title,
      required this.isCorrect,
      required this.correctAnswer,
      required this.chosenAnswer});
}
