import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperboliq/src/shared/extensions.dart';

import '../../data/models/house.dart';
import '../../../../shared/widgets/encapsulate_flex.dart';
import '../widgets/house_heads.dart';
import '../widgets/house_traits.dart';
import '../widgets/houses_mobile_layout.dart';
import '../widgets/houses_tablet_layout.dart';

class HouseScreen extends StatelessWidget {
  const HouseScreen({required this.house, super.key});

  final House house;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final colors = Theme.of(context).colorScheme;
        double headerHeight = constraints.maxWidth > 500 ? 300 : 400;

        final TextStyle commonTextStyle = context.bodyLarge!.copyWith(
          color: colors.onSurface,
          fontSize: 15,
        );

        const TextAlign commonTextAlign = TextAlign.start;

        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              leading: BackButton(
                onPressed: () => GoRouter.of(context).go('/'),
              ),
              title: Text('HOUSE - ${house.name}'),
            ),
            body: Column(
              children: [
                // Header section
                SizedBox(
                  height: headerHeight,
                  child: EncapsulateFlex(
                    child: Builder(
                      builder: (context) {
                        if (constraints.maxWidth > 500) {
                          return HousesMobileLayout(
                              house: house,
                              commonTextStyle: commonTextStyle,
                              commonTextAlign: commonTextAlign);
                        }
                        return HousesTabletLayout(
                            house: house,
                            commonTextStyle: commonTextStyle,
                            commonTextAlign: commonTextAlign);
                      },
                    ),
                  ),
                ),

                const TabBar(
                  tabs: [
                    Tab(text: 'Heads'),
                    Tab(text: 'Traits'),
                  ],
                ),

                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                          child: HouseHeads(heads: house.heads)),
                      SingleChildScrollView(
                          child: HouseTraits(traits: house.traits)),
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
