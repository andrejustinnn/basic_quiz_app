import 'package:basic_quiz_app/datas/questions.dart';
import 'package:basic_quiz_app/questions_summary.dart';
import 'package:basic_quiz_app/styled_text.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestion = summary.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledText(
                'You answered $numCorrectQuestion out of $numTotalQuestions questions correctly!',
                align: TextAlign.center,
                size: 18),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summary),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
                onPressed: onRestart,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 18),
                  side: const BorderSide(
                    color: Colors.white,
                    style: BorderStyle.solid,
                  ),
                ),
                icon: const Icon(Icons.restart_alt_rounded),
                label: const Text('Restart Quiz'))
          ],
        ),
      ),
    );
  }
}
