import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guia_de_moteis_go_replica/presentation/cubit/motel_cubit.dart';
import 'package:guia_de_moteis_go_replica/presentation/widgets/motel_card.dart';
import 'package:toggle_switch/toggle_switch.dart';

class MotelListView extends StatelessWidget {
  const MotelListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        leading: Center(
          child: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Lidar com o botão de menu pressionado
            },
          ),
        ),
        title: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ToggleSwitch(
                minWidth: 120.0,
                minHeight: 30.0,
                cornerRadius: 20.0,
                initialLabelIndex: 0,
                totalSwitches: 2,
                labels: ['ir agora', 'ir outro dia'],
                radiusStyle: true,
                onToggle: (index) {
                  // Lidar com a alternância do switch
                },
                activeBgColor: [Colors.white],
                inactiveBgColor: const Color.fromARGB(255, 174, 9, 21),
                activeFgColor: Colors.black,
                inactiveFgColor: Colors.white,
              ),
            ],
          ),
        ),
        actions: [
          Center(
            child: IconButton(
              color: Colors.white,
              icon: const Icon(Icons.search),
              onPressed: () {
                // Lidar com o botão de busca pressionado
              },
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 201, 25, 35),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 201, 25, 35),
              child: TextButton.icon(
                onPressed: () {
                  // Lidar com o botão de localização pressionado
                },
                iconAlignment: IconAlignment.end,
                icon:
                    const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                label: const Text('minha localização',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: Stack(
              children: [
                Container(
                  color: const Color.fromARGB(255, 201, 25, 35),
                  height: 50,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: Container(
                    color: const Color.fromARGB(255, 248, 248, 248),
                    child: BlocBuilder<MotelCubit, MotelState>(
                      builder: (context, state) {
                        if (state is MotelLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
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
                        return const Center(
                            child: Text('Nenhum dado encontrado'));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
