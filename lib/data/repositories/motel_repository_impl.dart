import 'package:dartz/dartz.dart';
import 'package:guia_de_moteis_go_replica/core/errors/exceptions.dart';
import 'package:guia_de_moteis_go_replica/core/errors/failure.dart';
import 'package:guia_de_moteis_go_replica/core/utils/typedef.dart';
import 'package:guia_de_moteis_go_replica/data/datasources/motel_remote_data_source.dart';
import 'package:guia_de_moteis_go_replica/data/models/motel_model.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/motel_entity.dart';
import 'package:guia_de_moteis_go_replica/domain/repositories/motel_repository.dart';

class MotelRepositoryImpl implements MotelRepository {
  final MotelRemoteDataSource _remoteDataSource;

  MotelRepositoryImpl(this._remoteDataSource);

  @override
  ResultFuture<List<MotelEntity>> getMoteis() async {
    try {
      final response = await _remoteDataSource.getMoteis();
      if (response.isEmpty) {
        return const Right([]); // Retorna lista vazia se a resposta for nula
      }

      final data = response['data'] as DataMap;
      final moteisJson = data['moteis'] as List<dynamic>? ?? [];
      final moteis = moteisJson
          .map((json) => MotelModel.fromJson(json as DataMap))
          .toList();

      return Right(moteis);
    } on ApiException catch (e) {
      return Left(APIFailure.formatException(e));
    }
  }
}
