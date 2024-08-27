import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperboliq/src/shared/extensions.dart';

import '../../data/models/spell.dart';
import '../../../../shared/widgets/encapsulate_flex.dart';
import '../../../../shared/widgets/image_clipper.dart';

class SpellScreen extends StatelessWidget {
  const SpellScreen({required this.spell, super.key});

  final Spell spell;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double headerHeight = constraints.maxWidth > 500 ? 300 : 400;
      const TextAlign commonTextAlign = TextAlign.start;

      return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => GoRouter.of(context).go('/spells'),
          ),
          title: Text('SPELL - ${spell.name}'),
        ),
        body: Column(
          children: [
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
                            spell.spellImage.image,
                            fit: BoxFit.cover,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Effect: ${spell.effect}',
                                    style: context.navScreensTextStyle,
                                    textAlign: commonTextAlign,
                                  ),
                                  Text(
                                    'Incantation: ${spell.incantation}',
                                    style: context.navScreensTextStyle,
                                    textAlign: commonTextAlign,
                                  ),
                                  Text(
                                    'Can be verbal: ${spell.canBeVerbal}',
                                    style: context.navScreensTextStyle,
                                    textAlign: commonTextAlign,
                                  ),
                                  Text(
                                    'Type: ${spell.type}',
                                    style: context.navScreensTextStyle,
                                    textAlign: commonTextAlign,
                                  ),
                                  Text(
                                    'Light: ${spell.light}',
                                    style: context.navScreensTextStyle,
                                    textAlign: commonTextAlign,
                                  ),
                                  Text(
                                    'Creator: ${spell.creator}',
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
                        SizedBox(
                          height: 300,
                          child: ClippedImage(
                            spell.spellImage.image,
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
                                      'Effect: ${spell.effect}',
                                      style: context.textSmall,
                                      textAlign: commonTextAlign,
                                    ),
                                    Text(
                                      'Incantation: ${spell.incantation}',
                                      style: context.textSmall,
                                      textAlign: commonTextAlign,
                                    ),
                                    Text(
                                      'Can be verbal: ${spell.canBeVerbal}',
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
                                      'Type: ${spell.type}',
                                      style: context.textSmall,
                                      textAlign: commonTextAlign,
                                    ),
                                    Text(
                                      'Light: ${spell.light}',
                                      style: context.textSmall,
                                      textAlign: commonTextAlign,
                                    ),
                                    Text(
                                      'Creator: ${spell.creator}',
                                      style: context.textSmall,
                                      textAlign: commonTextAlign,
                                    )
                                  ],
                                )
                              ]),
                        )
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
