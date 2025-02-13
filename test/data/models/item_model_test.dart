import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_go_replica/data/models/item_model.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/item_entity.dart';

void main() {
  group('ItemModel', () {
    test('deve ser uma subclasse de ItemEntity', () {
      const itemModel = ItemModel(nome: 'Test Item');
      expect(itemModel, isA<ItemEntity>());
    });

    test('fromJson deve retornar um modelo válido', () {
      final Map<String, dynamic> jsonMap = {'nome': 'Test Item'};
      final result = ItemModel.fromJson(jsonMap);
      expect(result, isA<ItemModel>());
      expect(result.nome, 'Test Item');
    });

    test('fromJson deve lidar com valores nulos', () {
      final Map<String, dynamic> jsonMap = {'nome': null};
      final result = ItemModel.fromJson(jsonMap);
      expect(result, isA<ItemModel>());
      expect(result.nome, '');
    });
  });
}
