import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:simple_chatbot/core/providers/theme_provider.dart';
import 'package:simple_chatbot/core/services/injection_container.dart';
import 'package:simple_chatbot/features/chatbot/presentation/cubit/chatbot_cubit.dart';
import 'package:simple_chatbot/features/chatbot/presentation/views/chat_view.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Builder(
        builder: (context) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'Simple Chatbot',
            theme: themeProvider.themeData,
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Simple chat bot',
                ),
                scrolledUnderElevation: 0,
                actions: [
                  IconButton(
                    icon: Icon(
                      themeProvider.isLightTheme
                          ? Icons.nightlight_round
                          : Icons.wb_sunny,
                      color: themeProvider.isLightTheme
                          ? Colors.black
                          : Colors.white,
                    ),
                    onPressed: () {
                      themeProvider.toggleTheme();
                    },
                  ),
                ],
              ),
              extendBodyBehindAppBar: true,
              body: BlocProvider(
                create: (context) => sl<ChatbotCubit>(),
                child: const ChatView(),
              ),
            ),
          );
        },
      ),
    );
  }
}
