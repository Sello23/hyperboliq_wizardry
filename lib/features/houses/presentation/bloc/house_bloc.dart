import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_house_details.dart';
import '../../domain/usecases/get_houses.dart';
import 'house_event.dart';
import 'house_state.dart';


class HouseBloc extends Bloc<HouseEvent, HouseState> {
  final GetHouses getHouses;
  final GetHouseDetails? getHouseDetails; // Optional parameter

  HouseBloc({
    required this.getHouses,
    this.getHouseDetails, // Optional parameter
  }) : super(HousesInitial()) {
    on<FetchHouses>(_onFetchHouses);
    if (getHouseDetails != null) {
      on<FetchHouseDetails>(_onFetchHouseDetails);
    }
  }

  Future<void> _onFetchHouses(
      FetchHouses event,
      Emitter<HouseState> emit,
      ) async {
    emit(HousesLoading());
    try {
      final houses = await getHouses();
      emit(HousesLoaded(houses: houses));
    } catch (error) {
      emit(HousesError(message: error.toString()));
    }
  }

  Future<void> _onFetchHouseDetails(
      FetchHouseDetails event,
      Emitter<HouseState> emit,
      ) async {
    if (getHouseDetails == null) {
      emit(const HousesError(message: "House details use case is not provided"));
      return;
    }

    emit(HouseDetailsLoading());
    try {
      final house = await getHouseDetails!(event.id);
      emit(HouseDetailsLoaded(house: house));
    } catch (error) {
      emit(HousesError(message: error.toString()));
    }
  }
}