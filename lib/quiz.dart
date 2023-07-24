import 'package:basic_quiz_app/datas/questions.dart';
import 'package:basic_quiz_app/questions_screen.dart';
import 'package:basic_quiz_app/results_screen.dart';
import 'package:basic_quiz_app/start_screen.dart';
import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.topRight;
const colors = [Colors.blueAccent, Colors.lightBlue];

// manage state
class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> _selectedAnswer = [];
  var activeScreen = 'start-screen';
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswer.add(answer);

    if (_selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
        // _selectedAnswer.clear();
      });
    }
  }

  // jika pakai initstate
  // Widget? activeScreen;
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }]
  // void switchScreen() {
  //   setState(() {
  //     activeScreen = const QuestionsScreen();
  //   });
  // }
  void restartQuiz() {
    setState(() {
      activeScreen = 'questions-screen';
      _selectedAnswer.clear();
    });
  }

  void backToHome() {
    setState(() {
      activeScreen = 'start-screen';
      _selectedAnswer.clear();
    });
  }

  @override
  Widget build(context) {
    // final screenWidget = activeScreen == 'start-screen'
    //     ? StartScreen(switchScreen)
    //     : const QuestionsScreen();
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    } else if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswer,
        onRestart: restartQuiz,
        onBack: backToHome,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: colors, begin: startAlignment, end: endAlignment),
          ),
          child: screenWidget,
          // child: screenWidget,
        ),
      ),
    );
  }
}
