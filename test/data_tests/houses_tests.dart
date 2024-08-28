import 'package:flutter_test/flutter_test.dart';
import 'package:hyperboliq/src/features/houses/data/models/house.dart';

void main() {
  group('House', () {
    group('fromJson', () {
      test('returns correct House object', () {
        expect(
          House.fromJson(
            const <String, dynamic>{
              'id': 'house1',
              'name': 'Gryffindor',
              'houseColours': 'Red and Gold',
              'founder': 'Godric Gryffindor',
              'animal': 'Lion',
              'element': 'Fire',
              'ghost': 'Nearly Headless Nick',
              'commonRoom': 'Gryffindor Tower',
              'heads': [
                <String, dynamic>{
                  'id': 'head1',
                  'firstName': 'Minerva',
                  'lastName': 'McGonagall',
                },
              ],
              'traits': [
                <String, dynamic>{
                  'id': 'trait1',
                  'name': 'Bravery',
                },
              ],
            },
          ),
          isA<House>()
              .having((h) => h.id, 'id', 'house1')
              .having((h) => h.name, 'name', 'Gryffindor')
              .having((h) => h.houseColours, 'houseColours', 'Red and Gold')
              .having((h) => h.founder, 'founder', 'Godric Gryffindor')
              .having((h) => h.animal, 'animal', 'Lion')
              .having((h) => h.element, 'element', 'Fire')
              .having((h) => h.ghost, 'ghost', 'Nearly Headless Nick')
              .having((h) => h.commonRoom, 'commonRoom', 'Gryffindor Tower')
              .having((h) => h.heads.length, 'heads length', 1)
              .having((h) => h.heads[0].id, 'first head id', 'head1')
              .having((h) => h.heads[0].firstName, 'first head firstName', 'Minerva')
              .having((h) => h.heads[0].lastName, 'first head lastName', 'McGonagall')
              .having((h) => h.traits.length, 'traits length', 1)
              .having((h) => h.traits[0].id, 'first trait id', 'trait1')
              .having((h) => h.traits[0].name, 'first trait name', 'Bravery')
        );
      });
    });
  });
}