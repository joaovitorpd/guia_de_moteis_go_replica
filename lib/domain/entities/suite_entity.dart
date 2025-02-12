import 'package:equatable/equatable.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/categoria_item_entity.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/item_entity.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/periodo_entity.dart';

class SuiteEntity extends Equatable {
  const SuiteEntity({
    required this.nome,
    required this.qtd,
    required this.exibirQtdDisponiveis,
    required this.fotos,
    required this.itens,
    required this.categoriaItens,
    required this.periodos,
  });

  final String nome;
  final int qtd;
  final bool exibirQtdDisponiveis;
  final List<String> fotos;
  final List<ItemEntity> itens;
  final List<CategoriaItemEntity> categoriaItens;
  final List<PeriodoEntity> periodos;

  @override
  List<Object?> get props => [
        nome,
        qtd,
        exibirQtdDisponiveis,
        fotos,
        itens,
        categoriaItens,
        periodos,
      ];
}
