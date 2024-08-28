import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../shared/wizard_world_api_client.dart';
import '../../domain/repository/elixir_repository.dart';
import 'elixirs_state.dart';

class ElixirsCubit extends HydratedCubit<ElixirsState> {
  ElixirsCubit({required ElixirRepository elixirRepository})
      : _elixirRepository = elixirRepository, super(const ElixirsState(elixirs: []));

  final ElixirRepository _elixirRepository;

  // Fetch elixirs and update the state
  Future<void> fetchElixirs() async {
    emit(state.copyWith(status: ElixirsStatus.loading));

    try {
      final elixirs = await _elixirRepository.getElixirs();
      emit(state.copyWith(
        status: ElixirsStatus.success,
        elixirs: elixirs,
      ));
    }
    on ElixirNotFoundFailure{
      emit(state.copyWith(status: ElixirsStatus.failure));
    }
    catch (_) {
      emit(state.copyWith(status: ElixirsStatus.offline));
    }
  }

  Future<void> fetchElixirsById(String id) async {
    emit(state.copyWith(status: ElixirsStatus.loading));

    try {
      final elixir = await _elixirRepository.getElixir(id);
      emit(state.copyWith(
        status: ElixirsStatus.success,
        elixirs: [elixir],
      ));
    }
    on ElixirNotFoundFailure{
      emit(state.copyWith(status: ElixirsStatus.failure));
    }
    catch (_) {
      emit(state.copyWith(status: ElixirsStatus.offline));
    }
  }

  @override
  ElixirsState fromJson(Map<String, dynamic> json) {
    try {
      return ElixirsState.fromJson(json);
    } catch (_) {
      return const ElixirsState(elixirs: []);
    }
  }

  @override
  Map<String, dynamic> toJson(ElixirsState state) {
    return state.toJson();
  }
}
