import 'package:guia_de_moteis_go_replica/core/utils/typedef.dart';
import 'package:guia_de_moteis_go_replica/data/models/categoria_item_model.dart';
import 'package:guia_de_moteis_go_replica/data/models/item_model.dart';
import 'package:guia_de_moteis_go_replica/data/models/periodo_model.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/suite_entity.dart';

class SuiteModel extends SuiteEntity {
  const SuiteModel({
    required super.nome,
    required super.qtd,
    required super.exibirQtdDisponiveis,
    required super.fotos,
    required super.itens,
    required super.categoriaItens,
    required super.periodos,
  });

  factory SuiteModel.fromJson(DataMap json) {
    return SuiteModel(
      nome: json['nome'] as String? ?? '',
      qtd: json['qtd'] as int? ?? 0,
      exibirQtdDisponiveis: json['exibirQtdDisponiveis'] as bool? ?? false,
      fotos: (json['fotos'] as List<dynamic>?)?.cast<String>() ?? [],
      itens: (json['itens'] as List<dynamic>?)
              ?.map((item) => ItemModel.fromJson(item as DataMap))
              .toList() ??
          [],
      categoriaItens: (json['categoriaItens'] as List<dynamic>?)
              ?.map((categoria) =>
                  CategoriaItemModel.fromJson(categoria as DataMap))
              .toList() ??
          [],
      periodos: (json['periodos'] as List<dynamic>?)
              ?.map((periodo) => PeriodoModel.fromJson(periodo as DataMap))
              .toList() ??
          [],
    );
  }
}
