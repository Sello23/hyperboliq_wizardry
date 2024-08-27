import 'package:equatable/equatable.dart';

class Head extends Equatable {
  final String id;
  final String firstName;
  final String lastName;

  const Head({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory Head.fromJson(Map<String, dynamic> json) {
    return Head(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
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