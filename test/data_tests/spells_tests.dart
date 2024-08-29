import 'package:flutter_test/flutter_test.dart';
import 'package:hyperboliq/src/features/spells/data/models/spell.dart';

void main() {
  group('Spell', () {
    group('fromJson', () {
      test('returns correct Spell object', () {
        expect(
          Spell.fromJson(
            <String, dynamic>{
              'id': 'spell1',
              'name': 'Expelliarmus',
              'incantation': 'Expelliarmus',
              'effect': 'Disarms your opponent',
              'canBeVerbal': true,
              'type': 'Charm',
              'light': 'Red',
              'creator': 'Unknown',
            },
          ),
          isA<Spell>()
              .having((s) => s.id, 'id', 'spell1')
              .having((s) => s.name, 'name', 'Expelliarmus')
              .having((s) => s.incantation, 'incantation', 'Expelliarmus')
              .having((s) => s.effect, 'effect', 'Disarms your opponent')
              .having((s) => s.canBeVerbal, 'canBeVerbal', true)
              .having((s) => s.type, 'type', 'Charm')
              .having((s) => s.light, 'light', 'Red')
              .having((s) => s.creator, 'creator', 'Unknown')
        );
      });
    });
  });
}