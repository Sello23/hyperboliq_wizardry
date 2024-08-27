import 'package:flutter_test/flutter_test.dart';
import 'package:hyperboliq/src/features/spells/domain/repository/spells_repository.dart';
import 'package:hyperboliq/src/shared/models/my_image.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hyperboliq/src/shared/wizard_world_api_client.dart';
import 'package:hyperboliq/src/features/spells/data/models/spell.dart';

class MockWizardWorldApiClient extends Mock implements WizardWorldApiClient {}

void main() {
  late SpellsRepository spellsRepository;
  late MockWizardWorldApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockWizardWorldApiClient();
    spellsRepository = SpellsRepository(spellsApiClient: mockApiClient);
  });

  group('spellsSearch', () {
    const query = 'Op';
    final spellList = [
      Spell(
        id: 'spell1',
        name: 'Expelliarmus',
        incantation: 'Expelliarmus',
        effect: 'Disarms your opponent',
        canBeVerbal: true,
        type: 'Charm',
        light: 'Red',
        creator: 'Unknown',
        spellImage: const MyImage(image: 'expelliarmus.png', sourceName: 'Wizarding World'),
      ),
    ];

    test('returns a list of Spells on successful API call', () async {
      when(() => mockApiClient.spellsSearch(any())).thenAnswer(
            (_) async => spellList,
      );

      final result = await spellsRepository.spellsSearch(query);

      expect(result, spellList);
      verify(() => mockApiClient.spellsSearch(query)).called(1);
    });

    test('throws an exception when API call fails', () async {
      when(() => mockApiClient.spellsSearch(any())).thenThrow(Exception('API error'));

      expect(() => spellsRepository.spellsSearch(query), throwsException);
    });
  });

  group('getSpell', () {
    final spell = Spell(
      id: 'spell1',
      name: 'Expelliarmus',
      incantation: 'Expelliarmus',
      effect: 'Disarms your opponent',
      canBeVerbal: true,
      type: 'Charm',
      light: 'Red',
      creator: 'Unknown',
      spellImage: const MyImage(image: 'expelliarmus.png', sourceName: 'Wizarding World'),
    );

    test('returns a Spell on successful API call', () async {
      when(() => mockApiClient.fetchSpellById(any())).thenAnswer(
            (_) async => spell,
      );

      final result = await spellsRepository.getSpell('spell1');

      expect(result, spell);
      verify(() => mockApiClient.fetchSpellById('spell1')).called(1);
    });

    test('throws an exception when API call fails', () async {
      when(() => mockApiClient.fetchSpellById(any())).thenThrow(Exception('API error'));

      expect(() => spellsRepository.getSpell('spell1'), throwsException);
    });
  });
}