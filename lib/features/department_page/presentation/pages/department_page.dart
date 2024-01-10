import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:industry_maintenance_app/core/my_widgets/myDrawer.dart';
import 'package:industry_maintenance_app/core/my_widgets/my_app_bar/presentation/pages/my_app_bar.dart';
import 'package:industry_maintenance_app/features/department_page/presentation/department_cubit/department_cubit.dart';

import '../../../../core/my_widgets/my_end_drawer/presentation/pages/my_end_drawer.dart';
import '../../domain/entities/department.dart';

class DepartmentPage extends HookWidget {
  final String? uid;
  final String zoneName;
  const DepartmentPage({Key? key, required this.zoneName, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final departmentCubit = useBloc<DepartmentCubit>();
    final departmentState = useBlocBuilder(departmentCubit);
    useBlocListener<DepartmentCubit, DepartmentState>(departmentCubit, (bloc, current, context) { });

    final _departmentSearchText = useTextEditingController();

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    final List _factoryPath = ['rejony', zoneName];


    useEffect(() {
      departmentCubit.departmentInit(userID: uid, zoneName: zoneName);
      return null;
    },
      [departmentCubit],
    );

    return Scaffold(
      key:_scaffoldKey,
      appBar: PreferredSize(preferredSize: const Size.fromHeight(70), child:
          CustomAppBar(
            uid: uid,
            appBarTitle: zoneName,
            autoLeading: true,
            scaffoldKey: _scaffoldKey),
    ),
      drawer: MyDrawer(factoryPath: _factoryPath, uid: uid!),
      endDrawer: const MyEndDrawer(),
      bottomNavigationBar: BottomAppBar(
        height: 80.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: (){
              // context.pushNamed('add_department_page', pathParameters: {'uid' : uid!});
            }, icon: const Icon(Icons.add, size: 40,)),
            IconButton(onPressed: (){
              _departmentSearchText.text = '';
              departmentCubit.findDepartment('');
            }, icon: const Icon(Icons.search, size: 40,)),
            IconButton(onPressed: (){
              context.goNamed('main_page', pathParameters: {'uid': uid!});
            }, icon: const Icon(Icons.home, size: 40,)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          child: departmentState.whenOrNull(
            searchDepartmentSuccess: (departmentList) => Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Column(
                  children: [
                    Expanded(flex:1,child:
                    FindZoneTextField(departmentCubit: departmentCubit, departmentSearchText: _departmentSearchText)),
                    Expanded(
                      flex:7,
                      child: ListView.builder(
                        itemExtent: 180.0,
                        itemCount: departmentList.length,
                        itemBuilder: (BuildContext context, int index) {
                          Department department = departmentList[index];
                          return GestureDetector(
                            onTap: (){
                              // context.pushNamed('department_page', pathParameters: {'uid': uid!, 'zoneName' : zone.zoneName});
                              departmentCubit.departmentInit(userID: uid, zoneName: zoneName);
                            },
                            child: Card(child: Row(
                              children: [
                                const SizedBox(width: 10.0,),
                                const CircleAvatar(backgroundColor: Colors.white12, radius: 55, child: Icon(Icons.electric_bolt_outlined, size: 60,),),
                                const SizedBox(width: 20.0,),
                                Text(department.departmentName.toUpperCase(), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w200),),
                              ],),),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                IconButton(onPressed: (){
                  departmentCubit.departmentInit(userID: uid, zoneName: zoneName);
                }, icon: const Icon(Icons.backspace, size: 40,)),
              ],
            ),
            loadingDepartments: () => const Center(child: CircularProgressIndicator()),
            loadingError: (value) => Center(child: Text(value)),
            loadingSuccess: (departmentList, user) => ListView.builder(
              itemExtent: 180.0,
              itemCount: departmentList!.length,
              itemBuilder: (BuildContext context, int index) {
                Department department = departmentList[index];
                return GestureDetector(
                  onTap: (){
                    // context.pushNamed('department_page', pathParameters: {'uid': uid!, 'zoneName' : zone.zoneName});
                  },
                  child: Card(child: Row(
                    children: [
                      const SizedBox(width: 10.0,),
                      const CircleAvatar(backgroundColor: Colors.white12, radius: 55, child: Icon(Icons.electric_bolt_outlined, size: 60,),),
                      const SizedBox(width: 20.0,),
                      Text(department.departmentName.toUpperCase(), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w200),),
                    ],),),
                );
              },
            ),
            departmentPageEmpty: (value) => Center(child: Text(value),),
          ),
        ),
      ),
    );
  }
}

class FindZoneTextField extends StatelessWidget {
  const FindZoneTextField({
    super.key,
    required this.departmentCubit,
    required TextEditingController departmentSearchText,
  }) : _departmentSearchText = departmentSearchText;

  final DepartmentCubit departmentCubit;
  final TextEditingController _departmentSearchText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      onChanged: (value) => departmentCubit.findDepartment(value),
      controller: _departmentSearchText,
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