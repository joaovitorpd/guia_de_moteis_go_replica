import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:guia_de_moteis_go_replica/data/models/motel_model.dart';
import 'package:guia_de_moteis_go_replica/data/models/suite_model.dart';
import 'package:guia_de_moteis_go_replica/core/utils/typedef.dart';

class MockSuiteModel extends Mock implements SuiteModel {}

void main() {
  group('MotelModel', () {
    late DataMap json;
    late MotelModel motelModel;

    setUp(() {
      json = {
        'fantasia': 'Motel Teste',
        'logo': 'logo.png',
        'bairro': 'Centro',
        'distancia': 10.5,
        'qtdFavoritos': 100,
        'suites': [
          {
            'id': 1,
            'nome': 'Suite Teste',
            'preco': 200.0,
          }
        ],
        'qtdAvaliacoes': 50,
        'media': 4.5,
      };

      motelModel = MotelModel.fromJson(json);
    });

    test('deve criar um MotelModel válido a partir do JSON', () {
      expect(motelModel.fantasia, 'Motel Teste');
      expect(motelModel.logo, 'logo.png');
      expect(motelModel.bairro, 'Centro');
      expect(motelModel.distancia, 10.5);
      expect(motelModel.qtdFavoritos, 100);
      expect(motelModel.suites.length, 1);
      expect(motelModel.suites.first.nome, 'Suite Teste');
      expect(motelModel.qtdAvaliacoes, 50);
      expect(motelModel.media, 4.5);
    });

    test('deve lidar com valores nulos no JSON', () {
      json = {
        'fantasia': null,
        'logo': null,
        'bairro': null,
        'distancia': null,
        'qtdFavoritos': null,
        'suites': null,
        'qtdAvaliacoes': null,
        'media': null,
      };

      motelModel = MotelModel.fromJson(json);

      expect(motelModel.fantasia, '');
      expect(motelModel.logo, '');
      expect(motelModel.bairro, '');
      expect(motelModel.distancia, 0.0);
      expect(motelModel.qtdFavoritos, 0);
      expect(motelModel.suites, []);
      expect(motelModel.qtdAvaliacoes, 0);
      expect(motelModel.media, 0.0);
    });
  });
}
