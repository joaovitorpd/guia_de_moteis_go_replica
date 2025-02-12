import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:guia_de_moteis_go_replica/data/datasources/motel_remote_data_source.dart';
import 'package:guia_de_moteis_go_replica/data/repositories/motel_repository_impl.dart';
import 'package:guia_de_moteis_go_replica/presentation/cubit/motel_cubit.dart';
import 'package:guia_de_moteis_go_replica/presentation/views/motel_list_view.dart';

void main() {
  final dio = Dio();
  final remoteDataSource = MotelRemoteDataSource(dio);
  final repository = MotelRepositoryImpl(remoteDataSource);

  runApp(
    MaterialApp(
      home: BlocProvider(
        create: (context) => MotelCubit(repository)..fetchMoteis(),
        child: const MotelListView(),
      ),
    ),
  );
}
