import 'package:dartz/dartz.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:simple_chatbot/core/errors/failure.dart';
import 'package:simple_chatbot/features/chatbot/domain/repositories/chatbot_repository.dart';
import 'package:simple_chatbot/secrets.dart';

class ChatbotRepositoryImpl implements ChatbotRepository {
  var model;

  ChatbotRepositoryImpl() {
    model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: Secrets.geminiApiKey,
    );
  }

  @override
  Future<Either<Failure, String>> getChatbotResponse(
      {required String message}) async {
    try {
      final content = [Content.text(message)];
      final response = await model!.generateContent(content);
      return Right(response.text);
    } catch (e) {
      return const Left(Failure(
          statusCode: 400,
          message:
              'Sorry, I am not able to process your request at the moment.'));
    }
  }
}
