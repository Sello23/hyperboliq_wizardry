import 'package:flutter/material.dart';
import 'package:hyperboliq/models/spell_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchTextBar extends StatelessWidget {
  final ValueChanged<Spell?> onSelected;

  const SearchTextBar({super.key, required this.onSelected});

  Future<List<Spell>> _fetchSpells(String query) async {
    final response = await http.get(Uri.parse('https://wizard-world-api.herokuapp.com/Spells?name=$query'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((json) => Spell.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Autocomplete<Spell>(
        optionsBuilder: (TextEditingValue textEditingValue) async {
          if (textEditingValue.text.isEmpty) {
            return const Iterable<Spell>.empty();
          }
          return await _fetchSpells(textEditingValue.text);
        },
        displayStringForOption: (Spell option) => option.name,
        onSelected: (Spell selection) {
          onSelected(selection);
        },
        fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
          return TextField(
            controller: textEditingController,
            focusNode: focusNode,
            decoration: InputDecoration(
              labelText: 'Search Spells',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  textEditingController.clear();
                  onSelected(null); // Clear selection
                },
              ),
            ),
          );
        },
        optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<Spell> onSelected, Iterable<Spell> options) {
          return Align(
            alignment: Alignment.topLeft,
            child: Material(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Spell option = options.elementAt(index);
                    return ListTile(
                      title: Text(option.name),
                      subtitle: Text(option.effect),
                      onTap: () {
                        onSelected(option);
                      },
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}