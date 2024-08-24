import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperboliq/features/houses/widgets/house_card.dart';
import 'package:hyperboliq/shared/extensions.dart';
import 'package:hyperboliq/shared/providers/houses.dart';
import 'package:hyperboliq/shared/widgets/house_content.dart';

import '../../../shared/models/house/house.dart';
import '../../../shared/widgets/image_clipper.dart';

class HousesScreen extends StatelessWidget {
  const HousesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final housesProvider = HousesProvider();
    final houses = housesProvider.houses;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        primary: false,
        appBar: AppBar(
          title: const Text('HOUSES'),
          toolbarHeight: kToolbarHeight * 2,
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: max(1, (constraints.maxWidth ~/ 400).toInt()),
            childAspectRatio: 2.5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: houses.length,
          itemBuilder: (context, index) {
            final house = houses[index];
            return GestureDetector(
              child: HouseCard(
                house: house,
              ),
              onTap: () => GoRouter.of(context).go('/houses/${house.id}'),
            );
          },
        ),
      );
    });
  }
}