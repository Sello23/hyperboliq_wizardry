import '../features/elixirs/data/models/elixir.dart';

class Utils {
  // Static method to group elixirs by the first letter of their name
  static Map<String, List<Elixir>> groupElixirsByFirstLetter(List<Elixir> elixirs) {
    return elixirs.fold<Map<String, List<Elixir>>>(
      {},
          (Map<String, List<Elixir>> groupedElixirs, Elixir elixir) {
        String firstLetter = elixir.name[0].toUpperCase();
        if (!groupedElixirs.containsKey(firstLetter)) {
          groupedElixirs[firstLetter] = [];
        }
        groupedElixirs[firstLetter]!.add(elixir);
        return groupedElixirs;
      },
    );
  }
}