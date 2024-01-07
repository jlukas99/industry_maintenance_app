import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:industry_maintenance_app/core/my_widgets/my_app_bar/presentation/pages/my_app_bar.dart';

class DepartmentPage extends HookWidget {
  final String? uid;
  final String zoneName;
  const DepartmentPage({Key? key, required this.zoneName, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(70), child:
          CustomAppBar(
            uid: uid,
            appBarTitle: zoneName,
            autoLeading: true,
            scaffoldKey: _scaffoldKey),
    )
    );
  }
}
