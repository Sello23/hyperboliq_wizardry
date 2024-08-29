import 'package:equatable/equatable.dart';

import '../../data/models/elixir.dart';

enum ElixirsStatus {loading, success, failure, offline }

extension ElixirStatusX on ElixirsStatus {

  bool get isLoading => this == ElixirsStatus.loading;

  bool get isSuccess => this == ElixirsStatus.success;

  bool get isFailure => this == ElixirsStatus.failure;

  bool get isOffline => this == ElixirsStatus.offline;

}

final class ElixirsState extends Equatable {
  const ElixirsState({
    this.status = ElixirsStatus.loading,
    required this.elixirs,
  });

  final ElixirsStatus status;
  final List<Elixir> elixirs;

  @override
  List<Object?> get props => [status, elixirs];

  ElixirsState copyWith({
    ElixirsStatus? status,
    List<Elixir>? elixirs,
  }) {
    return ElixirsState(
      status: status ?? this.status,
      elixirs: elixirs ?? this.elixirs,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status.toString().split('.').last,
      'elixirs': elixirs.map((elixir) => elixir.toJson()).toList(),
    };
  }

  static ElixirsState fromJson(Map<String, dynamic> json) {
    return ElixirsState(
      status: ElixirsStatus.values.firstWhere(
              (e) => e.toString().split('.').last == json['status']
      ),
      elixirs: (json['elixirs'] as List)
          .map((elixirsJson) => Elixir.fromJson(elixirsJson))
          .toList(),
    );
  }
}
