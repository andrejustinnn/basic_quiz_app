class QuizQuestion {
  const QuizQuestion(this.question, this.answers);
  final String question;
  final List<String> answers;
  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers); // clone
    shuffledList
        .shuffle(); // alasan kenapa listnya di clone agar corenya ga teracak
    return shuffledList;
  }
}
