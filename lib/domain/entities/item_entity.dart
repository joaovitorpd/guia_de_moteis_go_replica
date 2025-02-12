import 'package:equatable/equatable.dart';

class ItemEntity extends Equatable {
  const ItemEntity({required this.nome});

  final String nome;

  @override
  List<Object?> get props => [nome];
}
