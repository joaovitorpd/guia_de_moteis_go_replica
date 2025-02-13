import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_go_replica/data/models/periodo_model.dart';
import 'package:guia_de_moteis_go_replica/data/models/desconto_model.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/periodo_entity.dart';
import 'package:mocktail/mocktail.dart';

class MockDescontoModel extends Mock implements DescontoModel {}

void main() {
  group('PeriodoModel', () {
    test('deve ser uma subclasse de PeriodoEntity', () {
      const periodoModel = PeriodoModel(
        tempoFormatado: '2h',
        tempo: '120',
        valor: 100.0,
        valorTotal: 120.0,
        temCortesia: true,
        desconto: null,
      );

      expect(periodoModel, isA<PeriodoEntity>());
    });

    test('fromJson deve retornar um modelo válido', () {
      final json = {
        'tempoFormatado': '2h',
        'tempo': '120',
        'valor': 100.0,
        'valorTotal': 120.0,
        'temCortesia': true,
        'desconto': {'desconto': 10.0},
      };

      final result = PeriodoModel.fromJson(json);

      expect(result, isA<PeriodoModel>());
      expect(result.tempoFormatado, '2h');
      expect(result.tempo, '120');
      expect(result.valor, 100.0);
      expect(result.valorTotal, 120.0);
      expect(result.temCortesia, true);
      expect(result.desconto, isA<DescontoModel>());
      expect(result.desconto?.desconto, 10.0);
    });

    test('fromJson should handle null values', () {
      final json = {
        'tempoFormatado': null,
        'tempo': null,
        'valor': null,
        'valorTotal': null,
        'temCortesia': null,
        'desconto': null,
      };

      final result = PeriodoModel.fromJson(json);

      expect(result, isA<PeriodoModel>());
      expect(result.tempoFormatado, '');
      expect(result.tempo, '');
      expect(result.valor, 0.0);
      expect(result.valorTotal, 0.0);
      expect(result.temCortesia, false);
      expect(result.desconto, null);
    });
  });
}
