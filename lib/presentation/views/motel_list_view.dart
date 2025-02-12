import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guia_de_moteis_go_replica/presentation/cubit/motel_cubit.dart';
import 'package:guia_de_moteis_go_replica/presentation/widgets/motel_card.dart';

class MotelListView extends StatelessWidget {
  const MotelListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moteis Disponíveis'),
        centerTitle: true,
      ),
      body: BlocBuilder<MotelCubit, MotelState>(
        builder: (context, state) {
          if (state is MotelLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MotelError) {
            return Center(child: Text(state.message));
          } else if (state is MotelLoaded) {
            final moteis = state.moteis;
            return ListView.builder(
              itemCount: moteis.length,
              itemBuilder: (context, index) {
                final motel = moteis[index];
                return MotelCard(motel: motel);
              },
            );
          }
          return const Center(child: Text('Nenhum dado encontrado'));
        },
      ),
    );
  }
}
