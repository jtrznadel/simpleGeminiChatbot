part of 'chatbot_cubit.dart';

sealed class ChatbotState extends Equatable {
  const ChatbotState();

  @override
  List<Object> get props => [];
}

final class ChatbotInitial extends ChatbotState {}

final class GettingResponse extends ChatbotState {}

final class GotResponse extends ChatbotState {
  final String response;

  const GotResponse({required this.response});

  @override
  List<Object> get props => [response];
}

final class ResponseError extends ChatbotState {
  final String message;

  const ResponseError({required this.message});

  @override
  List<Object> get props => [message];
}
