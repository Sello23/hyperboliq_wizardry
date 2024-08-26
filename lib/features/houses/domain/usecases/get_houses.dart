import 'package:hyperboliq/features/houses/domain/repositories/house_repository.dart';

import '../../data/models/house.dart';

class GetHouses {
  final HouseRepository repository;

  GetHouses(this.repository);

  Future<List<House>> call() async {
    return await repository.getHouses();
  }
}