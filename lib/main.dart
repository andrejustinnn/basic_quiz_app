import 'package:basic_quiz_app/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: StartScreen.light(),
      ),
    ),
  );
}
