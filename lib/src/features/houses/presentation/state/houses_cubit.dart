import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hyperboliq/src/features/houses/domain/repository/houses_repository.dart';

import '../../../../shared/wizard_world_api_client.dart';
import 'houses_state.dart';

class HousesCubit extends HydratedCubit<HousesState> {
  HousesCubit({required HousesRepository housesRepository})
      : _housesRepository = housesRepository, super(const HousesState(houses: []));

  final HousesRepository _housesRepository;

  // Fetch houses and update the state
  Future<void> fetchHouses() async {
    emit(state.copyWith(status: HousesStatus.loading));

    try {
      final houses = await _housesRepository.getHouses();
      emit(state.copyWith(
        status: HousesStatus.success,
        houses: houses,
      ));
    }
    on HouseNotFoundFailure{
      emit(state.copyWith(status: HousesStatus.failure));
    }
    catch (_) {
      emit(state.copyWith(status: HousesStatus.offline));
    }
  }

  Future<void> fetchHouseById(String id) async {
    emit(state.copyWith(status: HousesStatus.loading));

    try {
      final house = await _housesRepository.getHouse(id);
      emit(state.copyWith(
        status: HousesStatus.success,
        houses: [house],
      ));
    }
    on HouseNotFoundFailure{
      emit(state.copyWith(status: HousesStatus.failure));
    }
    catch (_) {
      emit(state.copyWith(status: HousesStatus.offline));
    }
  }

  @override
  HousesState fromJson(Map<String, dynamic> json) {
    try {
      return HousesState.fromJson(json);
    } catch (_) {
      return const HousesState(houses: []);
    }
  }

  @override
  Map<String, dynamic> toJson(HousesState state) {
    return state.toJson();
  }
}
