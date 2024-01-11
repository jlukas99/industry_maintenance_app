import 'package:flutter/material.dart';

class MySnackBar{
  Future<void> showSnackBar(String message, BuildContext context) async{
    final snackBar = SnackBar(content: Text(message), backgroundColor: Colors.black,);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
