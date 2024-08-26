import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperboliq/shared/extensions.dart';

import '../../../../shared/models/house/house.dart';
import '../../../../shared/widgets/encapsulate_flex.dart';
import '../../../../shared/widgets/image_clipper.dart';
import '../widgets/house_heads.dart';
import '../widgets/house_traits.dart';

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
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClippedImage(
                                house.houseBackgroundImage.image,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        house.houseColours,
                                        style: commonTextStyle,
                                        textAlign: commonTextAlign,
                                      ),
                                      Text(
                                        house.animal,
                                        style: commonTextStyle,
                                        textAlign: commonTextAlign,
                                      ),
                                      Text(
                                        house.element,
                                        style: commonTextStyle,
                                        textAlign: commonTextAlign,
                                      ),
                                      Text(
                                        house.ghost,
                                        style: commonTextStyle,
                                        textAlign: commonTextAlign,
                                      ),
                                      Text(
                                        house.commonRoom,
                                        style: commonTextStyle,
                                        textAlign: commonTextAlign,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 300,
                              child: ClippedImage(
                                house.houseBackgroundImage.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 35.0, top: 20.0),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          house.houseColours,
                                          style: commonTextStyle,
                                          textAlign: commonTextAlign,
                                        ),
                                        Text(
                                          house.animal,
                                          style: commonTextStyle,
                                          textAlign: commonTextAlign,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 15.0),
                                    // Adds 16 pixels of space between the columns
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          house.element,
                                          style: commonTextStyle,
                                          textAlign: commonTextAlign,
                                        ),
                                        Text(
                                          house.ghost,
                                          style: commonTextStyle,
                                          textAlign: commonTextAlign,
                                        ),
                                      ],
                                    )
                                  ]),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),

                // TabBar section
                const TabBar(
                  tabs: [
                    Tab(text: 'Heads'),
                    Tab(text: 'Traits'),
                  ],
                ),

                // TabBarView section
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(child: HouseHeads(house: house)),
                      SingleChildScrollView(child: HouseTraits(house: house)),
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
