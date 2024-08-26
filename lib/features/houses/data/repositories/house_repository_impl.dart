

import '../../domain/repositories/house_repository.dart';
import '../models/house.dart';
import '../sources/house_remote_data_source.dart';

class HouseRepositoryImpl implements HouseRepository {
  final HouseRemoteDataSource remoteDataSource;

  HouseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<House>> getHouses() async {
    try {
      final houses = await remoteDataSource.fetchHouses();
      return houses;
    } catch (e) {
      // Here you can handle exceptions like logging, etc.
      throw Exception('Failed to load houses');
    }
  }
}