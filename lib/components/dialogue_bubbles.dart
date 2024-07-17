import 'package:flutter/material.dart';
import 'package:simple_chatbot/components/answer_bubble.dart';
import 'package:simple_chatbot/components/question_bubble.dart';

class DialogueBubbles extends StatelessWidget {
  const DialogueBubbles(
      {super.key,
      required this.question,
      required this.answer,
      required this.visibility});

  final String question;
  final String answer;
  final bool visibility;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: QuestionBubble(
              message: question,
              visibility: visibility,
            ),
          ),
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.centerLeft,
            child: AnswerBubble(
              message: answer,
            ),
          ),
        ],
      ),
    );
  }
}
