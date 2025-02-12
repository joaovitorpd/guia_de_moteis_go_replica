import 'package:guia_de_moteis_go_replica/core/utils/typedef.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/motel_entity.dart';

abstract class MotelRepository {
  ResultFuture<List<MotelEntity>> getMoteis();
}
