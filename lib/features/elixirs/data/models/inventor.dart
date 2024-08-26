class Inventor {
  String? id;
  String? firstName;
  String? lastName;

  Inventor({
    this.id,
    this.firstName,
    this.lastName,
  });

  factory Inventor.fromJson(Map<String, dynamic> json) {
    return Inventor(
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