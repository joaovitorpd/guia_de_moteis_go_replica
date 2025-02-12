part of 'motel_cubit.dart';

abstract class MotelState {}

class MotelInitial extends MotelState {}

class MotelLoading extends MotelState {}

class MotelLoaded extends MotelState {
  final List<MotelEntity> moteis;

  MotelLoaded(this.moteis);
}

class MotelError extends MotelState {
  final String message;

  MotelError(this.message);
}
