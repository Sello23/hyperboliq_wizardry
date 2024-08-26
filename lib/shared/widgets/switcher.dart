import 'package:flutter/cupertino.dart';
import 'package:universal_platform/universal_platform.dart';

class Switcher extends StatelessWidget {
  final Widget child;

  const Switcher({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UniversalPlatform.isDesktop
        ? child
        : AnimatedSwitcher(
      key: key,
      duration: const Duration(milliseconds: 200),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      child: child,
    );
  }
}