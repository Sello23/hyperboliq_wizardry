import 'package:flutter/material.dart';
import 'package:hyperboliq/src/features/home/presentation/widgets/home_tablet_layout.dart';
import 'package:hyperboliq/src/shared/extensions.dart';
import '../../../houses/data/models/house.dart';
import 'mobile_layout.dart';

class HomeScreenLayout extends StatelessWidget {
  const HomeScreenLayout({
    super.key,
    required this.houses,
  });

  final List<House> houses;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.isMobile) {
          return HomeMobileLayout(houses: houses);
        }
        return HomeTabletLayout(houses: houses);
      },
    );
  }
}