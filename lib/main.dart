import 'package:flutter/material.dart';
import 'package:hyperboliq/widgets/search_text_bar.dart';
import 'models/spell_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spell Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _SpellSearchState(),
    );
  }
}

class _SpellSearchState extends StatelessWidget {
  final List<Spell> _spells = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spells Search'),
      ),
      body: Column(
        children: [
          SearchTextBar(
            onSelected: (Spell? spell) {
              _spells.clear();
              if (spell != null) {
                _spells.add(spell);
              }
              (context as Element).markNeedsBuild();
            },
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