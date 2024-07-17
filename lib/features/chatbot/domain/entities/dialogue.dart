import 'package:equatable/equatable.dart';

class Dialogue extends Equatable {
  final String question;
  final String answer;
  final bool isLoading;

  const Dialogue({
    required this.question,
    required this.answer,
    this.isLoading = false,
  });

  Dialogue copyWith({
    String? question,
    String? answer,
    bool? visibility,
    bool? isLoading,
  }) {
    return Dialogue(
      question: question ?? this.question,
      answer: answer ?? this.answer,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [question, answer];
}
