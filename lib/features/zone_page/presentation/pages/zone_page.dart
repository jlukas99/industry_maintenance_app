import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:industry_maintenance_app/features/zone_page/presentation/bloc/zone_cubit.dart';

import '../../../user_auth/domain/entities/user.dart';
import '../../../user_auth/presentation/bloc/login_cubit/login_cubit.dart';
import '../../domain/entities/zone.dart';

class ZonePage extends HookWidget {
  const ZonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ///login CUBIT
    final loginCubit = ModalRoute.of(context)?.settings.arguments as LoginCubit;
    final loginState = useBlocBuilder(loginCubit);
    final User? user = loginState.whenOrNull(loginSuccess: (value) => value);


    final zoneCubit = useBloc<ZoneCubit>(closeOnDispose: false);
    final zoneState = useBlocBuilder(zoneCubit);
    useBlocListener<ZoneCubit, ZoneState>(zoneCubit, (bloc, current, context) {
      current.whenOrNull(
        addZoneButtonPressed: () => Navigator.of(context).pushNamed('/add_zone_page'),
      );
    });

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 80.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: (){
              zoneCubit.goToAddZonePage();
            }, icon: const Icon(Icons.add, size: 40,)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.search, size: 40,)),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('STREFY', style: TextStyle(fontWeight: FontWeight.w700),),
        centerTitle: true,
        actions: [
          CircleAvatar(radius: 30,child: Text(user!.userName[0] + user.userSurName[0]),),
          const SizedBox(width: 20,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: StreamBuilder<List<FactoryZone>>(
          stream: zoneCubit.fetchZones(),
          builder: (BuildContext context, AsyncSnapshot<List<FactoryZone>> snapshot) {
            return Container(
              child: zoneState.whenOrNull(
                  lookingForZone: () => const Center(child: CircularProgressIndicator()),
                  zonePageIsEmpty: (value) => Center(child: Text(value)),
                  zonePageError: (value) => Center(child: Text(value)),
                  zoneStateHasData: () => ListView.builder(
                    itemExtent: 180.0,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      final FactoryZone zone = snapshot.data![index];
                      return Card(child: Row(
                        children: [
                          const SizedBox(width: 10.0,),
                          const CircleAvatar(backgroundColor: Colors.white12, radius: 55, child: Icon(Icons.electric_bolt_outlined, size: 60,),),
                          const SizedBox(width: 20.0,),
                          Text(zone.zoneName.toUpperCase(), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w200),),
                        ],),);
                    },)
              ),
            );
          },
        ),
      ),
    );
  }
}
