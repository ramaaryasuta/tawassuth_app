import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/routes/app_router.dart';
import 'features/prayer_time/presentation/cubits/prayer_time_cubit.dart';
import 'service_locator.dart';
import 'utils/print_log.dart';

bool showAPILog = false;
void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await dotenv.load(fileName: ".env");
      await initializeServiceLocator();

      runApp(
        MultiBlocProvider(
          providers: [BlocProvider(create: (context) => sl<PrayerTimeCubit>())],
          child: MyApp(),
        ),
      );
    },
    (e, s) {
      printLog('[runZonedGuarded] error: $e, stack: $s', type: LogType.error);
    },
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter,
    );
  }
}
