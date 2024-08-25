import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperboliq/shared/app_strings.dart';
import 'package:hyperboliq/shared/providers/houses.dart';

import '../features/home/home.dart';
import '../features/houses/widgets/house_screen.dart';
import 'providers/artists.dart';
import 'providers/playlists.dart';
import 'widgets/widget_exports.dart';

const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');

final artistsProvider = ArtistsProvider();
final playlistsProvider = PlaylistsProvider();
final housesProvider = HousesProvider();

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
      // builder: (context, state) => ArtistScreen(
      //   id: state.params['aid']!,
      // ),
    ),
  ],
);
