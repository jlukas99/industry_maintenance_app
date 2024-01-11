import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:industry_maintenance_app/core/dependency_injection.dart' as dp;

import 'package:industry_maintenance_app/core/dependency_injection.dart';
import 'package:industry_maintenance_app/core/router/page_router.dart';
import 'package:industry_maintenance_app/firebase_options.dart';

void main() async{
  await dp.initInjection();
  runApp(
    HookedBlocConfigProvider(
        injector: () => depInjection.get,
        builderCondition: (state) => state != null, // Global build condition
        listenerCondition: (state) => state != null, // Global listen condition
        child: IndustryApp(pageRouter: MyPageRouter(),),),);
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class IndustryApp extends HookWidget {
  const IndustryApp({required this.pageRouter, super.key});

  final MyPageRouter pageRouter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: pageRouter.myRouter,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      // home: const StartPage(),

    );
  }
}
