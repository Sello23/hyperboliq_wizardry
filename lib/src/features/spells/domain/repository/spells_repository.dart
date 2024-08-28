import '../../../../shared/wizard_world_api_client.dart';
import '../../data/models/spell.dart';

class SpellsRepository {
  SpellsRepository({WizardWorldApiClient? spellsApiClient})
      : _spellsApiClient = spellsApiClient ?? WizardWorldApiClient();

  final WizardWorldApiClient _spellsApiClient;

  Future<List<Spell>> searchSpells(String query) async {
    return await _spellsApiClient.searchSpells(query);
  }

  Future<List<Spell>> getSpells() async {
    return await _spellsApiClient.getSpells();
  }

  Future<Spell> getSpell(String id) async {
    return await _spellsApiClient.fetchSpellById(id);
  }
}