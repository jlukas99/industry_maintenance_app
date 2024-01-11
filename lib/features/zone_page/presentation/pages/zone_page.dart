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
import 'package:industry_maintenance_app/features/zone_page/domain/entities/zone.dart';
import 'package:industry_maintenance_app/features/zone_page/presentation/bloc/zone_cubit.dart';

class ZonePage extends HookWidget {
  const ZonePage({
    required this.uid,
    super.key,
  });

  final String uid;

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    final showFindTextField = useState<bool>(false);
    final zoneSearchText = useTextEditingController();
    final factoryPath = ['rejony'];

    final zoneCubit = useBloc<ZoneCubit>();
    final zoneState = useBlocBuilder(zoneCubit);

    useActionListener(
      zoneCubit,
      (action) => action.mapOrNull(
        openPage: (value) => context.pushNamed(
          value.path,
          pathParameters: {'uid': uid},
        ),
        toggleSearch: (_) {
          showFindTextField.value = !showFindTextField.value;
          zoneSearchText.clear();
        },
      ),
    );

    /// call on start page initZonePage function from zoneCubit to fetch zones and get user
    useEffect(
      () {
        zoneCubit.initZonePage(userID: uid);
        return null;
      },
      [zoneCubit],
    );

    final bottomNavigationItems = [
      BottomBarItem(
        onPressed: () => zoneCubit.openPage('add_factory_zone'),
        icon: Icons.add,
      ),
      BottomBarItem(
        onPressed: () => zoneCubit.toggleSearch(),
        icon: Icons.search,
      ),
      BottomBarItem(
        onPressed: () => zoneCubit.openPage('main_page'),
        icon: Icons.home,
      ),
    ];

    return Scaffold(
      key: scaffoldKey,
      drawer: MyDrawer(factoryPath: factoryPath, uid: uid),
      endDrawer: const MyEndDrawer(),
      appBar: CustomAppBar(
        scaffoldKey: scaffoldKey,
        uid: uid,
        appBarTitle: 'REJONY',
        autoLeading: true,
      ),
      bottomNavigationBar: CustomBottomAppBar(
        items: bottomNavigationItems,
      ),
      body: Column(
        children: [
          if (showFindTextField.value)
            FindTextField(
              hintText: 'Szukaj strefy',
              onChanged: zoneCubit.findZone,
              onClear: () => zoneCubit.toggleSearch(),
              controller: zoneSearchText,
            ),
          Expanded(
            child: zoneState.maybeWhen(
              zonePageInitialized: (zoneList, user) =>
                  _ZoneListView(uid: uid, zoneList: zoneList),
              zonePageError: (value) => _InfoState(text: value),
              zonePageIsEmpty: (value) => _InfoState(text: value),
              orElse: () => const _LoadingState(),
            ),
          ),
        ],
      ),
    );
  }
}

// Obstawiam ze na kazdej stronie bedzie taki sam wiec mozna wrzucic do globalnych widgetow, tak samo info
class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _InfoState extends StatelessWidget {
  const _InfoState({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text));
  }
}

class _ZoneListView extends StatelessWidget {
  const _ZoneListView({
    required this.uid,
    required this.zoneList,
  });

  final List<FactoryZone>? zoneList;
  final String? uid;

  @override
  Widget build(BuildContext context) {
    return MyListView(
      itemCount: zoneList?.length,
      itemBuilder: (context, index) {
        final zone = zoneList?[index];
        return MyListCard(
          onTap: () {
            context.goNamed(
              'department_page',
              pathParameters: {
                'uid': uid!,
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
