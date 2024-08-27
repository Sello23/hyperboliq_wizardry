import 'package:hyperboliq/features/houses/domain/repositories/house_repository.dart';

import '../../data/models/house.dart';

class GetHouseDetails {
  final HouseRepository repository;

  GetHouseDetails(this.repository);

  Future<House> call(String id) async {
    return await repository.getHouseDetails(id);
  }
}