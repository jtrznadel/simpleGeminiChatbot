import 'package:flutter/material.dart';
import 'package:simple_chatbot/constants/colors.dart';

class QuestionBubble extends StatelessWidget {
  const QuestionBubble({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.questionBubbleBgColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ).copyWith(
          bottomRight: const Radius.circular(0),
        ),
      ),
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
