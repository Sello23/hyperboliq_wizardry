import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperboliq/shared/extensions.dart';
import 'package:hyperboliq/features/houses/data/models/house.dart';

class HomeHouses extends StatelessWidget {
  const HomeHouses({
    super.key,
    required this.houses,
    required this.constraints,
  });

  final List<House> houses;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: constraints.isMobile
          ? Column(
        children: [
          for (final house in houses) buildTile(context, house),
        ],
      )
          : Row(children: [
        for (final house in houses)
          Flexible(
            flex: 1,
            child: buildTile(context, house),
          ),
      ]),
    );
  }

  Widget buildTile(BuildContext context, House house) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(house.houseBackgroundImage.image),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5),
              BlendMode.darken), // Optional: Darken the background for better text readability
        ),
      ),
      child: ListTile(
        title: Text(
          house.name,
          maxLines: 2,
          style: context.labelLarge,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: Text('Founder: ${house.founder}', style: context.labelMedium),
        ),
        onTap: () => GoRouter.of(context).go('/houses/${house.id}'),
      ),
    );
  }
}
