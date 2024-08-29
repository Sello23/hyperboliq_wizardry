import 'package:hyperboliq/src/features/houses/data/models/house.dart';

import '../../../../shared/wizard_world_api_client.dart';

class HousesRepository {
  HousesRepository({WizardWorldApiClient? housesApiClient})
      : _housesApiClient = housesApiClient ?? WizardWorldApiClient();

  final WizardWorldApiClient _housesApiClient;

  Future<List<House>> getHouses() async {
    return await _housesApiClient.fetchHouses();
  }

  Future<House> getHouse(String id) async {
    return await _housesApiClient.fetchHouseById(id);
  }
}