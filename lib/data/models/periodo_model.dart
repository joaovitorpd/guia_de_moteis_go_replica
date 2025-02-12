import 'package:guia_de_moteis_go_replica/core/utils/typedef.dart';
import 'package:guia_de_moteis_go_replica/data/models/desconto_model.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/periodo_entity.dart';

class PeriodoModel extends PeriodoEntity {
  const PeriodoModel({
    required super.tempoFormatado,
    required super.tempo,
    required super.valor,
    required super.valorTotal,
    required super.temCortesia,
    super.desconto,
  });

  factory PeriodoModel.fromJson(DataMap json) {
    return PeriodoModel(
      tempoFormatado: json['tempoFormatado'] as String? ?? '',
      tempo: json['tempo'] as String? ?? '',
      valor: (json['valor'] as num?)?.toDouble() ?? 0.0,
      valorTotal: (json['valorTotal'] as num?)?.toDouble() ?? 0.0,
      temCortesia: json['temCortesia'] as bool? ?? false,
      desconto: json['desconto'] != null
          ? DescontoModel.fromJson(json['desconto'] as DataMap)
          : null,
    );
  }
}
