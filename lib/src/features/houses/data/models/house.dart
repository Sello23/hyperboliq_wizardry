import '../../../../shared/models/my_image.dart';
import 'head.dart';
import 'trait.dart';

class House {
  final String id;
  final String name;
  final String houseColours;
  final String founder;
  final String animal;
  final String element;
  final String ghost;
  final String commonRoom;
  final List<Head> heads;  // Assuming Head is another class
  final List<Trait> traits; // Assuming Trait is another class
  final MyImage myImage; // Assuming MyImage is another class

  House({
    required this.id,
    required this.name,
    required this.houseColours,
    required this.founder,
    required this.animal,
    required this.element,
    required this.ghost,
    required this.commonRoom,
    required this.heads,
    required this.traits,
    required this.myImage,
  });

  factory House.fromJson(Map<String, dynamic> json) {
    return House(
      id: json['id'] as String,
      name: json['name'] as String,
      houseColours: json['houseColours'] as String,
      founder: json['founder'] as String,
      animal: json['animal'] as String,
      element: json['element'] as String,
      ghost: json['ghost'] as String,
      commonRoom: json['commonRoom'] as String,
      heads: (json['heads'] as List<dynamic>)
          .map((head) => Head.fromJson(head as Map<String, dynamic>))
          .toList(),
      traits: (json['traits'] as List<dynamic>)
          .map((trait) => Trait.fromJson(trait as Map<String, dynamic>))
          .toList(),
      myImage: MyImage.fromJson(json['myImage'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'houseColours': houseColours,
      'founder': founder,
      'animal': animal,
      'element': element,
      'ghost': ghost,
      'commonRoom': commonRoom,
      'heads': heads.map((head) => head.toJson()).toList(),
      'traits': traits.map((trait) => trait.toJson()).toList(),
      'myImage': myImage.toJson(),
    };
  }
}