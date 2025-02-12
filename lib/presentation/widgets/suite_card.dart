import 'package:flutter/material.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/suite_entity.dart';

class SuiteCard extends StatelessWidget {
  final SuiteEntity suite;

  const SuiteCard({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Largura do card de suíte
      margin: const EdgeInsets.only(right: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(8.0), // Bordas arredondadas
                    child: Image.network(
                      suite.fotos.isNotEmpty
                          ? suite.fotos[0]
                          : 'https://via.placeholder.com/100', // Imagem padrão se não houver foto
                      /* width: 100,
                      height: 80, */
                      fit: BoxFit.cover, // Ajuste da imagem
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                suite.nome,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Quantidade: ${suite.qtd}',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 8),
              Expanded(
                flex: 1,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    const Text(
                      'Itens:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ...suite.itens.map((item) => Text('- ${item.nome} ')),
                  ],
                ),
              ),
              //const SizedBox(height: 8),
              Expanded(
                flex: 2,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const Text(
                      'Períodos:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ...suite.periodos.map((periodo) => Text(
                          '${periodo.tempoFormatado}: R\$ ${periodo.valorTotal.toStringAsFixed(2)}',
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
