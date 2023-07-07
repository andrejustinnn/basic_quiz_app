import 'package:basic_quiz_app/styled_text.dart';
import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.topRight;

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.colors});

  const StartScreen.light({super.key})
      : colors = const [Colors.blueAccent, Colors.lightBlue];

  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: colors, begin: startAlignment, end: endAlignment),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 200,
            ),
            const SizedBox(
              height: 40,
            ),
            const StyledText('Let\'s learn flutter!'),
            const SizedBox(
              height: 18,
            ),
            OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  // padding: const EdgeInsets.only(), // all padding 3 disemua sisi
                  // padding: const EdgeInsets.only(
                  //     top: 20), // all padding 3 disemua sisi
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  textStyle: const TextStyle(fontSize: 18),
                  side: const BorderSide(
                    color: Colors.white,
                    style: BorderStyle.solid,
                  ),
                ),
                child: const Text('Start Quiz'))
          ],
        ),
      ),
    );
  }
}
