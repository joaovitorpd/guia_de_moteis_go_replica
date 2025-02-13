import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:guia_de_moteis_go_replica/core/errors/failure.dart';
import 'package:mocktail/mocktail.dart';
import 'package:guia_de_moteis_go_replica/presentation/cubit/motel_cubit.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/motel_entity.dart';
import 'package:guia_de_moteis_go_replica/domain/repositories/motel_repository.dart';
import 'package:dartz/dartz.dart';

class MockMotelRepository extends Mock implements MotelRepository {}

void main() {
  late MotelCubit motelCubit;
  late MockMotelRepository mockMotelRepository;

  setUp(() {
    mockMotelRepository = MockMotelRepository();
    motelCubit = MotelCubit(mockMotelRepository);
  });

  tearDown(() {
    motelCubit.close();
  });

  group('MotelCubit', () {
    final List<MotelEntity> moteis = [
      MotelEntity(
        fantasia: 'Motel 1',
        logo: 'logo1.png',
        bairro: 'Bairro 1',
        distancia: 1.0,
        qtdFavoritos: 10,
        suites: [],
        qtdAvaliacoes: 5,
        media: 4.5,
      ),
      MotelEntity(
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

    blocTest<MotelCubit, MotelState>(
      'emite [MotelLoading, MotelLoaded] quando fetchMoteis é bem-sucedido',
      build: () {
        when(() => mockMotelRepository.getMoteis())
            .thenAnswer((_) async => Right(moteis));
        return motelCubit;
      },
      act: (cubit) => cubit.fetchMoteis(),
      expect: () => [
        MotelLoading(),
        MotelLoaded(moteis),
      ],
    );

    blocTest<MotelCubit, MotelState>(
      'emite [MotelLoading, MotelError] quando fetchMoteis falha',
      build: () {
        when(() => mockMotelRepository.getMoteis()).thenAnswer((_) async =>
            Left(Failure(message: 'Mensagem de erro', statusCode: 500)));
        return motelCubit;
      },
      act: (cubit) => cubit.fetchMoteis(),
      expect: () => [
        MotelLoading(),
        MotelError('500 Error: Mensagem de erro'),
      ],
    );

    blocTest<MotelCubit, MotelState>(
      'emite [MotelInitial] no estado inicial',
      build: () => motelCubit,
      expect: () => [],
    );

    blocTest<MotelCubit, MotelState>(
      'emite [MotelLoading] quando fetchMoteis é chamado',
      build: () {
        when(() => mockMotelRepository.getMoteis())
            .thenAnswer((_) async => Right(moteis));
        return motelCubit;
      },
      act: (cubit) => cubit.fetchMoteis(),
      verify: (_) {
        verify(() => mockMotelRepository.getMoteis()).called(1);
      },
    );

    blocTest<MotelCubit, MotelState>(
      'emite [MotelLoading, MotelLoaded] com lista vazia quando não há moteis',
      build: () {
        when(() => mockMotelRepository.getMoteis())
            .thenAnswer((_) async => Right([]));
        return motelCubit;
      },
      act: (cubit) => cubit.fetchMoteis(),
      expect: () => [
        MotelLoading(),
        MotelLoaded([]),
      ],
    );

    blocTest<MotelCubit, MotelState>(
      'emite [MotelLoading, MotelError] quando há uma exceção',
      build: () {
        when(() => mockMotelRepository.getMoteis())
            .thenThrow(Exception('Erro inesperado'));
        return motelCubit;
      },
      act: (cubit) => cubit.fetchMoteis(),
      errors: () => [
        isA<Exception>(),
      ],
    );
  });
}
