import 'package:flutter/material.dart';
import 'package:hyperboliq/shared/models/house/trait.dart';

import '../../../../shared/models/house/house.dart';
import '../../../../shared/widgets/adaptive_table.dart';

class HouseTraits extends StatelessWidget {
  const HouseTraits({super.key, required this.house});

  final House house;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTable<Trait>(
      items: house.traits,
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
