import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_chatbot/providers/theme_provider.dart';
import 'package:simple_chatbot/views/chat_view.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
            actions: [
              IconButton(
                icon: Icon(
                  themeProvider.isLightTheme
                      ? Icons.nightlight_round
                      : Icons.wb_sunny,
                  color:
                      themeProvider.isLightTheme ? Colors.black : Colors.white,
                ),
                onPressed: () {
                  themeProvider.toggleTheme();
                },
              ),
            ],
          ),
          extendBodyBehindAppBar: true,
          body: const ChatView(),
        ));
  }
}
