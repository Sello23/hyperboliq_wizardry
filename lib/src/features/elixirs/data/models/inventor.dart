import 'package:equatable/equatable.dart';

class Inventor extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;

  const Inventor({
    this.id,
    this.firstName,
    this.lastName,
  });

  factory Inventor.fromJson(Map<String, dynamic> json) {
    return Inventor(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  @override
  List<Object?> get props => [id, firstName, lastName];
}