import 'package:flutter/material.dart';

import 'package:adaptive_components/adaptive_components.dart';
import 'package:hyperboliq/shared/app_strings.dart';
import 'package:hyperboliq/shared/models/house/house.dart';
import 'package:hyperboliq/shared/providers/houses.dart';

import '../../../shared/extensions.dart';
import '../../../shared/widgets/widget_exports.dart';
import 'widget_exports.dart';

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
                    Tab(text: 'Recently Played'),
                    Tab(text: 'New Releases'),
                    Tab(text: 'Top Songs'),
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
                AdaptiveContainer(
                  columnSpan: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: Text(
                          'Recently played',
                          style: context.headlineSmall,
                        ),
                      ),
                    ],
                  ),
                ),
                AdaptiveContainer(
                  columnSpan: 12,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, bottom: 8),
                                child: Text(
                                  'Top Songs Today',
                                  style: context.titleLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 25),
                        Flexible(
                          flex: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, bottom: 8),
                                child: Text(
                                  'New Releases',
                                  style: context.titleLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
