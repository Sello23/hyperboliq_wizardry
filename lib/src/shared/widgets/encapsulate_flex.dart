import 'package:flutter/material.dart';

class EncapsulateFlex extends StatelessWidget {
  const EncapsulateFlex({
    super.key,
    required this.child,
    this.maxWidth = 960,
  });

  final double maxWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: child,
        ),
      ),
    );
  }
}