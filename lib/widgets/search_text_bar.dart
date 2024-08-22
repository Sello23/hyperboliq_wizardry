import 'package:flutter/material.dart';
import '../models/spell_model.dart';

class SearchTextBar extends StatelessWidget {
  final Function(String) onQueryChanged;
  final Function(Spell?) onSelected;
  final List<Spell> searchResults;

  const SearchTextBar({
    super.key,
    required this.onQueryChanged,
    required this.onSelected,
    required this.searchResults,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Autocomplete<Spell>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text.isEmpty) {
            return const Iterable<Spell>.empty();
          } else {
            onQueryChanged(textEditingValue.text);
            return searchResults;
          }
        },
        displayStringForOption: (Spell option) => option.name,
        fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
          return TextField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search for a spell',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: (value) => onQueryChanged(value),
            onTap: () {
              // When tapped, clear previous search results
              onQueryChanged('');
            },
          );
        },
        onSelected: onSelected,
        optionsViewBuilder: (context, onSelected, options) {
          return Align(
            alignment: Alignment.topLeft,
            child: Material(
              child: Container(
                width: MediaQuery.of(context).size.width - 32,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final Spell option = options.elementAt(index);
                    return ListTile(
                      title: Text(option.name),
                      subtitle: Text(option.effect),
                      onTap: () => onSelected(option),
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