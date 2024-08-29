import 'package:flutter_test/flutter_test.dart';
import 'package:hyperboliq/src/features/houses/domain/repository/houses_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hyperboliq/src/shared/wizard_world_api_client.dart';
import 'package:hyperboliq/src/features/houses/data/models/house.dart';

class MockWizardWorldApiClient extends Mock implements WizardWorldApiClient {}

void main() {
  late HousesRepository housesRepository;
  late MockWizardWorldApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockWizardWorldApiClient();
    housesRepository = HousesRepository(housesApiClient: mockApiClient);
  });

  group('getHouses', () {
    final houseList = [
      const House(
        id: 'house1',
        name: 'Gryffindor',
        houseColours: 'Red and Gold',
        founder: 'Godric Gryffindor',
        animal: 'Lion',
        element: 'Fire',
        ghost: 'Nearly Headless Nick',
        commonRoom: 'Gryffindor Tower',
        heads: [],
        traits: [],
      ),
    ];

    test('returns a list of Houses on successful API call', () async {
      when(() => mockApiClient.fetchHouses()).thenAnswer(
            (_) async => houseList,
      );

      final result = await housesRepository.getHouses();

      expect(result, houseList);
      verify(() => mockApiClient.fetchHouses()).called(1);
    });

    test('throws an exception when API call fails', () async {
      when(() => mockApiClient.fetchHouses()).thenThrow(Exception('API error'));

      expect(() => housesRepository.getHouses(), throwsException);
    });
  });

  group('getHouse', () {
    const house = House(
      id: 'house1',
      name: 'Gryffindor',
      houseColours: 'Red and Gold',
      founder: 'Godric Gryffindor',
      animal: 'Lion',
      element: 'Fire',
      ghost: 'Nearly Headless Nick',
      commonRoom: 'Gryffindor Tower',
      heads: [],
      traits: [],
    );

    test('returns a House on successful API call', () async {
      when(() => mockApiClient.fetchHouseById(any())).thenAnswer(
            (_) async => house,
      );

      final result = await housesRepository.getHouse('house1');

      expect(result, house);
      verify(() => mockApiClient.fetchHouseById('house1')).called(1);
    });

    test('throws an exception when API call fails', () async {
      when(() => mockApiClient.fetchHouseById(any())).thenThrow(Exception('API error'));

      expect(() => housesRepository.getHouse('house1'), throwsException);
    });
  });
}