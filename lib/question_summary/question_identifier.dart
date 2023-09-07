import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(this.data, {super.key});

  final Map<String, Object> data;

  @override
  Widget build(context) {
    var color = const Color.fromARGB(255, 29, 194, 244);

    if (data['correct_answer'] != data['user_answer']) {
      color = const Color.fromARGB(255, 244, 74, 247);
    }

    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          data['question_index'].toString(),
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 78, 13, 151),
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
