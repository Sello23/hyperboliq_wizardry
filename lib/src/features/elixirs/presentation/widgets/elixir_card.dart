import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperboliq/src/shared/extensions.dart';

import '../../data/models/elixir.dart';

class ElixirCard extends StatelessWidget {
  final Elixir elixir;

  const ElixirCard({super.key, required this.elixir});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).go('/elixirs/${elixir.id}'),
      child: Card(
        child: Center(
          child: Text(
            elixir.name,
            style: context.textSmall,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
