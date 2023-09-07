import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chooseAnswer,
    required this.restartQuiz,
  });

  final List<String> chooseAnswer;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummarydata() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < questions.length; i++) {
      summary.add({
        'question_index': i + 1,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chooseAnswer[i]
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummarydata();
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You Answered $numCorrectQuestion out of $numTotalQuestion Questions Correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 244, 213, 255),
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: restartQuiz,
              icon: const Icon(
                CupertinoIcons.arrow_clockwise,
                size: 22,
              ),
              label: const Text(
                'Restart Quiz!',
              ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
