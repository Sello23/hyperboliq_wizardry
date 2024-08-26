import 'package:flutter/material.dart';
import 'package:hyperboliq/shared/extensions.dart';

class ElixirCard extends StatelessWidget {
  final String elixirName;

  const ElixirCard({super.key, required this.elixirName});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(
          elixirName,
          style: context.textSmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
