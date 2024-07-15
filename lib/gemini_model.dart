import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiModel {
  final String apiKey = "AIzaSyDQrZ5GDIA1jHqVuhXcdzDnJBrnR_wvyDk";
  var model;

  GeminiModel() {
    model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: apiKey,
    );
  }

  Future<void> process(String prompt) async {
    final content = [Content.text(prompt)];
    final response = await model!.generateContent(content);
    print(response.text);
  }
}
