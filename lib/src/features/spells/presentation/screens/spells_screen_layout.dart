import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperboliq/src/features/elixirs/presentation/screens/elixir_screen.dart';
import 'package:hyperboliq/src/shared/extensions.dart';

import '../../../../shared/app_strings.dart';
import '../../../../shared/widgets/image_tile.dart';
import '../../data/models/spell.dart';
import 'package:http/http.dart' as http;

class SpellScreenLayout extends StatelessWidget {
  const SpellScreenLayout({super.key, required this.spells});

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
            actions: [
              _searchField(context),
            ],
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
                          image: spell.image,
                          title: spell.name,
                          subtitle: spell.effect,
                        ),
                        onTap: () {
                          navigateToSpellScreen(spell, context);
                        });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Flexible _searchField(BuildContext context) {
    return Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TypeAheadField<Spell>(
                  textFieldConfiguration: TextFieldConfiguration(
                    autofocus: false,
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(fontStyle: FontStyle.italic),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Search spells...',
                    ),
                  ),
                  suggestionsCallback: (pattern) async {
                    if (pattern.isEmpty) {
                      return [];
                    }
                    return await searchSpells(pattern.capitalize());
                  },
                  itemBuilder: (context, Spell suggestion) {
                    return ListTile(
                      title: Text(suggestion.name),
                      subtitle: Text(suggestion.incantation ?? ''),
                    );
                  },
                  onSuggestionSelected: (Spell suggestion) {
                    navigateToSpellScreen(suggestion, context);
                  },
                  noItemsFoundBuilder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('No spells found'),
                  ),
                ),
              ),
            );
  }

  /// Finds a [Spell] `/Spells?Name=(query)`.
  Future<List<Spell>> searchSpells(String query) async {
    final spellRequest = Uri.https(
      AppStrings.baseUrl,
      '/Spells',
      {'Name': query},
    );

    final spellResponse = await http.get(spellRequest);
    final spellJson = jsonDecode(spellResponse.body) as List<dynamic>;
    return spellJson
        .map((json) => Spell.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  void navigateToSpellScreen(Spell spell, BuildContext context) {
    final spellJson = jsonEncode(spell.toJson());
    GoRouter.of(context).go('/spells/${spell.id}?data=$spellJson');
  }
}
