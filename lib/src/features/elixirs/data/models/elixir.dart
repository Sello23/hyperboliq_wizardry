import 'package:equatable/equatable.dart';
import 'ingredient.dart'; // Ensure this is the correct path to the Ingredient class
import 'inventor.dart'; // Ensure this is the correct path to the Inventor class

class Elixir extends Equatable {
  final String id;
  final String name;
  final String? effect;
  final String? sideEffects;
  final String? characteristics;
  final String? time;
  final String difficulty;
  final List<Ingredient> ingredients;
  final List<Inventor> inventors;
  final String? manufacturer;

  const Elixir({
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

  // Manually implemented fromJson factory constructor
  factory Elixir.fromJson(Map<String, dynamic> json) {
    return Elixir(
      id: json['id'] as String,
      name: json['name'] as String,
      effect: json['effect'] as String?,
      sideEffects: json['sideEffects'] as String?,
      characteristics: json['characteristics'] as String?,
      time: json['time'] as String?,
      difficulty: json['difficulty'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      inventors: (json['inventors'] as List<dynamic>)
          .map((e) => Inventor.fromJson(e as Map<String, dynamic>))
          .toList(),
      manufacturer: json['manufacturer'] as String?,
    );
  }

  // Manually implemented toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'effect': effect,
      'sideEffects': sideEffects,
      'characteristics': characteristics,
      'time': time,
      'difficulty': difficulty,
      'ingredients': ingredients.map((e) => e.toJson()).toList(),
      'inventors': inventors.map((e) => e.toJson()).toList(),
      'manufacturer': manufacturer,
    };
  }

  @override
  List<Object?> get props => [
    id,
    name,
    effect,
    sideEffects,
    characteristics,
    time,
    difficulty,
    ingredients,
    inventors,
    manufacturer,
  ];
}