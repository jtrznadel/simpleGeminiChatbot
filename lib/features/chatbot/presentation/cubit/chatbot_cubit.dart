import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_chatbot/features/chatbot/domain/entities/dialogue.dart';
import 'package:simple_chatbot/features/chatbot/domain/usecases/get_chatbot_response.dart';

part 'chatbot_state.dart';

class ChatbotCubit extends Cubit<ChatbotState> {
  ChatbotCubit({
    required GetChatbotResposeUseCase getChatbotResposeUseCase,
  })  : _getChatbotResposeUseCase = getChatbotResposeUseCase,
        super(ChatbotInitial());

  final GetChatbotResposeUseCase _getChatbotResposeUseCase;

  Future<void> getChatbotResponse(String message) async {
    emit(GettingResponse());
    final result = await _getChatbotResposeUseCase.call(message);
    result.fold((failure) => emit(ResponseError(message: failure.message)),
        (result) => emit(GotResponse(response: result)));
  }
}
