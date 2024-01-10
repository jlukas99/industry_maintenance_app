import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:industry_maintenance_app/core/my_widgets/custom_text_form_widget.dart';
import 'package:industry_maintenance_app/core/my_widgets/my_end_drawer/presentation/pages/my_end_drawer.dart';
import 'package:industry_maintenance_app/features/zone_page/presentation/bloc/zone_cubit.dart';
import '../../../../core/my_widgets/myDrawer.dart';
import '../../../../core/my_widgets/my_app_bar/presentation/pages/my_app_bar.dart';
import '../../domain/entities/zone.dart';

class ZonePage extends HookWidget {
  final String? uid;
  const ZonePage({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final _zoneSearchText = useTextEditingController();

    // print(GoRouterState.of(context).path);

    final zoneCubit = useBloc<ZoneCubit>();
    final zoneState = useBlocBuilder(zoneCubit);
    useBlocListener<ZoneCubit, ZoneState>(zoneCubit, (bloc, current, context) {
      current.whenOrNull(
      );
    });

    final _factoryPath = ['rejony'];

    /// call on start page initZonePage function from zoneCubit to fetch zones and get user
    useEffect(() {
      zoneCubit.initZonePage(userID: uid);
      return null;
    },
    [zoneCubit],
    );

    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(factoryPath: _factoryPath, uid: uid!),
      endDrawer: const MyEndDrawer(),
      bottomNavigationBar: BottomAppBar(
        height: 80.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: (){
              context.pushNamed('add_factory_zone', pathParameters: {'uid' : uid!});
            }, icon: const Icon(Icons.add, size: 40,)),
            IconButton(onPressed: (){
              _zoneSearchText.text = '';
              zoneCubit.findZone('');
            }, icon: const Icon(Icons.search, size: 40,)),
            IconButton(onPressed: (){
              context.goNamed('main_page', pathParameters: {'uid': uid!});
            }, icon: const Icon(Icons.home, size: 40,)),
          ],
        ),
      ),


      appBar: PreferredSize(preferredSize:const Size.fromHeight(70),
          child:CustomAppBar(
            scaffoldKey: _scaffoldKey,
            uid: uid,
            appBarTitle: 'REJONY',
            autoLeading: true,)),

      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
                child: zoneState.whenOrNull(
                    searchForZone: (zoneList) => Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Column(
                          children: [
                            Expanded(flex:1,child:
                            FindZoneTextField(zoneCubit: zoneCubit, zoneSearchText: _zoneSearchText)),
                            Expanded(
                              flex:7,
                              child: ListView.builder(
                                itemExtent: 180.0,
                                itemCount: zoneList!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  FactoryZone zone = zoneList[index];
                                  return GestureDetector(
                                    onTap: (){
                                      context.goNamed('department_page', pathParameters: {'uid': uid!, 'zoneName' : zone.zoneName});
                                      zoneCubit.initZonePage(userID: uid);
                                    },
                                    child: Card(child: Row(
                                      children: [
                                        const SizedBox(width: 10.0,),
                                        const CircleAvatar(backgroundColor: Colors.white12, radius: 55, child: Icon(Icons.electric_bolt_outlined, size: 60,),),
                                        const SizedBox(width: 20.0,),
                                        Text(zone.zoneName.toUpperCase(), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w200),),
                                      ],),),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        IconButton(onPressed: (){
                          zoneCubit.initZonePage(userID: uid);
                        }, icon: const Icon(Icons.backspace, size: 40,)),
                      ],
                    ),
                    lookingForZone: () => const Center(child: CircularProgressIndicator()),
                    zonePageError: (value) => Center(child: Text(value)),
                    zonePageInitialized: (zoneList, user) => ListView.builder(
                      itemExtent: 180.0,
                      itemCount: zoneList!.length,
                      itemBuilder: (BuildContext context, int index) {
                        FactoryZone zone = zoneList[index];
                        return GestureDetector(
                          onTap: (){
                            context.goNamed('department_page', pathParameters: {'uid': uid!, 'zoneName' : zone.zoneName});
                          },
                          child: Card(child: Row(
                            children: [
                              const SizedBox(width: 10.0,),
                              const CircleAvatar(backgroundColor: Colors.white12, radius: 55, child: Icon(Icons.electric_bolt_outlined, size: 60,),),
                              const SizedBox(width: 20.0,),
                              Text(zone.zoneName.toUpperCase(), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w200),),
                            ],),),
                        );
                      },
                    ),
                    zonePageIsEmpty: (value) => Center(child: Text(value),),
                ),
              ),
      ),
    );
  }
}

class FindZoneTextField extends StatelessWidget {
  const FindZoneTextField({
    super.key,
    required this.zoneCubit,
    required TextEditingController zoneSearchText,
  }) : _zoneSearchText = zoneSearchText;

  final ZoneCubit zoneCubit;
  final TextEditingController _zoneSearchText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      onChanged: (value) => zoneCubit.findZone(value),
      controller: _zoneSearchText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(width: 1, color: Colors.white70), //<-- SEE HERE
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(borderSide: const BorderSide(
            color: Colors.white70, width: 5), borderRadius: BorderRadius.circular(20.0)),
        // errorText: errorText,
        hintText: 'nazwa strefy',
        // icon: icon,
      ),
    );
  }
}
