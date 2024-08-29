import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hyperboliq/src/features/spells/domain/repository/spells_repository.dart';
import 'package:hyperboliq/src/features/spells/presentation/state/spells_state.dart';

import '../../../../shared/wizard_world_api_client.dart';

class SpellsCubit extends HydratedCubit<SpellsState> {
  SpellsCubit({required SpellsRepository spellsRepository})
      : _spellsRepository = spellsRepository, super(const SpellsState(spells: []));

  final SpellsRepository _spellsRepository;

  // Fetch spells and update the state
  Future<void> fetchSpells() async {
    emit(state.copyWith(status: SpellsStatus.loading));

    try {
      final spells = await _spellsRepository.getSpells();
      emit(state.copyWith(
        status: SpellsStatus.success,
        spells: spells,
      ));
    }
    on SpellNotFoundFailure{
      emit(state.copyWith(status: SpellsStatus.failure));
    }
    catch (_) {
      emit(state.copyWith(status: SpellsStatus.offline));
    }
  }

  Future<void> searchSpells(String query) async {
    emit(state.copyWith(status: SpellsStatus.loading));

    try {
      final spells = await _spellsRepository.getSpells();
      emit(state.copyWith(
        status: SpellsStatus.success,
        spells: spells,
      ));
    }
    on SpellNotFoundFailure{
      emit(state.copyWith(status: SpellsStatus.failure));
    }
    catch (_) {
      emit(state.copyWith(status: SpellsStatus.offline));
    }
  }

  Future<void> fetchSpellsById(String query) async {
    emit(state.copyWith(status: SpellsStatus.loading));

    try {
      final spells = await _spellsRepository.searchSpells(query);
      emit(state.copyWith(
        status: SpellsStatus.success,
        spells: spells,
      ));
    }
    on SpellNotFoundFailure{
      emit(state.copyWith(status: SpellsStatus.failure));
    }
    catch (_) {
      emit(state.copyWith(status: SpellsStatus.offline));
    }
  }

  @override
  SpellsState fromJson(Map<String, dynamic> json) {
    try {
      return SpellsState.fromJson(json);
    } catch (_) {
      return const SpellsState(spells: []);
    }
  }

  @override
  Map<String, dynamic> toJson(SpellsState state) {
    return state.toJson();
  }
}
