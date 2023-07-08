import 'package:basic_quiz_app/questions_screen.dart';
import 'package:basic_quiz_app/start_screen.dart';
import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.topRight;
const colors = [Colors.blueAccent, Colors.lightBlue];

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget activeScreen = const StartScreen();
  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: colors, begin: startAlignment, end: endAlignment),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
