import 'package:flutter/material.dart';
import 'package:simple_chatbot/constants/colors.dart';

class QuestionBubble extends StatelessWidget {
  const QuestionBubble(
      {super.key, required this.message, this.visibility = true});
  final bool visibility;

  final String message;

  @override
  Widget build(BuildContext context) {
    if (!visibility) {
      return const SizedBox();
    }
    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ).copyWith(
          bottomRight: const Radius.circular(0),
        ),
      ),
      child: Text(
        message,
        style: const TextStyle(
          color: AppColors.darkBgColor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
