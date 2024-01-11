import 'package:flutter/material.dart';

class MyListCard extends StatelessWidget {
  const MyListCard({
    required this.onTap,
    required this.name,
    super.key,
  });

  final VoidCallback onTap;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Row(
          children: [
            const SizedBox(width: 10.0),
            const CircleAvatar(
              backgroundColor: Colors.white12,
              radius: 55,
              child: Icon(
                Icons.electric_bolt_outlined,
                size: 60,
              ),
            ),
            const SizedBox(width: 20.0),
            Text(
              name.toUpperCase(),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w200),
            ),
          ],
        ),
      ),
    );
  }
}
