import 'package:flutter/material.dart';

class HousesHighlight extends StatelessWidget {
  const HousesHighlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
              child: SizedBox(
                height: 275,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/houses/wizard_home.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ),
        ),
      ],
    );
  }
}
