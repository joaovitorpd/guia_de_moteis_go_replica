import 'package:flutter/material.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/motel_entity.dart';
import 'package:guia_de_moteis_go_replica/presentation/widgets/suite_card.dart';

class MotelCard extends StatelessWidget {
  final MotelEntity _motel;

  const MotelCard({super.key, required MotelEntity motel}) : _motel = motel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _motel.fantasia,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _motel.bairro,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 450, // Altura do slider de suítes
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _motel.suites.length,
                itemBuilder: (context, index) {
                  final suite = _motel.suites[index];
                  return SuiteCard(suite: suite);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
