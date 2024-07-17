import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:simple_chatbot/secrets.dart';

class GeminiModel {
  var model;

  GeminiModel() {
    model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: Secrets.geminiApiKey,
    );
  }

  Future<String> process(String prompt) async {
    final content = [Content.text(prompt)];
    final response = await model!.generateContent(content);
    return response.text;
  }
}
