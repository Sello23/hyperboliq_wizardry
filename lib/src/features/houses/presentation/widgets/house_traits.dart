import 'package:flutter/material.dart';

import '../../../../shared/widgets/adaptive_table.dart';
import '../../data/models/trait.dart';

class HouseTraits extends StatelessWidget {
  const HouseTraits({super.key, required this.traits});

  final List<Trait> traits;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTable<Trait>(
      items: traits,
      breakpoint: 200,
      itemBuilder: (head, index) {
        return const ListTile(
          title: Text('Traits'),
        );
      },
      columns: const [
        DataColumn(
          label: Text(
            'Trait name',
          ),
        ),
      ],
      rowBuilder: (trait, index) => DataRow.byIndex(index: index, cells: [
        DataCell(Text(trait.name)),
      ]),
    );
  }
}
