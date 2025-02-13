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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Itens:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children:
                    suite.itens.map((item) => Text('- ${item.nome} ')).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
