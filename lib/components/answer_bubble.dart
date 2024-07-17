import 'package:flutter/material.dart';
import 'package:simple_chatbot/constants/colors.dart';

class AnswerBubble extends StatelessWidget {
  const AnswerBubble({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ).copyWith(
          bottomLeft: const Radius.circular(0),
        ),
      ),
      child: Text(
        message,
        style: const TextStyle(
          color: AppColors.lightBgColor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
