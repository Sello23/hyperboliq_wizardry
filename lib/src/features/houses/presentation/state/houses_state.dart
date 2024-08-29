import 'package:equatable/equatable.dart';

import '../../data/models/house.dart';

enum HousesStatus {loading, success, failure, offline }

extension HousesStatusX on HousesStatus {

  bool get isLoading => this == HousesStatus.loading;

  bool get isSuccess => this == HousesStatus.success;

  bool get isFailure => this == HousesStatus.failure;

  bool get isOffline => this == HousesStatus.offline;

}

final class HousesState extends Equatable {
  const HousesState({
    this.status = HousesStatus.loading,
    required this.houses,
  });

  final HousesStatus status;
  final List<House> houses;

  @override
  List<Object?> get props => [status, houses];

  HousesState copyWith({
    HousesStatus? status,
    List<House>? houses,
  }) {
    return HousesState(
      status: status ?? this.status,
      houses: houses ?? this.houses,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status.toString().split('.').last,
      'houses': houses.map((house) => house.toJson()).toList(),
    };
  }

  static HousesState fromJson(Map<String, dynamic> json) {
    return HousesState(
      status: HousesStatus.values.firstWhere(
        (e) => e.toString().split('.').last == json['status']
      ),
      houses: (json['houses'] as List)
          .map((houseJson) => House.fromJson(houseJson))
          .toList(),
    );
  }
}
