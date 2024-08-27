import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/house.dart';

class HouseRemoteDataSource {
  final http.Client client;

  HouseRemoteDataSource(this.client);

  Future<List<House>> fetchHouses() async {
    final response = await client
        .get(Uri.parse('https://wizard-world-api.herokuapp.com/Houses'));

    if (response.statusCode == 200) {
      final List<dynamic> houseList = json.decode(response.body);
      return houseList.map((json) => House.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load houses');
    }
  }

  Future<House> fetchHouseDetails(String id) async {
    final response = await client
        .get(Uri.parse('https://wizard-world-api.herokuapp.com/Houses/$id'));

    if (response.statusCode == 200) {
      return House.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load house details');
    }
  }
}
