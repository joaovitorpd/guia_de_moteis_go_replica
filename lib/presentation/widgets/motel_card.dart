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
      elevation: 0, // Adicione esta linha para remover a sombra
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize:
              MainAxisSize.min, // Faça o cartão se adaptar ao seu conteúdo
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
              child: Text(
                _motel.fantasia,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
              child: Text(
                _motel.bairro,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 700, // Altura do slider de suítes
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
