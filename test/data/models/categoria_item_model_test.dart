import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_go_replica/core/utils/typedef.dart';
import 'package:guia_de_moteis_go_replica/data/models/categoria_item_model.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/categoria_item_entity.dart';

void main() {
  group('CategoriaItemModel', () {
    test('deve criar uma instância de CategoriaItemModel a partir de JSON', () {
      final json = {
        'nome': 'Categoria Teste',
        'icone': 'icone_teste',
      };

      final model = CategoriaItemModel.fromJson(json);

      expect(model.nome, 'Categoria Teste');
      expect(model.icone, 'icone_teste');
    });

    test('deve retornar valores padrão quando JSON está vazio', () {
      final json = DataMap();

      final model = CategoriaItemModel.fromJson(json);

      expect(model.nome, '');
      expect(model.icone, '');
    });

    test('deve ser uma subclasse de CategoriaItemEntity', () {
      final model = CategoriaItemModel(
        nome: 'Categoria Teste',
        icone: 'icone_teste',
      );

      expect(model, isA<CategoriaItemEntity>());
    });
  });
}
