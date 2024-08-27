import 'package:equatable/equatable.dart';

import '../../data/models/house.dart';

abstract class HouseState extends Equatable {
  const HouseState();

  @override
  List<Object?> get props => [];
}

class HousesInitial extends HouseState {}

class HousesLoading extends HouseState {}

class HousesLoaded extends HouseState {
  final List<House> houses;

  const HousesLoaded({required this.houses});

  @override
  List<Object?> get props => [houses];
}

class HouseDetailsLoading extends HouseState {}

class HouseDetailsLoaded extends HouseState {
  final House house;

  const HouseDetailsLoaded({required this.house});

  @override
  List<Object?> get props => [house];
}

class HousesError extends HouseState {
  final String message;

  const HousesError({this.message = "An error occurred while fetching data"});

  @override
  List<Object?> get props => [message];
}