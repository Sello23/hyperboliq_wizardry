import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyperboliq/src/features/houses/domain/repository/houses_repository.dart';
import 'package:hyperboliq/src/features/houses/presentation/state/houses_cubit.dart';
import 'package:hyperboliq/src/shared/my_app.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

Future setDesktopWindow() async {
  await DesktopWindow.setMinWindowSize(const Size(400, 400));
  await DesktopWindow.setWindowSize(const Size(1300, 900));
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (UniversalPlatform.isDesktop) {
    setDesktopWindow();
  }

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  runApp(
    BlocProvider(
      create: (context) => HousesCubit(
        housesRepository: HousesRepository(),
      )..fetchHouses(),
      child: const MyApp(),
    ),
  );
}
