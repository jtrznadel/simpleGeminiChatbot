import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_chatbot/core/constants/colors.dart';
import 'package:simple_chatbot/features/chatbot/domain/entities/dialogue.dart';
import 'package:simple_chatbot/features/chatbot/presentation/cubit/chatbot_cubit.dart';
import 'package:simple_chatbot/features/chatbot/presentation/widgets/answer_bubble.dart';
import 'package:simple_chatbot/features/chatbot/presentation/widgets/question_bubble.dart';
import 'package:simple_chatbot/core/extensions/context_extensions.dart';
import 'package:jumping_dot/jumping_dot.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final List<Dialogue> dialogues = [
    const Dialogue(
      question: "",
      answer: "Hello, I am a chatbot. How can I help you?",
    ),
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatbotCubit, ChatbotState>(
      listener: (context, state) {
        if (state is ResponseError) {
          print("Error: ${state.message}");
        }
        if (state is GotResponse) {
          setState(() {
            dialogues[dialogues.length - 1] =
                dialogues[dialogues.length - 1].copyWith(
              answer: state.response,
              isLoading: false,
            );
            _scrollToBottom();
          });
        }
      },
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.all(15),
                itemCount: dialogues.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        if (dialogues[index].question.isNotEmpty) ...[
                          Align(
                            alignment: Alignment.centerRight,
                            child: QuestionBubble(
                              message: dialogues[index].question,
                              visibility: true,
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AnswerBubble(
                            widget: dialogues[index].isLoading
                                ? SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    height: 40,
                                    child: JumpingDots(
                                      radius: 6,
                                      numberOfDots: 3,
                                      color: AppColors.primaryColor,
                                    ),
                                  )
                                : AnimatedTextKit(
                                    animatedTexts: [
                                      TypewriterAnimatedText(
                                        dialogues[index].answer,
                                        textStyle: const TextStyle(
                                          color: AppColors.lightBgColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                    repeatForever: false,
                                    totalRepeatCount: 1,
                                    onFinished: () => _scrollToBottom,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              width: context.width,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: "Type a message...",
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      setState(() {
                        dialogues.add(
                          Dialogue(
                            question: controller.text.trim(),
                            answer: "",
                            isLoading: true,
                          ),
                        );
                      });

                      context.read<ChatbotCubit>().getChatbotResponse(
                            controller.text.trim(),
                          );
                      controller.clear();
                    },
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
