import 'package:json_annotation/json_annotation.dart';
part 'trait.g.dart';

@JsonSerializable()
class Trait {
  final String id;
  final String name;

  Trait({
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
}