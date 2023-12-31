import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:industry_maintenance_app/features/main_page/presentation/bloc/main_page_cubit.dart';

import '../../../user_auth/domain/entities/user.dart';
import '../../../user_auth/presentation/bloc/login_cubit/login_cubit.dart';
import '../../../zone_page/presentation/bloc/zone_cubit.dart';

class MainPage extends HookWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ///login CUBIT
    final loginCubit = ModalRoute.of(context)?.settings.arguments as LoginCubit;
    final loginState = useBlocBuilder(loginCubit);
    final User? user = loginState.whenOrNull(loginSuccess: (value) => value);

    ///main page CUBIT
    final mainPageCubit = useBloc<MainPageCubit>();
    final mainPageState = useBlocBuilder(mainPageCubit);
    useBlocListener<MainPageCubit, MainPageState>(mainPageCubit, (bloc, current, context) {
      current.whenOrNull(
        failuresPressed: () async{
          await Future.delayed(const Duration(seconds: 1));
          if(context.mounted){
            Navigator.of(context).pushNamed('/failures_page', arguments: loginCubit);
          }
        },
        shutDownsPressed: () async{
          await Future.delayed(const Duration(seconds: 1));
          if(context.mounted){
            Navigator.of(context).pushNamed('/shutdown_page', arguments: loginCubit);
          }

        },
        factoryPressed: () async{
          await Future.delayed(const Duration(seconds: 1));
          if(context.mounted){
            Navigator.of(context).pushNamed('/factory_page', arguments: loginCubit);
          }
        },
      );
    });



    return Scaffold(
      appBar: AppBar(
        title: const Text('Strona główna'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          CircleAvatar(radius: 30,child: Text(user!.userName[0] + user.userSurName[0]),),
          const SizedBox(width: 20,),
        ],
      ),
      body: Center(
        child:
            mainPageState.maybeWhen(
              error: () => const Icon(Icons.error_outline, size: 60.0,),
              orElse: () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                            onTap: () => mainPageCubit.pressShutDown(),
                            child: SizedBox(height: 200,
                                child: Card(
                                    child: mainPageState.maybeWhen(
                                        shutDownsPressed: () => const Center(child: SizedBox(width:80, height:10, child: LinearProgressIndicator())),
                                        orElse: () => const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.stop_circle_outlined, size: 100, color: Colors.white54,),
                                        Text('POSTOJE', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),)
                                      ],
                                    )),
                                )),
                          )),
                      Expanded(
                          child: GestureDetector(
                            onTap: () => mainPageCubit.pressFactory(),
                            child: SizedBox(height: 200,
                                child: mainPageState.maybeWhen(
                                  factoryPressed: () => const Center(child: SizedBox(width:80, height:10, child: LinearProgressIndicator())),
                                  orElse: () => const Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.factory, color: Colors.white54, size: 100,),
                                      Text('ZAKŁAD', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),),
                                    ],
                                  ),
                                ),)
                            ),
                          )),
                    ],),
                  Row(
                    children: [
                      Expanded(child: GestureDetector(
                        onTap: () => mainPageCubit.pressFailures(),
                        child: const SizedBox(height: 200,
                            child: Card(color: Colors.white38,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("USTERKI", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),),
                                    Text('0', style: TextStyle(fontSize: 100, color: Colors.greenAccent),)
                                  ],
                                ),
                              ),
                            ),
                        ),
                      ),
                      ),
                    ],
                  ),

                ],
              ),
            ),

      ),
    );
  }
}
