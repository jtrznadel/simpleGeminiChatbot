import 'package:get_it/get_it.dart';
import 'package:simple_chatbot/features/chatbot/data/repositories/chatbot_repository_impl.dart';
import 'package:simple_chatbot/features/chatbot/domain/repositories/chatbot_repository.dart';
import 'package:simple_chatbot/features/chatbot/domain/usecases/get_chatbot_response.dart';
import 'package:simple_chatbot/features/chatbot/presentation/cubit/chatbot_cubit.dart';

final sl = GetIt.instance;

void init() {
  sl
    ..registerFactory(() => ChatbotCubit(getChatbotResposeUseCase: sl()))
    ..registerLazySingleton(() => GetChatbotResposeUseCase(sl()))
    ..registerLazySingleton<ChatbotRepository>(() => ChatbotRepositoryImpl());
}
