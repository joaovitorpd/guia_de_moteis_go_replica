import 'package:flutter/material.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/suite_entity.dart';
import 'package:guia_de_moteis_go_replica/presentation/widgets/image_card.dart';
import 'package:guia_de_moteis_go_replica/presentation/widgets/items_card.dart';
import 'package:guia_de_moteis_go_replica/presentation/widgets/period_card.dart';

class SuiteCard extends StatelessWidget {
  final SuiteEntity suite;

  const SuiteCard({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageCard(suite: suite),
          const SizedBox(height: 0.3),
          ItemsCard(suite: suite),
          const SizedBox(height: 0.3),
          PeriodCard(suite: suite),
        ],
      ),
    );
  }
}
