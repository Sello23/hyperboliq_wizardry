import 'package:flutter/material.dart';
import '../../../../shared/extensions.dart';
import '../../data/models/house.dart';
import '../../../../shared/widgets/outlined_card.dart';

class HouseCard extends StatelessWidget {
  const HouseCard({
    super.key,
    required this.house,
  });

  final House house;

  @override
  Widget build(BuildContext context) {

    return OutlinedCard(
      child: LayoutBuilder(
        builder: (context, dimens) => Row(
          children: [
            SizedBox(
              width: dimens.maxWidth * 0.4,
              child: Image.asset(
                house.myImage!.image,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              house.name,
                              style: context.titleMedium,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              house.animal,
                              overflow: TextOverflow.ellipsis,
                              style: context.labelSmall,
                              maxLines: 3,
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
