import 'package:simple_chatbot/core/errors/failure.dart';
import 'package:simple_chatbot/features/chatbot/domain/repositories/chatbot_repository.dart';
import 'package:dartz/dartz.dart';

class GetChatbotResposeUseCase {
  final ChatbotRepository _repo;

  GetChatbotResposeUseCase(this._repo);

  Future<Either<Failure, String>> call(String message) =>
      _repo.getChatbotResponse(message: message);
}
