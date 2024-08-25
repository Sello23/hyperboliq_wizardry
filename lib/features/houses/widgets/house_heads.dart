import 'package:flutter/material.dart';
import '../../../shared/models/house/head.dart';
import '../../../shared/models/house/house.dart';
import '../../../shared/widgets/widget_exports.dart';

class HouseHeads extends StatelessWidget {
  const HouseHeads({super.key, required this.house});

  final House house;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTable<Head>(
      items: house.heads,
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
