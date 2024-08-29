import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/image_tile.dart';
import '../../data/models/spell.dart';

class SpellScreenLayout extends StatelessWidget {
  const SpellScreenLayout({
    super.key,
    required this.spells
  });

  final List<Spell> spells;

  @override
  Widget build(BuildContext context) {
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
                          image: spell.spellImage!.image,
                          title: spell.name,
                          subtitle: spell.effect,
                        ),
                        onTap: (){
                          final spellJson = jsonEncode(spell.toJson());
                          GoRouter.of(context).go('/spells/${spell.id}?data=$spellJson');
                        }
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