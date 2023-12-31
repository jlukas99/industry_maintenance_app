import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:industry_maintenance_app/core/dependency_injection.dart' as dp;
import 'package:industry_maintenance_app/features/main_page/presentation/pages/main_page.dart';
import 'package:industry_maintenance_app/features/start_page.dart';
import 'package:industry_maintenance_app/features/zone_page/presentation/pages/add_zone_page.dart';

import 'core/dependency_injection.dart';
import 'features/user_auth/presentation/pages/login_page.dart';
import 'features/zone_page/presentation/pages/zone_page.dart';
import 'firebase_options.dart';

void main() async{
  await dp.initInjection();
  runApp(
    HookedBlocConfigProvider(
        injector: () => depInjection.get,
        builderCondition: (state) => state != null, // Global build condition
        listenerCondition: (state) => state != null, // Global listen condition
        child: const IndustryApp()));
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class IndustryApp extends HookWidget {
  const IndustryApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/start_page' : (context) => const StartPage(),
        '/login_page': (context) => const LoginPage(),
        '/main_page': (context) => const MainPage(),
        '/factory_page': (context) => const ZonePage(),
        '/add_zone_page': (context) => const AddZonePage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const StartPage(),

    );
  }
}
