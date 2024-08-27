import 'package:equatable/equatable.dart';

import '../../data/models/house.dart';

enum HousesStatus { initial, loading, success, failure }

extension HousesStatusX on HousesStatus {
  bool get isInitial => this == HousesStatus.initial;

  bool get isLoading => this == HousesStatus.loading;

  bool get isSuccess => this == HousesStatus.success;

  bool get isFailure => this == HousesStatus.failure;
}

final class HousesState extends Equatable {
  const HousesState({
    this.status = HousesStatus.initial,
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
        (e) => e.toString().split('.').last == json['status'],
        orElse: () => HousesStatus.initial,
      ),
      houses: (json['houses'] as List)
          .map((houseJson) => House.fromJson(houseJson))
          .toList(),
    );
  }
}
