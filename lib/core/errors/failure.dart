import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure({required this.message, this.statusCode});
  final String message;
  final dynamic statusCode;

  String get errorMessage => '$statusCode: $message';

  @override
  List<Object?> get props => [message, statusCode];
}
