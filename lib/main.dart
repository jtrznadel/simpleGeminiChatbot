import 'package:flutter/material.dart';
import 'package:simple_chatbot/constants/colors.dart';
import 'package:simple_chatbot/gemini_model.dart';
import 'package:simple_chatbot/models/dialogue_model.dart';
import 'package:simple_chatbot/views/chat_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Simple chat bot'),
            backgroundColor: AppColors.primary,
          ),
          backgroundColor: AppColors.primary,
          body: const ChatView(),
        ));
  }
}
