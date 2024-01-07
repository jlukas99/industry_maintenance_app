import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:industry_maintenance_app/core/my_widgets/my_end_drawer/presentation/pages/my_end_drawer.dart';
import 'package:industry_maintenance_app/features/main_page/presentation/bloc/main_page_cubit.dart';

import '../../../../core/my_widgets/my_app_bar/presentation/pages/my_app_bar.dart';



class MainPage extends HookWidget {
  final String? uid;
  const MainPage({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    ///main page CUBIT
    final mainPageCubit = useBloc<MainPageCubit>();
    final mainPageState = useBlocBuilder(mainPageCubit);
    useBlocListener<MainPageCubit, MainPageState>(mainPageCubit, (bloc, current, context) {
      current.whenOrNull();
    });

    ///UseEffect is to init mainPageCubit.initMainPage on start
    useEffect((){
      mainPageCubit.initMainPage(userID: uid);
      return null;
    },
      [mainPageCubit],
    );

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const MyEndDrawer(),
      // Drawer(
      //   elevation: 16.0,
      //   child: Container(width: 30, height: 100, color: Colors.white12,),
      // ),
      appBar: PreferredSize(preferredSize: const Size.fromHeight(70.0),
        child:CustomAppBar(
          scaffoldKey: _scaffoldKey,
          uid: uid,
          appBarTitle: 'STRONA GŁÓWNA',
          autoLeading: false,)
      ),
      body: Center(
        child:
            mainPageState.maybeWhen(
              mainPageError: () => const Icon(Icons.error_outline, size: 60.0,),
              orElse: () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                            onTap: () => (),
                            child: SizedBox(height: 200,
                                child: Card(
                                    child: mainPageState.maybeWhen(
                                        shutDownButtonPressed: () => const Center(child: SizedBox(width:80, height:10, child: LinearProgressIndicator())),
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
                            onTap: () => context.goNamed('factory_zones',
                              pathParameters: {'uid' : uid!}
                            ),
                            child: SizedBox(height: 200,
                                child: mainPageState.maybeWhen(
                                  factoryButtonPressed: () => const Center(child: SizedBox(width:80, height:10, child: LinearProgressIndicator())),
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
                        onTap: () => (),
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
