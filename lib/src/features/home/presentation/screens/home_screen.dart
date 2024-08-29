import 'package:flutter/material.dart';
import 'package:hyperboliq/src/features/houses/presentation/state/houses_cubit.dart';
import 'package:hyperboliq/src/features/houses/presentation/state/houses_state.dart';
import '../../../../shared/widgets/exception_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/home_screen_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HousesCubit, HousesState>(
      builder: (BuildContext context, HousesState state) {
        return switch (state.status) {
          HousesStatus.loading => const Center(child: CircularProgressIndicator(),),
          HousesStatus.success => HomeScreenLayout(houses: state.houses),
          HousesStatus.failure => const ExceptionTile(
              message: "Something went wrong",
              iconShown: Icons.error,
            ),
          HousesStatus.offline => const ExceptionTile(
              message: "Device offline",
              iconShown: Icons.wifi_off,
            ),
        };
      },
    );
  }
}