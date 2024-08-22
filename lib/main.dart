import 'package:flutter/material.dart';
import 'package:hyperboliq/widgets/search_text_bar.dart';
import 'models/spell_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SpellSearchScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class SpellSearchScreen extends StatefulWidget {
  const SpellSearchScreen({super.key});

  @override
  SpellSearchState createState() => SpellSearchState();
}

class SpellSearchState extends State<SpellSearchScreen> {
  final List<Spell> _spells = [];
  List<Spell> _searchResults = [];

  Future<List<Spell>> _fetchSpells(String query) async {
    final response = await http.get(Uri.parse('https://wizard-world-api.herokuapp.com/Spells?name=$query'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((spellJson) => Spell.fromJson(spellJson)).toList();
    } else {
      throw Exception('Failed to load spells');
    }
  }

  void _onSearchQueryChanged(String query) async {
    if (query.isNotEmpty) {
      final results = await _fetchSpells(query);
      setState(() {
        _searchResults = results;
      });
    } else {
      setState(() {
        _searchResults.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spells Search'),
      ),
      body: Column(
        children: [
          SearchTextBar(
            onQueryChanged: _onSearchQueryChanged,
            onSelected: (Spell? spell) {
              if (spell != null) {
                setState(() {
                  _spells.add(spell);
                  _searchResults.clear();
                });
              }
            },
            searchResults: _searchResults,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _spells.length,
              itemBuilder: (context, index) {
                final spell = _spells[index];
                return ListTile(
                  title: Text(spell.name),
                  subtitle: Text(spell.effect),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}