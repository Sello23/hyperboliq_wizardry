import 'package:flutter/material.dart';
import 'package:hyperboliq/shared/models/elixir/elixir.dart';
import 'package:hyperboliq/shared/providers/elixirs_provider.dart';

import 'elixir_list.dart';

class ElixirsScreen extends StatelessWidget {
  const ElixirsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ElixirsProvider elixirsProvider = ElixirsProvider();
    List<Elixir> elixirs = elixirsProvider.elixirs;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          primary: false,
          appBar: AppBar(
            title: const Text('Elixirs'),
            toolbarHeight: kToolbarHeight * 2,
          ),
          body: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(1),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (constraints.maxWidth ~/ 160).toInt(),
                    childAspectRatio: 0.70,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                  ),
                  itemCount: elixirs.length,
                  itemBuilder: (context, index) {
                    final elixir = elixirs[index];
                    return ElixirList(
                      elixir: elixir,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}