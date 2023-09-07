import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/question_summary/question_identifier.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuestionIdentifier(data),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      bottom: 25,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'].toString(),
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['user_answer'].toString(),
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(150, 244, 74, 247),
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          data['correct_answer'].toString(),
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(150, 29, 194, 244),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
