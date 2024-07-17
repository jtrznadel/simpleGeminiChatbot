import 'package:dartz/dartz.dart';
import 'package:simple_chatbot/core/errors/failure.dart';

abstract class ChatbotRepository {
  Future<Either<Failure, String>> getChatbotResponse({required String message});
}
