import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperboliq/features/spells/widgets/spell_screen.dart';
import 'package:hyperboliq/shared/app_strings.dart';
import 'package:hyperboliq/shared/models/spell.dart';
import 'package:hyperboliq/shared/providers/elixirs_provider.dart';
import 'package:hyperboliq/shared/providers/houses_provider.dart';
import 'package:hyperboliq/shared/providers/spells_provider.dart';
import 'package:hyperboliq/shared/widgets/root_layout.dart';

import '../features/elixirs/widgets/elixir_screen.dart';
import '../features/elixirs/widgets/elixirs_screen.dart';
import '../features/home/widgets/home_screen.dart';
import '../features/houses/widgets/house_screen.dart';
import '../features/spells/widgets/spells_screen.dart';

const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');
final housesProvider = HousesProvider();
final ElixirsProvider elixirsProvider = ElixirsProvider();
final SpellsProvider spellsProvider = SpellsProvider();

const List<NavigationDestination> destinations = [
  NavigationDestination(
    label: AppStrings.houseOverview,
    icon: Icon(Icons.house_sharp),
    route: '/',
  ),
  NavigationDestination(
    label: AppStrings.spellsLibrary,
    icon: Icon(Icons.flash_on),
    route: '/spells',
  ),
  NavigationDestination(
    label: AppStrings.elixirsEncyclopedia,
    icon: Icon(Icons.science),
    route: '/elixirs',
  ),
];

class NavigationDestination {
  const NavigationDestination({
    required this.route,
    required this.label,
    required this.icon,
    this.child,
  });

  final String route;
  final String label;
  final Icon icon;
  final Widget? child;
}

final appRouter = GoRouter(
  routes: [
    // HomeScreen
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const MaterialPage<void>(
        key: _pageKey,
        child: RootLayout(
          key: _scaffoldKey,
          currentIndex: 0,
          child: HomeScreen(),
        ),
      ),
    ),

    // Spells
    GoRoute(
        path: '/spells',
        pageBuilder: (context, state) => const MaterialPage<void>(
              key: _pageKey,
              child: RootLayout(
                key: _scaffoldKey,
                currentIndex: 1,
                child: SpellsScreen(),
              ),
            ),
        routes: [
          GoRoute(
            path: ':id',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: RootLayout(
                key: _scaffoldKey,
                currentIndex: 1,
                child: SpellScreen(
                  spell:
                      spellsProvider.getSpell(state.pathParameters['id']!)!,
                ),
              ),
            ),
          ),
        ]),

    // Elixirs
    GoRoute(
        path: '/elixirs',
        pageBuilder: (context, state) => const MaterialPage<void>(
              key: _pageKey,
              child: RootLayout(
                key: _scaffoldKey,
                currentIndex: 2,
                child: ElixirsScreen(),
              ),
            ),
        routes: [
          GoRoute(
            path: ':id',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: RootLayout(
                key: _scaffoldKey,
                currentIndex: 2,
                child: ElixirScreen(
                  elixir:
                      elixirsProvider.getElixir(state.pathParameters['id']!)!,
                ),
              ),
            ),
          ),
        ]),

    //HousesHomeScreen
    GoRoute(
      path: '/houses/:id',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: RootLayout(
          key: _scaffoldKey,
          currentIndex: 0,
          child: HouseScreen(
            house: housesProvider.getHouse(state.pathParameters['id']!)!,
          ),
        ),
      ),
    ),
  ],
);
