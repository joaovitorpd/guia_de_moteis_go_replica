import 'package:equatable/equatable.dart';
import 'package:guia_de_moteis_go_replica/core/errors/exceptions.dart';

class Failure extends Equatable {
  const Failure({required this.message, required this.statusCode});

  final String? message;
  final int statusCode;

  String get errorMessage => '$statusCode Error: $message';

  @override
  List<Object?> get props => [message, statusCode];
}

class APIFailure extends Failure {
  const APIFailure({required super.message, required super.statusCode});

  APIFailure.formatException(ApiException exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}
