import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart' as go;
import 'package:hyperboliq/shared/widgets/switcher.dart';
import '../router.dart' as router;
import 'adaptive_navigation.dart';

class RootLayout extends StatelessWidget {
  const RootLayout({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  final Widget child;
  final int currentIndex;
  static const _switcherKey = ValueKey('switcherKey');
  static const _navigationRailKey = ValueKey('navigationRailKey');

  @override
  Widget build(BuildContext context) {
      return LayoutBuilder(builder: (context, dimens) {
        void onSelected(int index) {
          final destination = router.destinations[index];
          go.GoRouter.of(context).go(destination.route);
        }

        return AdaptiveNavigation(
          key: _navigationRailKey,
          destinations: router.destinations
              .map((e) => NavigationDestination(
                    icon: e.icon,
                    label: e.label,
                  ))
              .toList(),
          selectedIndex: currentIndex,
          onDestinationSelected: onSelected,
          child: Column(
            children: [
              Expanded(
                child: Switcher(
                  key: _switcherKey,
                  child: child,
                ),
              ),
            ],
          ),
        );
      });
  }
}
