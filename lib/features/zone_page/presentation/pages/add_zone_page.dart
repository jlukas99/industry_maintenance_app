import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:industry_maintenance_app/core/widgets/custom_snackbar_widget.dart';
import 'package:industry_maintenance_app/core/widgets/custom_text_form_widget.dart';
import 'package:industry_maintenance_app/features/zone_page/presentation/bloc/add_zone_cubit/add_zone_cubit.dart';

class AddZonePage extends HookWidget {
  const AddZonePage({
    required this.uid,
    super.key,
  });

  final String? uid;

  @override
  Widget build(BuildContext context) {
    final zoneNameText = TextEditingController();
    final snackBar = MySnackBar();

    final addZoneCubit = useBloc<AddZoneCubit>();
    final addZoneState = useBlocBuilder(addZoneCubit);
    useBlocListener<AddZoneCubit, AddZoneState>(addZoneCubit,
        (bloc, current, context) {
      current.whenOrNull(
        zoneExists: (message) => snackBar.showSnackBar(message, context),
        zoneExistsError: (message) => snackBar.showSnackBar(message, context),
        createZoneFailure: (message) => snackBar.showSnackBar(message, context),
        createZoneSuccess: (message) async {
          await Future.delayed(const Duration(seconds: 2), () {
            if (context.mounted) {
              context.goNamed('factory_zones', pathParameters: {'uid': uid!});
            }
          });
        },
      );
    });

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: addZoneState.whenOrNull(
          initial: () => Column(
            children: [
              AuthTextField(
                keyName: '',
                icon: const Icon(Icons.text_fields_outlined),
                hintText: 'nazwa strefy',
                controller: zoneNameText,
                obscure: false,
              ),
              const SizedBox(
                height: 30.0,
              ),
              CupertinoButton(
                child: const Text('Utwórz'),
                onPressed: () {
                  addZoneCubit.checkForZone(
                    zoneName: zoneNameText.text,
                    zonePicture: '',
                  );
                },
              ),
            ],
          ),
          createZoneSuccess: (message) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle,
                  size: 80,
                  color: Colors.greenAccent,
                ),
                Text(message),
              ],
            ),
          ),
          addingNewZone: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
