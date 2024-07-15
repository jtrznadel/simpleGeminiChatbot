import 'package:flutter/material.dart';
import 'package:simple_chatbot/components/dialogue_bubbles.dart';
import 'package:simple_chatbot/gemini_model.dart';
import 'package:simple_chatbot/models/dialogue_model.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final GeminiModel model = GeminiModel();
    final List<DialogueModel> dialogues = [
      const DialogueModel(
        question: "What is the capital of France?",
        answer: "Paris",
      ),
      const DialogueModel(
        question: "What is the capital of Germany?",
        answer: "Berlin",
      ),
      const DialogueModel(
        question: "What is the capital of Italy?",
        answer: "Rome",
      ),
    ];

    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('test'),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: dialogues.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  DialogueBubbles(
                    question: dialogues[index].question,
                    answer: dialogues[index].answer,
                  ),
                ],
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          width: size.width,
          height: size.height * 0.2,
          child: Row(
            children: [
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                  hintText: "Type a message",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              )),
              IconButton(
                  onPressed: () async {
                    await model.process("What is the capital of France?");
                  },
                  icon: const Icon(Icons.send)),
            ],
          ),
        ),
      ],
    );
  }
}
