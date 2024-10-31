class Question {
  final String title;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final int correctAnswer;

  const Question(
      {this.title = "",
      this.option1 = "",
      this.option2 = "",
      this.option3 = "",
      this.option4 = "",
      this.correctAnswer = 1});

  String answerText(int index) {
    switch (index) {
      case 1:
        return option1;
      case 2:
        return option2;
      case 3:
        return option3;
      default:
        return option4;
    }
  }
}
