import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_houses.dart';
import 'house_event.dart';
import 'house_state.dart';


class HouseBloc extends Bloc<HouseEvent, HouseState> {
  final GetHouses getHouses;

  HouseBloc(this.getHouses) : super(HousesInitial()) {
    on<FetchHouses>(_onFetchHouses);
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
}