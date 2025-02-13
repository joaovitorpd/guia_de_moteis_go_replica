part of 'motel_cubit.dart';

abstract class MotelState extends Equatable {}

class MotelInitial extends MotelState {
  @override
  List<Object?> get props => [];
}

class MotelLoading extends MotelState {
  @override
  List<Object?> get props => [];
}

class MotelLoaded extends MotelState {
  final List<MotelEntity> moteis;

  MotelLoaded(this.moteis);

  @override
  List<Object?> get props => [moteis];
}

class MotelError extends MotelState {
  final String message;

  MotelError(this.message);

  @override
  List<Object?> get props => [message];
}
