import 'package:flutter/material.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/motel_entity.dart';
import 'package:guia_de_moteis_go_replica/presentation/widgets/suite_card.dart';
import 'package:preload_page_view/preload_page_view.dart';

class MotelCard extends StatelessWidget {
  final MotelEntity _motel;

  const MotelCard({super.key, required MotelEntity motel}) : _motel = motel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: const EdgeInsets.all(8.0),
      elevation: 0, // Add this line to remove the shadow
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Make the card adapt to its content
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
            const SizedBox(height: 8),
            SizedBox(
              height: 600, // Altura do slider de suítes
              child: PreloadPageView.builder(
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
