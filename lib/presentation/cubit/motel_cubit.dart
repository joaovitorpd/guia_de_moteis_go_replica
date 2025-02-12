import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guia_de_moteis_go_replica/domain/entities/motel_entity.dart';
import 'package:guia_de_moteis_go_replica/domain/repositories/motel_repository.dart';

part 'motel_state.dart';

class MotelCubit extends Cubit<MotelState> {
  final MotelRepository _repository;

  MotelCubit(this._repository) : super(MotelInitial());

  Future<void> fetchMoteis() async {
    emit(MotelLoading());
    final result = await _repository.getMoteis();
    result.fold(
      (failure) => emit(MotelError(failure.errorMessage)),
      (moteis) => emit(MotelLoaded(moteis)),
    );
  }
}
