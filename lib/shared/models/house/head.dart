class Head {
  final String id;
  final String firstName;
  final String lastName;

  Head({
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
}
