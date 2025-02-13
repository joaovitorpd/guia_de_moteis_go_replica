import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis_go_replica/core/errors/failure.dart';
import 'package:mocktail/mocktail.dart';
import 'package:guia_de_moteis_go_replica/core/errors/exceptions.dart';
import 'package:guia_de_moteis_go_replica/data/datasources/motel_remote_data_source.dart';
import 'package:guia_de_moteis_go_replica/data/models/motel_model.dart';
import 'package:guia_de_moteis_go_replica/data/repositories/motel_repository_impl.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/motel_entity.dart';

class MockMotelRemoteDataSource extends Mock implements MotelRemoteDataSource {}

void main() {
  late MockMotelRemoteDataSource mockRemoteDataSource;
  late MotelRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockMotelRemoteDataSource();
    repository = MotelRepositoryImpl(mockRemoteDataSource);
  });

  group('getMoteis', () {
    test('deve retornar List<MotelEntity> quando bem-sucedido', () async {
      // Arrange
      final mockData = <MotelModel>[
        MotelModel(
          fantasia: 'Motel 1',
          logo: 'logo1.png',
          bairro: 'Bairro 1',
          distancia: 1.0,
          qtdFavoritos: 10,
          suites: [],
          qtdAvaliacoes: 5,
          media: 4.5,
        ),
        MotelModel(
          fantasia: 'Motel 2',
          logo: 'logo2.png',
          bairro: 'Bairro 2',
          distancia: 2.0,
          qtdFavoritos: 20,
          suites: [],
          qtdAvaliacoes: 10,
          media: 4.0,
        ),
      ];
      final mockDataMap = {
        'data': {
          'moteis': mockData
              .map((motel) => {
                    'fantasia': motel.fantasia,
                    'logo': motel.logo,
                    'bairro': motel.bairro,
                    'distancia': motel.distancia,
                    'qtdFavoritos': motel.qtdFavoritos,
                    'suites': [],
                    'qtdAvaliacoes': motel.qtdAvaliacoes,
                    'media': motel.media,
                  })
              .toList()
        }
      };

      when(() => mockRemoteDataSource.getMoteis())
          .thenAnswer((_) async => Future.value(mockDataMap));

      // Act
      final result = await repository.getMoteis();

      // Assert
      expect(result, isA<Right<Failure, List<MotelEntity>>>());
    });

    test('deve lançar APIFailure quando ocorrer uma exceção', () async {
      // Arrange
      when(() => mockRemoteDataSource.getMoteis())
          .thenThrow(ApiException(message: 'Erro', statusCode: 500));

      // Act & Assert
      var response = repository.getMoteis();
      expect(response, isA<Future<Either<Failure, List<MotelEntity>>>>());
    });
  });
}
