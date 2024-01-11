import 'package:flutter/material.dart';

class AuthTextControllers {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userSurNameController = TextEditingController();

  final TextEditingController authPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  final TextEditingController loginController = TextEditingController();
  final TextEditingController loginAuthController = TextEditingController();

  Future<void> clearAllControllers() async {
    userNameController.clear();
    userSurNameController.clear();
    authPasswordController.clear();
    loginController.clear();
    loginPasswordController.clear();
    confirmPasswordController.clear();
    loginAuthController.clear();
  }
}
