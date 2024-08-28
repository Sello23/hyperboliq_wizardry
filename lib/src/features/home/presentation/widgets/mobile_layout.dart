import 'package:flutter/material.dart';

import '../../../../shared/app_strings.dart';
import '../../../../shared/widgets/brightness_toggle.dart';
import '../../../houses/data/models/house.dart';
import '../../home.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({
    super.key,
    required this.houses,
  });

  final List<House> houses;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(AppStrings.welcomeMessage),
          actions: const [BrightnessToggle()],
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: AppStrings.homeScreenTitle),
            ],
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const HousesHighlight(),
                    HomeHouses(
                      houses: houses,
                      constraints: constraints,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
