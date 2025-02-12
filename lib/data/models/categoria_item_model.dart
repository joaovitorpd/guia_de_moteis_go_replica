import 'package:guia_de_moteis_go_replica/core/utils/typedef.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/categoria_item_entity.dart';

class CategoriaItemModel extends CategoriaItemEntity {
  const CategoriaItemModel({
    required super.nome,
    required super.icone,
  });

  factory CategoriaItemModel.fromJson(DataMap json) {
    return CategoriaItemModel(
      nome: json['nome'] as String? ?? '',
      icone: json['icone'] as String? ?? '',
    );
  }
}
