import '../../../../shared/wizard_world_api_client.dart';
import '../../data/models/spell.dart';

class SpellsRepository {
  SpellsRepository({WizardWorldApiClient? spellsApiClient})
      : _spellsApiClient = spellsApiClient ?? WizardWorldApiClient();

  final WizardWorldApiClient _spellsApiClient;

  Future<List<Spell>> spellsSearch(String query) async {
    return await _spellsApiClient.spellsSearch(query);
  }

  Future<Spell> getSpell(String id) async {
    return await _spellsApiClient.fetchSpellById(id);
  }
}