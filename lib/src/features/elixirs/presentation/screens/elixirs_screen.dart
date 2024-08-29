import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyperboliq/src/features/elixirs/presentation/state/elixirs_cubit.dart';
import 'package:hyperboliq/src/features/elixirs/presentation/state/elixirs_state.dart';
import '../../../../shared/widgets/exception_tile.dart';
import '../widgets/elixirs_screen_layout.dart';

class ElixirsScreen extends StatelessWidget {
  const ElixirsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ElixirsCubit, ElixirsState>(
        builder: (BuildContext context, ElixirsState state) {
          return switch (state.status){
            ElixirsStatus.loading => const Center(child: CircularProgressIndicator(),),
            ElixirsStatus.success => ElixirsScreenLayout(elixirs: state.elixirs),
            ElixirsStatus.failure => const ExceptionTile(message: "Something went wrong",
              iconShown: Icons.error,),
            ElixirsStatus.offline => const ExceptionTile(
              message: "Device offline",
              iconShown: Icons.wifi_off,),
          };
        }
    );
  }
}
