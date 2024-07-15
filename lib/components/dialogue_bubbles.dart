import 'package:flutter/material.dart';
import 'package:simple_chatbot/components/text_bubble.dart';

class DialogueBubbles extends StatelessWidget {
  const DialogueBubbles(
      {super.key, required this.question, required this.answer});

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextBubble(
            message: question,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextBubble(
            message: answer,
          ),
        ),
      ],
    );
  }
}
