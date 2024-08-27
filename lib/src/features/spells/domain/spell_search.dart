// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:hyperboliq/src/shared/app_strings.dart';
//
// import '../data/models/spell.dart';
//
// class SpellRequestFailure implements Exception {}
//
// class SpellNotFoundFailure implements Exception {}
//
// /// Finds a [Spell] `/Spells?Name=(query)`.
// Future<List<Spell>> spellsSearch(String query) async {
//   final spellRequest = Uri.https(
//     AppStrings.baseUrl,
//     '/Spells',
//     {'Name': query},
//   );
//
//   final spellResponse = await http.get(spellRequest);
//
//   if (spellResponse.statusCode != 200) {
//     throw SpellRequestFailure();
//   }
//
//   final spellJson = jsonDecode(spellResponse.body) as List<dynamic>;
//
//   if (spellJson.isEmpty) throw SpellNotFoundFailure();
//
//   // Map each JSON object in the list to a Spell object and return the list
//   return spellJson
//       .map((json) => Spell.fromJson(json as Map<String, dynamic>))
//       .toList();
// }
//
// /// Fetches a [Spell] by its ID from the `/Spells/{id}` endpoint.
// Future<Spell> fetchSpellById(String id) async {
//   final spellRequest = Uri.https(
//     AppStrings.baseUrl,
//     '/Spells/$id',
//   );
//
//   final spellResponse = await http.get(spellRequest);
//
//   if (spellResponse.statusCode != 200) {
//     throw SpellRequestFailure();
//   }
//
//   final spellJson = jsonDecode(spellResponse.body) as Map<String, dynamic>;
//
//   if (spellJson.isEmpty) throw SpellNotFoundFailure();
//
//   return Spell.fromJson(spellJson);
// }
