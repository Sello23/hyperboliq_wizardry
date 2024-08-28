import 'package:flutter/cupertino.dart';
import 'package:hyperboliq/src/features/houses/data/models/house.dart';

import '../../../../shared/widgets/image_clipper.dart';

class HousesMobileLayout extends StatelessWidget {
  const HousesMobileLayout({
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClippedImage(
          house.myImage.image,
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
}