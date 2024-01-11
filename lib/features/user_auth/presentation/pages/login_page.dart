import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:industry_maintenance_app/core/widgets/custom_snackbar_widget.dart';
import 'package:industry_maintenance_app/core/widgets/custom_text_form_widget.dart';
import 'package:industry_maintenance_app/features/user_auth/presentation/bloc/login_cubit/login_cubit.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final snackBar = MySnackBar();
    final loginController = TextEditingController();
    final passwordController = TextEditingController();

    final loginCubit = useBloc<LoginCubit>(closeOnDispose: false);
    final loginState = useBlocBuilder(loginCubit);
    useBlocListener<LoginCubit, LoginState>(loginCubit,
        (loginCubit, current, context) {
      current.whenOrNull(
        loginFailure: (value) => snackBar.showSnackBar(value, context),
        loginSuccess: (value) async {
          await Future.delayed(const Duration(seconds: 2), () {
            if (context.mounted) {
              context.goNamed('main_page', pathParameters: {'uid': value});
            }
          });
        },
      );
    });

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthTextField(
              keyName: 'login',
              icon: const Icon(Icons.person),
              hintText: 'login',
              controller: loginController,
              obscure: false,
            ),
            const SizedBox(
              height: 20.0,
            ),
            AuthTextField(
              keyName: 'password',
              icon: const Icon(Icons.lock),
              hintText: 'hasło',
              controller: passwordController,
              obscure: true,
            ),
            const SizedBox(
              height: 40.0,
            ),
            loginState.when(
              initial: () => CupertinoButton(
                onPressed: () {
                  loginCubit.loginUser(
                    userPassword: passwordController.text,
                    userLogin: loginController.text,
                  );
                },
                child: const Text('Zaloguj'),
              ),
              loginProgress: () => const CircularProgressIndicator(),
              loginSuccess: (_) => const Icon(
                Icons.check_circle,
                color: Colors.lightGreen,
                size: 40.0,
              ),
              loginFailure: (_) => const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
