import 'package:equatable/equatable.dart';

class Trait extends Equatable {
  final String id;
  final String name;

  const Trait({
    required this.id,
    required this.name,
  });

  factory Trait.fromJson(Map<String, dynamic> json) {
    return Trait(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  List<Object?> get props => [id, name];
}