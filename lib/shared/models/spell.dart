import 'my_image.dart';

class Spell {
  final String id;
  final String name;
  final String? incantation;
  final String effect;
  final bool? canBeVerbal;
  final String type;
  final String light;
  final String? creator;
  final MyImage spellImage;

  Spell({
    required this.id,
    required this.name,
    this.incantation,
    required this.effect,
    this.canBeVerbal,
    required this.type,
    required this.light,
    this.creator,
    required this.spellImage
  });

  // factory Spell.fromJson(Map<String, dynamic> json) {
  //   return Spell(
  //     id: json['id'],
  //     name: json['name'],
  //     incantation: json['incantation'],
  //     effect: json['effect'],
  //     canBeVerbal: json['canBeVerbal'],
  //     type: json['type'],
  //     light: json['light'],
  //     creator: json['creator'],
  //   );
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'incantation': incantation,
  //     'effect': effect,
  //     'canBeVerbal': canBeVerbal,
  //     'type': type,
  //     'light': light,
  //     'creator': creator,
  //   };
  // }
}