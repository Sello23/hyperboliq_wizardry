import 'package:flutter/material.dart';
import 'package:hyperboliq/features/elixirs/data/models/inventor.dart';
import '../../../../shared/widgets/adaptive_table.dart';

class ElixirInventors extends StatelessWidget {
  const ElixirInventors({super.key, required this.inventors});

  final List<Inventor> inventors;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTable<Inventor>(
      items: inventors,
      breakpoint: 200,
      itemBuilder: (inventor, index) {
        return const ListTile(
          title: Text('Inventors'),
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
      rowBuilder: (inventor, index) => DataRow.byIndex(index: index, cells: [
        DataCell(Text(inventor.firstName ?? 'Not mentioned')),
        DataCell(Text(inventor.lastName ?? 'Not mentioned')),
      ]),
    );
  }
}
