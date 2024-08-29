import 'package:flutter/material.dart';
import '../../../../shared/utils.dart';
import '../../data/models/elixir.dart';
import 'elixir_card.dart';

class ElixirsScreenLayout extends StatelessWidget {
  const ElixirsScreenLayout({
    super.key,
    required this.elixirs,
  });

  final List<Elixir> elixirs;

  @override
  Widget build(BuildContext context) {
    Map<String, List<Elixir>> groupedElixirs = Utils.groupElixirsByFirstLetter(elixirs);
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
                        elixir: elixirsForLetter[index],
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
}
