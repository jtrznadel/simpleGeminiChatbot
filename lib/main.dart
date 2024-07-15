import 'package:flutter/material.dart';
import 'package:simple_chatbot/constants/colors.dart';
import 'package:simple_chatbot/views/chat_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Simple Chatbot',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Simple chat bot'),
            shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            backgroundColor: AppColors.primaryColor,
          ),
          backgroundColor: AppColors.bgColor,
          body: const ChatView(),
        ));
  }
}
