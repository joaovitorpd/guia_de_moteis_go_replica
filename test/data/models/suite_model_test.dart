import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:guia_de_moteis_go_replica/data/models/suite_model.dart';
import 'package:guia_de_moteis_go_replica/data/models/item_model.dart';
import 'package:guia_de_moteis_go_replica/data/models/categoria_item_model.dart';
import 'package:guia_de_moteis_go_replica/data/models/periodo_model.dart';

class MockItemModel extends Mock implements ItemModel {}

class MockCategoriaItemModel extends Mock implements CategoriaItemModel {}

class MockPeriodoModel extends Mock implements PeriodoModel {}

void main() {
  group('SuiteModel', () {
    test('deve retornar um modelo válido a partir do JSON', () {
      final json = {
        'nome': 'Suite Luxo',
        'qtd': 5,
        'exibirQtdDisponiveis': true,
        'fotos': ['foto1.jpg', 'foto2.jpg'],
        'itens': [
          {'id': 1, 'nome': 'Item 1'},
          {'id': 2, 'nome': 'Item 2'}
        ],
        'categoriaItens': [
          {'id': 1, 'nome': 'Categoria 1'},
          {'id': 2, 'nome': 'Categoria 2'}
        ],
        'periodos': [
          {'id': 1, 'nome': 'Periodo 1'},
          {'id': 2, 'nome': 'Periodo 2'}
        ],
      };

      final model = SuiteModel.fromJson(json);

      expect(model.nome, 'Suite Luxo');
      expect(model.qtd, 5);
      expect(model.exibirQtdDisponiveis, true);
      expect(model.fotos, ['foto1.jpg', 'foto2.jpg']);
      expect(model.itens.length, 2);
      expect(model.categoriaItens.length, 2);
      expect(model.periodos.length, 2);
    });

    test('deve lidar com valores nulos no JSON', () {
      final json = {
        'nome': null,
        'qtd': null,
        'exibirQtdDisponiveis': null,
        'fotos': null,
        'itens': null,
        'categoriaItens': null,
        'periodos': null,
      };

      final model = SuiteModel.fromJson(json);

      expect(model.nome, '');
      expect(model.qtd, 0);
      expect(model.exibirQtdDisponiveis, false);
      expect(model.fotos, []);
      expect(model.itens, []);
      expect(model.categoriaItens, []);
      expect(model.periodos, []);
    });
  });
}
