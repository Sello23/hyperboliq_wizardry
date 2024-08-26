import 'package:flutter/material.dart';

import 'package:adaptive_components/adaptive_components.dart';
import 'package:hyperboliq/shared/app_strings.dart';
import 'package:hyperboliq/shared/extensions.dart';
import 'package:hyperboliq/features/houses/data/models/house.dart';

import '../../../../shared/providers/houses_provider.dart';
import '../../../../shared/widgets/brightness_toggle.dart';
import '../widgets/home_highlight.dart';
import '../widgets/home_houses.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final HousesProvider housesProvider = HousesProvider();
    final List<House> houses = housesProvider.houses;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.isMobile) {
          return DefaultTabController(
            length: 4,
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
        return Scaffold(
          body: SingleChildScrollView(
            child: AdaptiveColumn(
              children: [
                AdaptiveContainer(
                  columnSpan: 12,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            AppStrings.welcomeMessage,
                            style: context.displaySmall,
                          ),
                        ),
                        const SizedBox(width: 20),
                        const BrightnessToggle(),
                      ],
                    ),
                  ),
                ),
                AdaptiveContainer(
                  columnSpan: 12,
                  child: Column(
                    children: [
                      const HousesHighlight(),
                      LayoutBuilder(
                        builder: (context, constraints) => HomeHouses(
                          houses: houses,
                          constraints: constraints,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
