import 'package:equatable/equatable.dart';

import '../../data/models/spell.dart';

enum SpellsStatus {loading, success, failure, offline }

extension SpellsStatusX on SpellsStatus {

  bool get isLoading => this == SpellsStatus.loading;

  bool get isSuccess => this == SpellsStatus.success;

  bool get isFailure => this == SpellsStatus.failure;

  bool get isOffline => this == SpellsStatus.offline;

}

final class SpellsState extends Equatable {
  const SpellsState({
    this.status = SpellsStatus.loading,
    required this.spells,
  });

  final SpellsStatus status;
  final List<Spell> spells;

  @override
  List<Object?> get props => [status, spells];

  SpellsState copyWith({
    SpellsStatus? status,
    List<Spell>? spells,
  }) {
    return SpellsState(
      status: status ?? this.status,
      spells: spells ?? this.spells,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status.toString().split('.').last,
      'spells': spells.map((spell) => spell.toJson()).toList(),
    };
  }

  static SpellsState fromJson(Map<String, dynamic> json) {
    return SpellsState(
      status: SpellsStatus.values.firstWhere(
              (e) => e.toString().split('.').last == json['status']
      ),
      spells: (json['spells'] as List)
          .map((spellJson) => Spell.fromJson(spellJson))
          .toList(),
    );
  }
}
