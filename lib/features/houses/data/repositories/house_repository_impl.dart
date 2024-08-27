

import '../../domain/repositories/house_repository.dart';
import '../models/house.dart';
import '../sources/house_remote_data_source.dart';

class HouseRepositoryImpl implements HouseRepository {
  final HouseRemoteDataSource remoteDataSource;

  HouseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<House>> getHouses() async {
    return await remoteDataSource.fetchHouses();
  }

  @override
  Future<House> getHouseDetails(String id) async {
    return await remoteDataSource.fetchHouseDetails(id);
  }
}