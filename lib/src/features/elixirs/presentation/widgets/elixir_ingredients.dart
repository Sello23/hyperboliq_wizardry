import 'package:flutter/material.dart';
import '../../../../shared/widgets/adaptive_table.dart';
import '../../data/models/ingredient.dart';

class ElixirIngredients extends StatelessWidget {
  const ElixirIngredients({super.key, required this.ingredients});

  final List<Ingredient> ingredients;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTable<Ingredient>(
      items: ingredients,
      breakpoint: 200,
      itemBuilder: (head, index) {
        return const ListTile(
          title: Text('Ingredients'),
        );
      },
      columns: const [
        DataColumn(
          label: Text(
            'Ingredient',
          ),
        ),
      ],
      rowBuilder: (ingredient, index) => DataRow.byIndex(index: index, cells: [
        DataCell(Text(ingredient.name)),
      ]),
    );
  }
}
