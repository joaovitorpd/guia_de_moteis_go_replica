import 'package:guia_de_moteis_go_replica/core/utils/typedef.dart';
import 'package:guia_de_moteis_go_replica/data/models/suite_model.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/motel_entity.dart';

class MotelModel extends MotelEntity {
  const MotelModel({
    required super.fantasia,
    required super.logo,
    required super.bairro,
    required super.distancia,
    required super.qtdFavoritos,
    required super.suites,
    required super.qtdAvaliacoes,
    required super.media,
  });

  factory MotelModel.fromJson(DataMap json) {
    return MotelModel(
      fantasia: json['fantasia'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
      bairro: json['bairro'] as String? ?? '',
      distancia: (json['distancia'] as num?)?.toDouble() ?? 0.0,
      qtdFavoritos: json['qtdFavoritos'] as int? ?? 0,
      suites: (json['suites'] as List<dynamic>?)
              ?.map((suite) => SuiteModel.fromJson(suite as DataMap))
              .toList() ??
          [],
      qtdAvaliacoes: json['qtdAvaliacoes'] as int? ?? 0,
      media: (json['media'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
