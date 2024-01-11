import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:industry_maintenance_app/core/widgets/bottom_app_bar/bottom_bar_item.dart';

class CustomBottomAppBar extends HookWidget {
  const CustomBottomAppBar({
    required this.items, super.key,
  });

  final List<BottomBarItem> items;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: kBottomNavigationBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items,
      ),
    );
  }
}
