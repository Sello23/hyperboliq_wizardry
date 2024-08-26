import 'package:flutter/material.dart';
import 'package:hyperboliq/features/elixirs/widgets/elixir_card.dart';
import 'package:hyperboliq/shared/models/elixir/elixir.dart';
import 'package:hyperboliq/shared/providers/elixirs_provider.dart';

class ElixirsScreen extends StatelessWidget {
  const ElixirsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ElixirsProvider elixirsProvider = ElixirsProvider();
    List<Elixir> elixirs = elixirsProvider.elixirs;

    Map<String, List<Elixir>> groupedElixirs =
        groupElixirsByFirstLetter(elixirs);
    // Sort the groups alphabetically
    List<String> sortedKeys = groupedElixirs.keys.toList()..sort();

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          primary: false,
          appBar: AppBar(
            title: const Text('Elixirs'),
            toolbarHeight: kToolbarHeight * 2,
          ),
          body: ListView.builder(
            itemCount: sortedKeys.length,
            itemBuilder: (context, index) {
              String letter = sortedKeys[index];
              List<Elixir> elixirsForLetter = groupedElixirs[letter]!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Alphabet letter section header
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      letter,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Elixirs list under the alphabet
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width ~/ 140,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2,
                    ),
                    itemCount: elixirsForLetter.length,
                    itemBuilder: (context, index) {
                      return ElixirCard(
                        elixirName: elixirsForLetter[index].name,
                      );
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  // Function to group elixirs by the first letter of their name
  Map<String, List<Elixir>> groupElixirsByFirstLetter(List<Elixir> elixirs) {
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
