import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:guia_de_moteis_go_replica/core/errors/exceptions.dart';
import 'package:guia_de_moteis_go_replica/data/datasources/motel_remote_data_source.dart';
import 'package:guia_de_moteis_go_replica/core/utils/typedef.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MotelRemoteDataSource dataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    dataSource = MotelRemoteDataSource(mockDio);
  });

  group('getMoteis', () {
    final tDataMap = {'key': 'value'} as DataMap;

    test('deve retornar DataMap quando o código de resposta for 200 (sucesso)',
        () async {
      // arrange
      when(() => mockDio.get(any())).thenAnswer((_) async => Response(
            data: tDataMap,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));
      // act
      final result = await dataSource.getMoteis();
      // assert
      expect(result, tDataMap);
    });

    test('deve lançar ApiException quando DioException for lançada', () async {
      // arrange
      when(() => mockDio.get(any())).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Something went wrong',
      ));
      // act
      final call = dataSource.getMoteis;
      // assert
      expect(() => call(), throwsA(isA<ApiException>()));
    });
  });
}
