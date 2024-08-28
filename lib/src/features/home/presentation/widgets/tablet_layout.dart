import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hyperboliq/src/shared/extensions.dart';

import '../../../../shared/app_strings.dart';
import '../../../../shared/widgets/brightness_toggle.dart';
import '../../../houses/data/models/house.dart';
import '../../home.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({
    super.key,
    required this.houses,
  });

  final List<House> houses;

  @override
  Widget build(BuildContext context) {
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
  }
}