import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperboliq/src/shared/widgets/root_layout.dart';

import '../features/elixirs/data/models/elixir.dart';
import '../features/elixirs/domain/repository/elixirs_repository.dart';
import '../features/elixirs/presentation/screens/elixir_screen.dart';
import '../features/elixirs/presentation/screens/elixirs_screen.dart';
import '../features/elixirs/presentation/state/elixirs_cubit.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/houses/data/models/house.dart';
import '../features/houses/domain/repository/houses_repository.dart';
import '../features/houses/presentation/screens/house_screen.dart';
import '../features/houses/presentation/state/houses_cubit.dart';
import '../features/spells/data/models/spell.dart';
import '../features/spells/domain/repository/spells_repository.dart';
import '../features/spells/presentation/screens/spell_screen.dart';
import '../features/spells/presentation/screens/spells_screen.dart';
import '../features/spells/presentation/state/spells_cubit.dart';
import 'app_strings.dart';
import 'models/custom_navigation_destination.dart';

const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');

const List<CustomNavigationDestination> destinations = [
  CustomNavigationDestination(
    label: AppStrings.houseOverview,
    icon: Icon(Icons.house_sharp),
    route: '/',
  ),
  CustomNavigationDestination(
    label: AppStrings.spellsLibrary,
    icon: Icon(Icons.flash_on),
    route: '/spells',
  ),
  CustomNavigationDestination(
    label: AppStrings.elixirsEncyclopedia,
    icon: Icon(Icons.science),
    route: '/elixirs',
  ),
];

final appRouter = GoRouter(
  routes: [

    //Home screen
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: _pageKey,
        child: BlocProvider(
          create: (context) => HousesCubit(
            housesRepository: HousesRepository(),
          )..fetchHouses(),
          child: const RootLayout(
            key: _scaffoldKey,
            currentIndex: 0,
            child: HomeScreen(),
          ),
        ),
      ),
    ),

    GoRoute(
      path: '/houses/:id',
      pageBuilder: (context, state) {
        final houseJson = state.uri.queryParameters['data']!;
        final house = House.fromJson(jsonDecode(houseJson));

        return MaterialPage<void>(
          key: state.pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 0,
            child: HouseScreen(
              house: house,
            ),
          ),
        );
      },
    ),

    // Spells screen
    GoRoute(
      path: '/spells',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: _pageKey,
        child: BlocProvider(
          create: (context) => SpellsCubit(
            spellsRepository: SpellsRepository(),
          )..fetchSpells(),
          child: const RootLayout(
            key: _scaffoldKey,
            currentIndex: 1,
            child: SpellsScreen(),
          ),
        ),
      ),
    ),

    GoRoute(
      path: '/spells/:id',
      pageBuilder: (context, state) {
        final spellJson = state.uri.queryParameters['data']!;
        final spell = Spell.fromJson(jsonDecode(spellJson));

        return MaterialPage<void>(
          key: state.pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 0,
            child: SpellScreen(
              spell: spell,
            ),
          ),
        );
      },
    ),

    GoRoute(
      path: '/elixirs',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: _pageKey,
        child: BlocProvider(
          create: (context) => ElixirsCubit(
            elixirsRepository: ElixirsRepository(),
          )..fetchElixirs(),
          child: const RootLayout(
            key: _scaffoldKey,
            currentIndex: 2,
            child: ElixirsScreen(),
          ),
        ),
      ),
    ),

    GoRoute(
      path: '/elixirs/:id',
      pageBuilder: (context, state) {
        final elixirJson = state.uri.queryParameters['data']!;
        final elixir = Elixir.fromJson(jsonDecode(elixirJson));

        return MaterialPage<void>(
          key: state.pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 0,
            child: ElixirScreen(
              elixir: elixir,
            ),
          ),
        );
      },
    ),
  ],
);
