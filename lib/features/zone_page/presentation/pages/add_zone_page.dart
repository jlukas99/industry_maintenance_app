import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:industry_maintenance_app/core/my_widgets/custom_snackbar_widget.dart';
import 'package:industry_maintenance_app/features/zone_page/presentation/bloc/add_zone_cubit/add_zone_cubit.dart';
import 'package:industry_maintenance_app/features/zone_page/presentation/bloc/zone_cubit.dart';

class AddZonePage extends HookWidget {
  const AddZonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final zoneNameText = TextEditingController();
    final snackBar = MySnackBar();


    final addZoneCubit = useBloc<AddZoneCubit>(closeOnDispose: false);
    final addZoneState = useBlocBuilder(addZoneCubit);
    useBlocListener<AddZoneCubit, AddZoneState>(addZoneCubit, (bloc, current, context) {
      current.whenOrNull(
        zoneExists: (message) => snackBar.showSnackBar(message, context),
        zoneExistsError: (message) => snackBar.showSnackBar(message, context),
        createZoneFailure: (message) => snackBar.showSnackBar(message, context),
        // createZoneSuccess: (message) async{
        //   await Future.delayed(const Duration(seconds: 2));
        //   Navigator.of(context).pushNamed('/factory_page',);
        // }
      );
    });

    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: addZoneState.whenOrNull(
            initial: () => Column(
              children: [
                TextFormField(
                  controller: zoneNameText,
                ),
                const SizedBox(height: 30.0,),
                CupertinoButton(child: const Text('Utwórz'), onPressed: (){
                  addZoneCubit.checkForZone(zoneName: zoneNameText.text, zonePicture: '');
                }),
              ],
            ),
            createZoneSuccess: (message) => Center(child: Column(children: [
              const Icon(Icons.check_circle, size: 80, color: Colors.greenAccent,),
              Text(message),
            ],)),
            addingNewZone: () => const Center(child: CircularProgressIndicator(),),
          ),
      ),
    );
  }
}
