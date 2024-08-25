import 'package:hyperboliq/shared/models/house/trait.dart';

import 'head.dart';
import '../my_image.dart';

class House {
  final String id;
  final String name;
  final String houseColours;
  final String founder;
  final String animal;
  final String element;
  final String ghost;
  final String commonRoom;
  final List<Head> heads;
  final List<Trait> traits;
  final MyImage houseBackgroundImage;

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
    required this.houseBackgroundImage,
  });

// factory House.fromJson(Map<String, dynamic> json) {
//   return House(
//     id: json['id'],
//     name: json['name'],
//     houseColours: json['houseColours'],
//     founder: json['founder'],
//     animal: json['animal'],
//     element: json['element'],
//     ghost: json['ghost'],
//     commonRoom: json['commonRoom'],
//     heads: (json['heads'] as List).map((e) => Head.fromJson(e)).toList(),
//     traits: (json['traits'] as List).map((e) => Trait.fromJson(e)).toList(),
//   );
// }
//
// Map<String, dynamic> toJson() {
//   return {
//     'id': id,
//     'name': name,
//     'houseColours': houseColours,
//     'founder': founder,
//     'animal': animal,
//     'element': element,
//     'ghost': ghost,
//     'commonRoom': commonRoom,
//     'heads': heads.map((e) => e.toJson()).toList(),
//     'traits': traits.map((e) => e.toJson()).toList(),
//   };
}
