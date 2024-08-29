import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyperboliq/src/features/spells/presentation/screens/spells_screen_layout.dart';
import 'package:hyperboliq/src/features/spells/presentation/state/spells_cubit.dart';
import 'package:hyperboliq/src/features/spells/presentation/state/spells_state.dart';
import 'package:hyperboliq/src/shared/widgets/exception_tile.dart';

class SpellsScreen extends StatelessWidget {
  const SpellsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpellsCubit, SpellsState>(
        builder: (BuildContext context, SpellsState state) {
          context.read<SpellsCubit>().fetchSpells();

          return switch (state.status){
            SpellsStatus.loading => const Center(child: CircularProgressIndicator(),),
            SpellsStatus.success => SpellScreenLayout(spells: state.spells),
          SpellsStatus.failure => const ExceptionTile(message: "Something went wrong",
            iconShown: Icons.error,),
          SpellsStatus.offline => const ExceptionTile(
            message: "Device offline",
            iconShown: Icons.wifi_off,),
          };
        }
    );
  }
}
