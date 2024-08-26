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

    return LayoutBuilder(
      builder: (context, constraints) {
        const itemWidth = 140.0;
        final crossAxisCount = (constraints.maxWidth ~/ itemWidth).clamp(1, 5);
        final sortedElixirs = elixirs..sort((a, b) => a.name.compareTo(b.name));

        return Scaffold(
          primary: false,
          appBar: AppBar(
            title: const Text('Elixirs'),
            toolbarHeight: kToolbarHeight * 2,
          ),
          body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2,
            ),
            itemCount: sortedElixirs.length,
            itemBuilder: (context, index) {
              return ElixirCard(elixirName: sortedElixirs[index].name);
            },
          ),
        );
      },
    );
  }
}
