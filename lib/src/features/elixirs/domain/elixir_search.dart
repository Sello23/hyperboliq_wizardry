// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:hyperboliq/src/shared/app_strings.dart';
// import '../data/models/elixir.dart';
//
// class ElixirRequestFailure implements Exception {}
//
// class ElixirNotFoundFailure implements Exception {}
//
// /// Fetches a list of [Elixir] objects from the `/Elixirs` endpoint.
// Future<List<Elixir>> fetchElixirs() async {
//   final elixirRequest = Uri.https(
//     AppStrings.baseUrl,
//     '/Elixirs',
//   );
//
//   final elixirResponse = await http.get(elixirRequest);
//   if (elixirResponse.statusCode != 200) {
//     throw ElixirRequestFailure();
//   }
//
//   final elixirJson = jsonDecode(elixirResponse.body) as List<dynamic>;
//   if (elixirJson.isEmpty) throw ElixirNotFoundFailure();
//
//   return elixirJson
//       .map((json) => Elixir.fromJson(json as Map<String, dynamic>))
//       .toList();
// }
//
// Future<Elixir> fetchElixirById(String id) async {
//   final elixirRequest = Uri.https(
//     AppStrings.baseUrl,
//     '/Elixirs/$id',
//   );
//
//   final elixirResponse = await http.get(elixirRequest);
//
//   if (elixirResponse.statusCode != 200) {
//     throw ElixirRequestFailure();
//   }
//
//   final elixirJson = jsonDecode(elixirResponse.body) as Map<String, dynamic>;
//
//   if (elixirJson.isEmpty) throw ElixirNotFoundFailure();
//
//   return Elixir.fromJson(elixirJson);
// }
