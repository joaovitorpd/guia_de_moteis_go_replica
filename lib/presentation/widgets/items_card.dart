import 'package:flutter/material.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/suite_entity.dart';

class ItemsCard extends StatelessWidget {
  final SuiteEntity suite;
  const ItemsCard({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...suite.categoriaItens.take(4).map((categoria) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                        color: Color.fromARGB(255, 246, 248, 250),
                        child: Image.network(
                          categoria.icone,
                          width: 45,
                          height: 45,
                        ),
                      ),
                    )),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          'ver',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 136, 136, 136)),
                        ),
                        Text(
                          'todos',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 136, 136, 136)),
                        ),
                      ],
                    ),
                    SizedBox(width: 4),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: Color.fromARGB(255, 136, 136, 136),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
