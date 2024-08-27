
import 'package:equatable/equatable.dart';

abstract class HouseEvent extends Equatable {
  const HouseEvent();

  @override
  List<Object> get props => [];
}

class FetchHouses extends HouseEvent {
  const FetchHouses();

  @override
  List<Object> get props => [];
}

class FetchHouseDetails extends HouseEvent {
  final String id;

  const FetchHouseDetails(this.id);

  @override
  List<Object> get props => [];
}