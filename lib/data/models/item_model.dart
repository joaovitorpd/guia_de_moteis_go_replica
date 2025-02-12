import 'package:guia_de_moteis_go_replica/core/utils/typedef.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/item_entity.dart';

class ItemModel extends ItemEntity {
  const ItemModel({required super.nome});

  factory ItemModel.fromJson(DataMap json) {
    return ItemModel(nome: json['nome'] as String? ?? '');
  }
}
