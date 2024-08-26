
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