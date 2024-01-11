import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:industry_maintenance_app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:industry_maintenance_app/core/widgets/bottom_app_bar/bottom_bar_item.dart';
import 'package:industry_maintenance_app/core/widgets/bottom_app_bar/custom_bottom_app_bar.dart';
import 'package:industry_maintenance_app/core/widgets/lists/my_list_card.dart';
import 'package:industry_maintenance_app/core/widgets/lists/my_list_view.dart';
import 'package:industry_maintenance_app/core/widgets/my_drawer.dart';
import 'package:industry_maintenance_app/core/widgets/my_end_drawer/presentation/pages/my_end_drawer.dart';
import 'package:industry_maintenance_app/core/widgets/text_fields/find_text_field.dart';
import 'package:industry_maintenance_app/features/department_page/domain/entities/department.dart';
import 'package:industry_maintenance_app/features/department_page/presentation/department_cubit/department_cubit.dart';

class DepartmentPage extends HookWidget {
  const DepartmentPage({
    required this.zoneName,
    required this.uid,
    super.key,
  });

  final String uid;
  final String zoneName;

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final factoryPath = ['rejony', zoneName];

    final departmentSearchText = useTextEditingController();

    final departmentCubit = useBloc<DepartmentCubit>();
    final departmentState = useBlocBuilder(departmentCubit);

    useActionListener(
      departmentCubit,
      (action) => action.mapOrNull(
        showSnackbar: (value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(value.message),
              backgroundColor: value.isError ? Colors.red : Colors.green,
            ),
          );
        },
        openDepartament: (value) {
          context.pushNamed(
            'department_page',
            pathParameters: {
              'uid': uid,
              'zoneName': zoneName,
            },
          );
        },
      ),
    );

    useEffect(
      () {
        departmentCubit.departmentInit(
          userID: uid,
          zoneName: zoneName,
        );
        return null;
      },
      [departmentCubit],
    );

    return Scaffold(
      appBar: CustomAppBar(
        uid: uid,
        appBarTitle: zoneName,
        autoLeading: true,
        scaffoldKey: scaffoldKey,
      ),
      drawer: MyDrawer(
        factoryPath: factoryPath,
        uid: uid,
      ),
      endDrawer: const MyEndDrawer(),
      bottomNavigationBar: CustomBottomAppBar(
        items: [
          BottomBarItem(
            onPressed: () {
              context.goNamed(
                'add_department_page',
                pathParameters: {
                  'uid': uid,
                  'zoneName': zoneName,
                },
              );
            },
            icon: Icons.add,
          ),
          BottomBarItem(
            onPressed: () {
              departmentSearchText.clear();
              departmentCubit.findDepartment(departmentSearchText.text);
            },
            icon: Icons.search,
          ),
          BottomBarItem(
            onPressed: () {
              context.goNamed(
                'main_page',
                pathParameters: {
                  'uid': uid,
                  'zoneName': zoneName,
                },
              );
            },
            icon: Icons.home,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          child: departmentState.whenOrNull(
            searchDepartmentSuccess: (departmentList) => Column(
              children: [
                FindTextField(
                  onChanged: (value) => departmentCubit.findDepartment(value),
                  onClear: () => departmentCubit.departmentInit(
                    userID: uid,
                    zoneName: zoneName,
                  ),
                  controller: departmentSearchText,
                  hintText: 'Szukaj departamentu',
                ),
                _DepartamentListView(
                  uid: uid,
                  departamentList: departmentList,
                ),
              ],
            ),
            loadingSuccess: (departmentList, user) => _DepartamentListView(
              uid: uid,
              departamentList: departmentList,
            ),
            loadingDepartments: () =>
                const Center(child: CircularProgressIndicator()),
            loadingError: (value) => Center(child: Text(value)),
            departmentPageEmpty: (value) => Center(
              child: Text(value),
            ),
          ),
        ),
      ),
    );
  }
}

class _DepartamentListView extends StatelessWidget {
  const _DepartamentListView({
    required this.uid,
    required this.departamentList,
  });

  final String uid;
  final List<Department>? departamentList;

  @override
  Widget build(BuildContext context) {
    return MyListView(
      itemCount: departamentList?.length,
      itemBuilder: (context, index) {
        final zone = departamentList?[index];
        return MyListCard(
          onTap: () {
            context.goNamed(
              'department_page',
              pathParameters: {
                'uid': uid,
                'zoneName': zone?.zoneName ?? '',
              },
            );
          },
          name: zone?.zoneName ?? '',
        );
      },
    );
  }
}
