import 'ingredient.dart';
import 'inventor.dart';

class Elixir {
  String id;
  String name;
  String? effect;
  String? sideEffects;
  String? characteristics;
  String? time;
  String difficulty;
  List<Ingredient> ingredients;
  List<Inventor> inventors;
  String? manufacturer;

  Elixir({
    required this.id,
    required this.name,
    this.effect,
    this.sideEffects,
    this.characteristics,
    this.time,
    required this.difficulty,
    required this.ingredients,
    required this.inventors,
    this.manufacturer,
  });

  // factory Elixir.fromJson(Map<String, dynamic> json) {
  //   return Elixir(
  //     id: json['id'],
  //     name: json['name'],
  //     effect: json['effect'],
  //     sideEffects: json['sideEffects'],
  //     characteristics: json['characteristics'],
  //     time: json['time'],
  //     difficulty: json['difficulty'],
  //     ingredients: (json['ingredients'] as List)
  //         .map((i) => Ingredient.fromJson(i))
  //         .toList(),
  //     inventors: (json['inventors'] as List)
  //         .map((i) => Inventor.fromJson(i))
  //         .toList(),
  //     manufacturer: json['manufacturer'],
  //   );
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'effect': effect,
  //     'sideEffects': sideEffects,
  //     'characteristics': characteristics,
  //     'time': time,
  //     'difficulty': difficulty,
  //     'ingredients': ingredients.map((i) => i.toJson()).toList(),
  //     'inventors': inventors.map((i) => i.toJson()).toList(),
  //     'manufacturer': manufacturer,
  //   };
  // }
}