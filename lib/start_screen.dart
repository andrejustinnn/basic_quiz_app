import 'package:basic_quiz_app/styled_text.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            color: const Color.fromARGB(200, 255, 255, 255),
          ),
          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 200,
          //   ),
          // ), bad performance
          const SizedBox(
            height: 40,
          ),
          const StyledText('Let\'s learn flutter!'),
          const SizedBox(
            height: 18,
          ),
          OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                // padding: const EdgeInsets.only(), // all padding 3 disemua sisi
                // padding: const EdgeInsets.only(
                //     top: 20), // all padding 3 disemua sisi
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 18),
                side: const BorderSide(
                  color: Colors.white,
                  style: BorderStyle.solid,
                ),
              ),
              icon: const Icon(Icons.arrow_right_alt_rounded),
              label: const Text('Start Quiz'))
        ],
      ),
    );
  }
}
