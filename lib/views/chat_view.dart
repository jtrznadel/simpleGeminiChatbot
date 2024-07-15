import 'package:flutter/material.dart';
import 'package:simple_chatbot/components/dialogue_bubbles.dart';
import 'package:simple_chatbot/extensions/context_extensions.dart';
import 'package:simple_chatbot/models/gemini_model.dart';
import 'package:simple_chatbot/models/dialogue_model.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final GeminiModel model = GeminiModel();
  final TextEditingController controller = TextEditingController();
  final List<DialogueModel> dialogues = [
    const DialogueModel(
      question: "",
      answer: "Hello, I am a chatbot. How can I help you?",
    ),
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('test'),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(15),
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
          width: context.width,
          height: context.height * 0.2,
          child: Row(
            children: [
              Expanded(
                  child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Type a message",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              )),
              IconButton(
                  onPressed: () async {
                    String result = await model.process(controller.text.trim());
                    dialogues.add(DialogueModel(
                      question: controller.text,
                      answer: result,
                    ));
                    print(dialogues.first.answer);
                    print(dialogues.first.question);
                    setState(() {});
                  },
                  icon: const Icon(Icons.send)),
            ],
          ),
        ),
      ],
    );
  }
}
