import 'package:flutter/material.dart';

final wrong = Colors.red[300];
final correct = Colors.blue[100];

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summary, {super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNumberedText(
                  ((data['question_index'] as int) + 1).toString(),
                  data['user_answer'] == data['correct_answer'],
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['question'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                      const SizedBox(
                        height: 4,
                      ),
                      // (
                      (data['user_answer'] != data['correct_answer']) //if else
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text(data['user_answer'] as String,
                                      style: TextStyle(
                                        color: wrong,
                                      )),
                                  Text(data['correct_answer'] as String,
                                      style: TextStyle(
                                        color: correct,
                                      )),
                                ])
                          : Text(data['user_answer'] as String,
                              style: TextStyle(
                                color: correct,
                              )),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

Widget _buildNumberedText(String number, bool isCorrectAnswer) {
  return Container(
    width: 40,
    height: 40,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      // borderRadius: BorderRadius.circular(20),
      color: isCorrectAnswer ? correct : wrong,
    ),
    child: Text(
      number,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    ),
  );
}
