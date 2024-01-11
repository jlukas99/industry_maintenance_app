import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  const MyListView({
    required this.itemCount,
    required this.itemBuilder,
    super.key,
  });

  final int? itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 180.0,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      padding: const EdgeInsets.symmetric(vertical: 16),
    );
  }
}
