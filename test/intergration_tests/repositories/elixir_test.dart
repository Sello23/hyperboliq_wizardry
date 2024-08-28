import 'package:flutter_test/flutter_test.dart';
import 'package:hyperboliq/src/features/elixirs/data/models/elixir.dart';
import 'package:hyperboliq/src/features/elixirs/domain/repository/elixir_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hyperboliq/src/shared/wizard_world_api_client.dart';

class MockWizardWorldApiClient extends Mock implements WizardWorldApiClient {}

void main() {
  late ElixirRepository elixirRepository;
  late MockWizardWorldApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockWizardWorldApiClient();
    elixirRepository = ElixirRepository(elixirApiClient: mockApiClient);
  });

  //Elixirs
  group('getElixirs', () {
    final elixirList = [
      const Elixir(
        id: 'elixir1',
        name: 'Elixir of Life',
        effect: 'Grants immortality',
        sideEffects: 'None known',
        characteristics: 'Bright red color',
        time: '24 hours',
        difficulty: 'Advanced',
        ingredients: [],
        inventors: [],
        manufacturer: 'Flamel Inc.',
      ),
    ];

    test('returns a list of Elixirs on successful API call', () async {
      when(() => mockApiClient.getElixirs()).thenAnswer(
            (_) async => elixirList,
      );

      final result = await elixirRepository.getElixirs();

      expect(result, elixirList);
      verify(() => mockApiClient.getElixirs()).called(1);
    });

    test('throws an exception when API call fails', () async {
      when(() => mockApiClient.getElixirs()).thenThrow(Exception('API error'));

      expect(() => elixirRepository.getElixirs(), throwsException);
    });
  });

  group('getElixir', () {
    const elixir = Elixir(
      id: 'elixir1',
      name: 'Elixir of Life',
      effect: 'Grants immortality',
      sideEffects: 'None known',
      characteristics: 'Bright red color',
      time: '24 hours',
      difficulty: 'Advanced',
      ingredients: [],
      inventors: [],
      manufacturer: 'Flamel Inc.',
    );

    test('returns an Elixir on successful API call', () async {
      when(() => mockApiClient.fetchElixirById(any())).thenAnswer(
            (_) async => elixir,
      );

      final result = await elixirRepository.getElixir('elixir1');

      expect(result, elixir);
      verify(() => mockApiClient.fetchElixirById('elixir1')).called(1);
    });

    test('throws an exception when API call fails', () async {
      when(() => mockApiClient.fetchElixirById(any())).thenThrow(Exception('API error'));

      expect(() => elixirRepository.getElixir('elixir1'), throwsException);
    });
  });
}