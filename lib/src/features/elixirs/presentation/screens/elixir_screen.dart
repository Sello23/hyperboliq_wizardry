import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperboliq/src/shared/extensions.dart';

import '../../../../shared/widgets/encapsulate_flex.dart';
import '../../../../shared/widgets/image_clipper.dart';
import '../../data/models/elixir.dart';
import '../widgets/elixir_ingredients.dart';
import '../widgets/elixir_inventors.dart';

class ElixirScreen extends StatelessWidget {
  const ElixirScreen({required this.elixir, super.key});

  final Elixir elixir;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double headerHeight = constraints.maxWidth > 500 ? 300 : 400;
        const TextAlign commonTextAlign = TextAlign.start;

        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              leading: BackButton(
                onPressed: () => GoRouter.of(context).go('/elixirs'),
              ),
              title: Text('ELIXIR - ${elixir.name}'),
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
                              const ClippedImage(
                                'assets/images/elixirs/elixir_background.jpg',
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
                                        elixir.effect ?? 'no effect mentioned',
                                        style: context.navScreensTextStyle,
                                        textAlign: commonTextAlign,
                                      ),
                                      Text(
                                        elixir.sideEffects ??
                                            'no side effects mentioned',
                                        style: context.navScreensTextStyle,
                                        textAlign: commonTextAlign,
                                      ),
                                      Text(
                                        elixir.characteristics ??
                                            'no char. mentioned',
                                        style: context.navScreensTextStyle,
                                        textAlign: commonTextAlign,
                                      ),
                                      Text(
                                        elixir.difficulty,
                                        style: context.navScreensTextStyle,
                                        textAlign: commonTextAlign,
                                      ),
                                      Text(
                                        elixir.manufacturer ?? 'man. not mentioned',
                                        style: context.navScreensTextStyle,
                                        textAlign: commonTextAlign,
                                      )
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
                            const SizedBox(
                              height: 300,
                              child: ClippedImage(
                                'assets/images/elixirs/elixir_background.jpg',
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
                                          elixir.effect ??
                                              "effects not mentioned",
                                          style: context.textSmall,
                                          textAlign: commonTextAlign,
                                        ),
                                        Text(
                                          elixir.sideEffects ??
                                              "effects not mentioned",
                                          style: context.textSmall,
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
                                          elixir.characteristics ??
                                              "char. not mentioned",
                                          style: context.textSmall,
                                          textAlign: commonTextAlign,
                                        ),
                                        Text(
                                          elixir.difficulty,
                                          style: context.textSmall,
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
                    Tab(text: 'Ingredients'),
                    Tab(text: 'Inventors'),
                  ],
                ),
                // TabBarView section
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(child: ElixirIngredients(ingredients: elixir.ingredients,)),
                      SingleChildScrollView(child: ElixirInventors(inventors: elixir.inventors)),
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
