import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperboliq/shared/extensions.dart';
import 'package:hyperboliq/shared/widgets/house_content.dart';

import '../../../shared/models/house/house.dart';
import '../../../shared/widgets/image_clipper.dart';

class HouseScreen extends StatelessWidget {
  const HouseScreen({required this.house, super.key});

  final House house;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final colors = Theme.of(context).colorScheme;
        double headerHeight = constraints.maxWidth > 500 ? 300 : 400;
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              leading: BackButton(
                onPressed: () => GoRouter.of(context).go('/houses'),
              ),
              title: Text('HOUSE - ${house.name}'),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight + headerHeight),
                child: Column(
                  children: [
                    HouseContent(
                      child: Builder(
                        builder: (context) {
                          if (constraints.maxWidth > 500) {
                            return SizedBox(
                              height: headerHeight,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClippedImage(
                                    house.houseBackgroundImage.image,
                                    fit: BoxFit.cover,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Text(
                                        house.animal,
                                        style: context.bodyLarge!.copyWith(
                                          color: colors.onSurface,
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          return SizedBox(
                            height: headerHeight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 300,
                                  child: ClippedImage(
                                    house.houseBackgroundImage.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(
                                      house.houseBackgroundImage.image,
                                      style: context.bodyLarge!.copyWith(
                                        color: colors.onSurface,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const TabBar(
                      tabs: [
                        Tab(text: 'Heads'),
                        Tab(text: 'Traits'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            body: const TabBarView(
              children: [
                SingleChildScrollView(child: null),
                SingleChildScrollView(child: null),
              ],
            ),
          ),
        );
      },
    );
  }
}