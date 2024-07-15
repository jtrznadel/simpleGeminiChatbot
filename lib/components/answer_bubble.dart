import 'package:flutter/material.dart';

class AnswerBubble extends StatelessWidget {
  const AnswerBubble({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ).copyWith(
          bottomLeft: const Radius.circular(0),
        ),
      ),
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
