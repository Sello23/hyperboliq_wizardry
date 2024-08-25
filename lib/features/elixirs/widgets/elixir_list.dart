import 'package:flutter/material.dart';
import 'package:hyperboliq/shared/models/elixir/elixir.dart';
import '../../../shared/extensions.dart';

class ElixirList extends StatelessWidget {
  const ElixirList({
    super.key,
    required this.elixir,
  });

  final Elixir elixir;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          buildTile(context, elixir)
        ],
      )
    );
  }

  Widget buildTile(BuildContext context, Elixir elixir) {
    return ListTile(
      title: Text(
        elixir.name,
        maxLines: 2,
        style: context.labelLarge,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
        child: Text('Effects: ${elixir.effect}', style: context.labelMedium),
      ),
      // onTap: () => GoRouter.of(context).go('/elixirs/${elixir.id}'),
    );
  }
}
