import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyperboliq/shared/app_strings.dart';

import '../features/houses/data/repositories/house_repository_impl.dart';
import '../features/houses/data/sources/house_remote_data_source.dart';
import '../features/houses/domain/usecases/get_houses.dart';
import '../features/houses/presentation/bloc/house_bloc.dart';
import '../features/houses/presentation/bloc/house_event.dart';
import 'theme.dart';
import 'router.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GetHouses getHouses;

  final settings = ValueNotifier(ThemeSettings(
    sourceColor: Colors.pink,
    themeMode: ThemeMode.system,
  ));

  @override
  void initState() {
    super.initState();

    // Initialize the data layer components
    final houseRemoteDataSource = HouseRemoteDataSource(http.Client());
    final houseRepository =
        HouseRepositoryImpl(remoteDataSource: houseRemoteDataSource);

    // Initialize the GetHouses use case
    getHouses = GetHouses(houseRepository);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HouseBloc>(
      create: (context) =>
          HouseBloc(getHouses: getHouses)..add(const FetchHouses()),
      child: DynamicColorBuilder(
        builder: (lightDynamic, darkDynamic) => ThemeProvider(
            lightDynamic: lightDynamic,
            darkDynamic: darkDynamic,
            settings: settings,
            child: NotificationListener<ThemeSettingChange>(
              onNotification: (notification) {
                settings.value = notification.settings;
                return true;
              },
              child: ValueListenableBuilder<ThemeSettings>(
                valueListenable: settings,
                builder: (context, value, _) {
                  final theme = ThemeProvider.of(context);
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    title: AppStrings.appName,
                    theme: theme.light(settings.value.sourceColor),
                    darkTheme: theme.dark(settings.value.sourceColor),
                    themeMode: theme.themeMode(),
                    routeInformationParser: appRouter.routeInformationParser,
                    routeInformationProvider:
                        appRouter.routeInformationProvider,
                    routerDelegate: appRouter.routerDelegate,
                  );
                },
              ),
            )),
      ),
    );
  }
}
