import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_go_replica/data/models/desconto_model.dart';

void main() {
  group('DescontoModel', () {
    test('deve retornar um modelo válido a partir do JSON', () {
      // arrange
      final Map<String, dynamic> jsonMap = {'desconto': 10.0};

      // act
      final result = DescontoModel.fromJson(jsonMap);

      // assert
      expect(result.desconto, 10.0);
    });

    test('deve retornar um modelo com valor padrão quando o JSON for nulo', () {
      // arrange
      final Map<String, dynamic> jsonMap = {'desconto': null};

      // act
      final result = DescontoModel.fromJson(jsonMap);

      // assert
      expect(result.desconto, 0.0);
    });

    test(
        'deve retornar um modelo com valor padrão quando a chave do JSON estiver ausente',
        () {
      // arrange
      final Map<String, dynamic> jsonMap = {};

      // act
      final result = DescontoModel.fromJson(jsonMap);

      // assert
      expect(result.desconto, 0.0);
    });
  });
}
