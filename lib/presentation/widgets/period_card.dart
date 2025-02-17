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
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  periodo.tempoFormatado,
                                  style: const TextStyle(
                                      fontSize: 20.0, color: Colors.black),
                                ),
                                if (periodo.desconto != null &&
                                    periodo.desconto!.desconto > 0)
                                  Container(
                                    margin: const EdgeInsets.only(left: 8.0),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0, vertical: 2.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: Colors.transparent,
                                      border: Border.all(color: Colors.green),
                                    ),
                                    child: Text(
                                      '${periodo.desconto!.desconto}% off',
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 12.0, // Reduced font size
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'R\$ ${periodo.valorTotal.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: periodo.desconto != null &&
                                            periodo.desconto!.desconto > 0
                                        ? const Color.fromARGB(
                                            255, 136, 136, 136)
                                        : Colors.black,
                                    decoration: periodo.desconto != null &&
                                            periodo.desconto!.desconto > 0
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  ),
                                ),
                                if (periodo.desconto != null &&
                                    periodo.desconto!.desconto > 0)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'R\$ ${(periodo.valorTotal * (1 - periodo.desconto!.desconto / 100)).toStringAsFixed(2)}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                              ],
                            ),
                          ],
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
