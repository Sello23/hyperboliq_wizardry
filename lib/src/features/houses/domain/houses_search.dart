// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:hyperboliq/src/shared/app_strings.dart';
//
// import '../data/models/house.dart';
//
// class HouseRequestFailure implements Exception {}
//
// class HouseNotFoundFailure implements Exception {}
//
// /// Fetches a list of [House] objects from the `/Houses` endpoint.
// Future<List<House>> fetchHouses() async {
//   final houseRequest = Uri.https(
//     AppStrings.baseUrl,
//     '/Houses',
//   );
//
//   final houseResponse = await http.get(houseRequest);
//
//   if (houseResponse.statusCode != 200) {
//     throw HouseRequestFailure();
//   }
//   final houseJson = jsonDecode(houseResponse.body) as List<dynamic>;
//
//   if (houseJson.isEmpty) throw HouseNotFoundFailure();
//   return houseJson
//       .map((json) => House.fromJson(json as Map<String, dynamic>))
//       .toList();
// }
//
// /// Fetches a [House] by its ID from the `/Houses/{id}` endpoint.
// Future<House> fetchHouseById(String id) async {
//   final houseRequest = Uri.https(
//     AppStrings.baseUrl,
//     '/Houses/$id',
//   );
//
//   final houseResponse = await http.get(houseRequest);
//   if (houseResponse.statusCode != 200) {
//     throw HouseRequestFailure();
//   }
//
//   final houseJson = jsonDecode(houseResponse.body) as Map<String, dynamic>;
//   if (houseJson.isEmpty) throw HouseNotFoundFailure();
//   return House.fromJson(houseJson);
// }
