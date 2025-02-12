import 'package:equatable/equatable.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/desconto_entity.dart';

class PeriodoEntity extends Equatable {
  const PeriodoEntity({
    required this.tempoFormatado,
    required this.tempo,
    required this.valor,
    required this.valorTotal,
    required this.temCortesia,
    this.desconto,
  });

  final String tempoFormatado;
  final String tempo;
  final double valor;
  final double valorTotal;
  final bool temCortesia;
  final DescontoEntity? desconto;

  @override
  List<Object?> get props => [
        tempoFormatado,
        tempo,
        valor,
        valorTotal,
        temCortesia,
        desconto,
      ];
}
