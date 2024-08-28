import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hyperboliq/src/shared/app_strings.dart';

import '../features/elixirs/data/models/elixir.dart';
import '../features/houses/data/models/house.dart';
import '../features/spells/data/models/spell.dart';

//Elixirs
class ElixirRequestFailure implements Exception {}

class ElixirNotFoundFailure implements Exception {}

//Houses
class HouseRequestFailure implements Exception {}

class HouseNotFoundFailure implements Exception {}

//Spells
class SpellRequestFailure implements Exception {}

class SpellNotFoundFailure implements Exception {}

class WizardWorldApiClient {
  WizardWorldApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  /// Finds a [Spell] `/Spells?Name=(query)`.
  Future<List<Spell>> getSpells() async {
    final spellRequest = Uri.https(
      AppStrings.baseUrl,
      '/Spells',
    );

    final spellResponse = await _httpClient.get(spellRequest);

    if (spellResponse.statusCode != 200) {
      throw SpellRequestFailure();
    }

    final spellJson = jsonDecode(spellResponse.body) as List<dynamic>;

    if (spellJson.isEmpty) throw SpellNotFoundFailure();

    return spellJson
        .map((json) => Spell.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// Finds a [Spell] `/Spells?Name=(query)`.
  Future<List<Spell>> searchSpells(String query) async {
    final spellRequest = Uri.https(
      AppStrings.baseUrl,
      '/Spells',
      {'Name': query},
    );

    final spellResponse = await _httpClient.get(spellRequest);

    if (spellResponse.statusCode != 200) {
      throw SpellRequestFailure();
    }

    final spellJson = jsonDecode(spellResponse.body) as List<dynamic>;

    if (spellJson.isEmpty) throw SpellNotFoundFailure();

    return spellJson
        .map((json) => Spell.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// Fetches a [Spell] by its ID from the `/Spells/{id}` endpoint.
  Future<Spell> fetchSpellById(String id) async {
    final spellRequest = Uri.https(
      AppStrings.baseUrl,
      '/Spells/$id',
    );

    final spellResponse = await _httpClient.get(spellRequest);

    if (spellResponse.statusCode != 200) {
      throw SpellRequestFailure();
    }

    final spellJson = jsonDecode(spellResponse.body) as Map<String, dynamic>;

    if (spellJson.isEmpty) throw SpellNotFoundFailure();

    return Spell.fromJson(spellJson);
  }

  /// Fetches a list of [House] objects from the `/Houses` endpoint.
  Future<List<House>> fetchHouses() async {
    final houseRequest = Uri.https(
      AppStrings.baseUrl,
      '/Houses',
    );

    final houseResponse = await _httpClient.get(houseRequest);

    if (houseResponse.statusCode != 200) {
      throw HouseRequestFailure();
    }
    final houseJson = jsonDecode(houseResponse.body) as List<dynamic>;

    if (houseJson.isEmpty) throw HouseNotFoundFailure();
    return houseJson
        .map((json) => House.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// Fetches a [House] by its ID from the `/Houses/{id}` endpoint.
  Future<House> fetchHouseById(String id) async {
    final houseRequest = Uri.https(
      AppStrings.baseUrl,
      '/Houses/$id',
    );

    final houseResponse = await _httpClient.get(houseRequest);
    if (houseResponse.statusCode != 200) {
      throw HouseRequestFailure();
    }

    final houseJson = jsonDecode(houseResponse.body) as Map<String, dynamic>;
    if (houseJson.isEmpty) throw HouseNotFoundFailure();
    return House.fromJson(houseJson);
  }

  /// Fetches a list of [Elixir] objects from the `/Elixirs` endpoint.
  Future<List<Elixir>> getElixirs() async {
    final elixirRequest = Uri.https(
      AppStrings.baseUrl,
      '/Elixirs',
    );

    final elixirResponse = await _httpClient.get(elixirRequest);
    if (elixirResponse.statusCode != 200) {
      throw ElixirRequestFailure();
    }

    final elixirJson = jsonDecode(elixirResponse.body) as List<dynamic>;
    if (elixirJson.isEmpty) throw ElixirNotFoundFailure();

    return elixirJson
        .map((json) => Elixir.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<Elixir> fetchElixirById(String id) async {
    final elixirRequest = Uri.https(
      AppStrings.baseUrl,
      '/Elixirs/$id',
    );

    final elixirResponse = await _httpClient.get(elixirRequest);

    if (elixirResponse.statusCode != 200) {
      throw ElixirRequestFailure();
    }

    final elixirJson = jsonDecode(elixirResponse.body) as Map<String, dynamic>;

    if (elixirJson.isEmpty) throw ElixirNotFoundFailure();

    return Elixir.fromJson(elixirJson);
  }

}


