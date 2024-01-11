import 'package:flutter/material.dart';

class FindTextField extends StatelessWidget {
  const FindTextField({
    required this.hintText,
    required this.onChanged,
    required this.controller,
    required this.onClear,
    super.key,
  });

  final String hintText;
  final TextEditingController controller;

  final void Function(String) onChanged;
  final void Function() onClear;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        autofocus: true,
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          suffix: GestureDetector(
            onTap: onClear,
            child: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.backspace_rounded,
                size: 20,
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Colors.white70,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          // errorText: errorText,
          hintText: hintText,
          // icon: icon,
        ),
      ),
    );
  }
}
