import 'package:flutter/material.dart';

class ElixirCard extends StatelessWidget {
  final String elixirName;

  const ElixirCard({super.key, required this.elixirName});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(elixirName,
                style: const TextStyle(fontWeight: FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}
