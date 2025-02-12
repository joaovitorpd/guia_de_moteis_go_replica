import 'package:equatable/equatable.dart';

class CategoriaItemEntity extends Equatable {
  const CategoriaItemEntity({
    required this.nome,
    required this.icone,
  });

  final String nome;
  final String icone;

  @override
  List<Object?> get props => [nome, icone];
}
