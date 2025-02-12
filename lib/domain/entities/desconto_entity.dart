import 'package:equatable/equatable.dart';

class DescontoEntity extends Equatable {
  const DescontoEntity({required this.desconto});

  final double desconto;

  @override
  List<Object?> get props => [desconto];
}
