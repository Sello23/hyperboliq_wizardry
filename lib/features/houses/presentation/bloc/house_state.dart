import 'package:equatable/equatable.dart';

import '../../data/models/house.dart';

abstract class HouseState extends Equatable {
  const HouseState();

  @override
  List<Object> get props => [];
}

class HousesInitial extends HouseState {}

class HousesLoading extends HouseState {}

class HousesLoaded extends HouseState {
  final List<House> houses;

  const HousesLoaded({required this.houses});

  @override
  List<Object> get props => [houses];
}

class HousesError extends HouseState {
  final String message;

  const HousesError({this.message = "An error occurred while fetching houses"});

  @override
  List<Object> get props => [message];
}