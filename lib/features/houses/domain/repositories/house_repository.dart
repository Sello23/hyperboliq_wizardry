
import '../../data/models/house.dart';

abstract class HouseRepository {
  Future<List<House>> getHouses();
}