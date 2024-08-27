import 'package:flutter_test/flutter_test.dart';
import 'package:hyperboliq/src/features/elixirs/data/models/elixir.dart';

void main() {
  group('Elixir', () {
    group('fromJson', () {
      test('returns correct Elixir object', () {
        expect(
          Elixir.fromJson(
            <String, dynamic>{
              'id': 'elixir1',
              'name': 'Elixir of Life',
              'effect': 'Grants immortality',
              'sideEffects': 'None known',
              'characteristics': 'Bright red color',
              'time': '24 hours',
              'difficulty': 'Advanced',
              'ingredients': [
                <String, dynamic>{
                  'id': 'ingredient1',
                  'name': 'Philosopher\'s Stone',
                },
                <String, dynamic>{
                  'id': 'ingredient2',
                  'name': 'Unicorn Blood',
                },
              ],
              'inventors': [
                <String, dynamic>{
                  'id': 'inventor1',
                  'firstName': 'Nicolas',
                  'lastName': 'Flamel',
                },
                <String, dynamic>{
                  'id': 'inventor2',
                  'firstName': 'Perenelle',
                  'lastName': 'Flamel',
                },
              ],
              'manufacturer': 'Flamel Inc.',
            },
          ),
          isA<Elixir>()
              .having((e) => e.id, 'id', 'elixir1')
              .having((e) => e.name, 'name', 'Elixir of Life')
              .having((e) => e.effect, 'effect', 'Grants immortality')
              .having((e) => e.sideEffects, 'sideEffects', 'None known')
              .having((e) => e.characteristics, 'characteristics', 'Bright red color')
              .having((e) => e.time, 'time', '24 hours')
              .having((e) => e.difficulty, 'difficulty', 'Advanced')
              .having((e) => e.ingredients.length, 'ingredients length', 2)
              .having((e) => e.ingredients[0].id, 'first ingredient id', 'ingredient1')
              .having((e) => e.ingredients[0].name, 'first ingredient name', 'Philosopher\'s Stone')
              .having((e) => e.ingredients[1].id, 'second ingredient id', 'ingredient2')
              .having((e) => e.ingredients[1].name, 'second ingredient name', 'Unicorn Blood')
              .having((e) => e.inventors.length, 'inventors length', 2)
              .having((e) => e.inventors[0].id, 'first inventor id', 'inventor1')
              .having((e) => e.inventors[0].firstName, 'first inventor firstName', 'Nicolas')
              .having((e) => e.inventors[0].lastName, 'first inventor lastName', 'Flamel')
              .having((e) => e.inventors[1].id, 'second inventor id', 'inventor2')
              .having((e) => e.inventors[1].firstName, 'second inventor firstName', 'Perenelle')
              .having((e) => e.inventors[1].lastName, 'second inventor lastName', 'Flamel')
              .having((e) => e.manufacturer, 'manufacturer', 'Flamel Inc.'),
        );
      });
    });
  });


}