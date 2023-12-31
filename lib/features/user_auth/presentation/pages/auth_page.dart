import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:industry_maintenance_app/core/my_widgets/custom_snackbar_widget.dart';
import 'package:industry_maintenance_app/features/user_auth/domain/usecases/create_user_usecase.dart';
import 'package:industry_maintenance_app/features/user_auth/presentation/bloc/auth_cubit/auth_cubit.dart';


import '../../../../core/classes/text_controllers.dart';
import '../../../../core/my_widgets/custom_text_form_widget.dart';

class AuthPage extends HookWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ///text controllers class on auth page
    final authTextControllers = AuthTextControllers();
    final snackBars = MySnackBar();

    final authCubit = useBloc<AuthCubit>();
    final authState = useBlocBuilder(authCubit);
    useBlocListener<AuthCubit, AuthState>(authCubit, (authCubit, current, context) {
      current.whenOrNull(
        loginFailed: (value) => snackBars.showSnackBar(value, context),
      );
    });

    ///controller = my AuthController();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        authState.maybeWhen(
                            initial: () => 'Logowanie',
                            orElse: () => 'Rejestracja')
                        , style: const TextStyle(fontSize: 25.0),),
                      const SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Column(
                          children: [
                            authState.maybeWhen(
                              initial: () => AuthTextField(
                                  icon: const Icon(Icons.person),
                                  keyName: 'userLogin',
                                  hintText: 'e-mail',
                                  controller: authTextControllers.loginController,
                                  // errorText: state.userLoginValidation ? null : 'Błąd',
                                  obscure: false,
                                  ),
                            orElse: () => AuthTextField(
                                    icon: const Icon(Icons.person),
                                    keyName: 'userAuthLogin',
                                    hintText: 'e-mail',
                                    controller: authTextControllers.loginAuthController,
                                    // errorText: state.authLoginValidation ? null : 'Błąd',
                                    obscure: false,
                                    ),),
                            // controller.authOrLoginPage.value == 'login' ?
                              authState.maybeWhen(
                                initial: () => AuthTextField(
                                  icon: const Icon(Icons.lock_outline),
                                  keyName: 'userLoginPassword',
                                  hintText: 'hasło',
                                  controller: authTextControllers.loginPasswordController,
                                  // errorText: state.userLoginPasswordValidation ? null : 'Upps...coś poszło nie tak.',
                                  obscure: true,
                                ),
                              orElse: () => AuthTextField(
                                  icon: const Icon(Icons.lock_outline),
                                  keyName: 'userAuthPassword',
                                  hintText: 'hasło',
                                  controller: authTextControllers.authPasswordController,
                                  // errorText: state.userAuthPasswordValidation ? null : 'Upps...coś poszło nie tak.',
                                  obscure: true,
                                  ),)
                          ],
                        ),
                      ),
                      authState.maybeWhen(
                          isAuthPage: () => Padding(padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              children: [
                                AuthTextField(
                                  keyName: 'confirmPassword',
                                  icon: const Icon(Icons.lock_sharp),
                                  hintText: 'powtórz hasło',
                                  controller: authTextControllers.confirmPasswordController,
                                  // errorText: state.confirmPasswordValidation ? null : 'Błąd',
                                  obscure: true,
                                ),
                                AuthTextField(
                                  keyName: 'userName',
                                  icon: const Icon(Icons.short_text_outlined),
                                  hintText: 'imię',
                                  controller: authTextControllers.userNameController,
                                  // errorText: state.userNameValidation ? null : 'Upps...coś poszło nie tak.',
                                  obscure: false,
                                ),
                                AuthTextField(
                                  keyName: 'userSurName',
                                  icon: const Icon(Icons.short_text_outlined),
                                  hintText: 'nazwisko',
                                  controller: authTextControllers.userSurNameController,
                                  // errorText: null,
                                  obscure: false,
                                )
                              ],
                            ),),
                          orElse: () => const SizedBox()),
                      const SizedBox(height: 40.0,),
                      CupertinoButton(
                        color: Colors.black,
                        onPressed: () async{

                          authState.maybeWhen(
                          initial: () => authCubit.loginUser('dd', 'bb'),
                          orElse: (){});

                        }, child: Text(
                            authState.maybeWhen(
                              initial: ()=> 'Zaloguj',
                            isAuthPage: () => 'Zarejestruj',
                            orElse: () => ''),
                      ),
                      ),
                    ],

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                    authState.maybeWhen(
                        initial: () => 'Nie masz konta',
                        isAuthPage: () => 'Masz już konto',
                       orElse: () => ''),
                      ),
                      const SizedBox(width: 20.0,),
                      InkWell(
                        child: Text(
                        authState.maybeWhen(
                          initial: () => 'Zarejestruj się',
                        isAuthPage: () => 'Zaloguj się',
                        orElse: () => ''),
                          style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.w600),),
                        onTap: () {
                          authState.maybeWhen(
                            initial: () =>  authCubit.authPage(),
                          isAuthPage: () => authCubit.loginPage(),
                          orElse: () => authCubit.authPage());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}









