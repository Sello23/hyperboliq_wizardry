import 'package:flutter/material.dart';
import 'package:hyperboliq/shared/models/spell.dart';
import 'package:hyperboliq/shared/providers/spells_provider.dart';

import '../../shared/widgets/image_tile.dart';

class SpellsScreen extends StatelessWidget {
  const SpellsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SpellsProvider spellsProvider = SpellsProvider();
    List<Spell> spells = spellsProvider.spells;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          primary: false,
          appBar: AppBar(
            title: const Text('Spells'),
            toolbarHeight: kToolbarHeight * 2,
          ),
          body: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(15),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (constraints.maxWidth ~/ 175).toInt(),
                    childAspectRatio: 0.70,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: spells.length,
                  itemBuilder: (context, index) {
                    final spell = spells[index];
                    return GestureDetector(
                        child: ImageTile(
                          image: spell.spellImage.image,
                          title: spell.name,
                          subtitle: spell.effect,
                        ),
                        onTap: () {});
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
