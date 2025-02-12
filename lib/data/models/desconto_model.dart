import 'package:guia_de_moteis_go_replica/core/utils/typedef.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/desconto_entity.dart';

class DescontoModel extends DescontoEntity {
  const DescontoModel({required super.desconto});

  factory DescontoModel.fromJson(DataMap json) {
    return DescontoModel(
      desconto: (json['desconto'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
