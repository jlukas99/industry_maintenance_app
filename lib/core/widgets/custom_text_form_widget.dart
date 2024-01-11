import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    // required this.errorText,
    required this.keyName,
    required this.icon,
    required this.hintText,
    required this.controller,
    required this.obscure,
    super.key,
  });
  // final String? errorText;
  final TextEditingController controller;
  final String keyName;
  final Icon icon;
  final String hintText;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: TextFormField(
          obscureText: obscure,
          autocorrect: false,
          maxLines: 1,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.white70,
              ), //<-- SEE HERE
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white70,
                width: 5,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            // errorText: errorText,
            hintText: hintText,
            // icon: icon,
          ),
          key: Key(keyName),
          controller: controller,

          // onChanged: (value) {
          //   if (keyName == 'userName') {
          //     context.read<AuthCubit>().userNameChanged(controller.text);
          //   } else if (keyName == 'userSurName') {
          //     context.read<AuthCubit>().userSurNameChanged(controller.text);
          //   } else if (keyName == 'userLogin') {
          //     context.read<AuthCubit>().loginChanged(controller.text);
          //   } else if (keyName == 'userLoginPassword') {
          //     context.read<AuthCubit>().passwordChanged(controller.text);
          //   }else if (keyName == 'userAuthPassword') {
          //     context.read<AuthCubit>().authPasswordChanged(controller.text);
          //   }else if (keyName == 'confirmPassword') {
          //     context.read<AuthCubit>().confirmPasswordChanged(controller.text);
          //   }else if (keyName == 'userAuthLogin') {
          //     context.read<AuthCubit>().authLoginChanged(controller.text);
          //   }
          // },
        ),
      ),
    );
  }
}
