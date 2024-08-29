import 'package:flutter/cupertino.dart';
import 'package:hyperboliq/src/features/houses/data/models/house.dart';

import '../../../../shared/widgets/image_clipper.dart';

class HousesTabletLayout extends StatelessWidget {
  const HousesTabletLayout({
    super.key,
    required this.house,
    required this.commonTextStyle,
    required this.commonTextAlign,
  });

  final House house;
  final TextStyle commonTextStyle;
  final TextAlign commonTextAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 300,
          child: ClippedImage(
            house.imagePath,
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
  }
}
