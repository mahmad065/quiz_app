import 'package:flutter/material.dart';

import 'package:quiz_app/question_summary/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void changeScreen() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget widgetScreen = StartScreen(changeScreen);

    if (activeScreen == 'question-screen') {
      widgetScreen = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      widgetScreen = ResultScreen(
        chooseAnswer: selectedAnswer,
        restartQuiz: changeScreen,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: widgetScreen,
        ),
      ),
    );
  }
}
