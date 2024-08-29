import '../../../../shared/wizard_world_api_client.dart';
import '../../data/models/elixir.dart';

class ElixirsRepository {
  ElixirsRepository({WizardWorldApiClient? elixirApiClient})
      : _elixirApiClient = elixirApiClient ?? WizardWorldApiClient();

  final WizardWorldApiClient _elixirApiClient;

  Future<List<Elixir>> getElixirs() async {
    return await _elixirApiClient.getElixirs();
  }

  Future<Elixir> getElixir(String id) async {
    return await _elixirApiClient.fetchElixirById(id);
  }
}
