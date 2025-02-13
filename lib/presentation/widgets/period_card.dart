import 'package:flutter/material.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/suite_entity.dart';

class PeriodCard extends StatelessWidget {
  final SuiteEntity suite;
  const PeriodCard({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: suite.periodos
          .map((periodo) => SizedBox(
                width: double.infinity,
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '${periodo.tempoFormatado}: R\$ ${periodo.valorTotal.toStringAsFixed(2)}',
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            color: Colors.black),
                      ],
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
