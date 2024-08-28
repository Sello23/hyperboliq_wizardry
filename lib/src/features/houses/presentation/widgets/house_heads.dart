import 'package:flutter/material.dart';

import '../../data/models/head.dart';
import '../../data/models/house.dart';
import '../../../../shared/widgets/adaptive_table.dart';

class HouseHeads extends StatelessWidget {
  const HouseHeads({super.key, required this.heads});

  final List<Head> heads;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTable<Head>(
      items: heads,
      breakpoint: 200,
      itemBuilder: (head, index) {
        return const ListTile(
          title: Text('Heads'),
        );
      },
      columns: const [
        DataColumn(
          label: Text(
            'First Name',
          ),
        ),
        DataColumn(
          label: Text(
            'Last Name',
          ),
        ),
      ],
      rowBuilder: (head, index) => DataRow.byIndex(index: index, cells: [
        DataCell(Text(head.firstName)),
        DataCell(Text(head.lastName)),
      ]),
    );
  }
}
