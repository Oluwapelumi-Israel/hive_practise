import 'package:bank_app/features/auth/presentation_layer/cubit/auth_user_cubit.dart';
import 'package:bank_app/features/auth/presentation_layer/cubit/auth_user_state.dart';
import 'package:bank_app/features/auth/presentation_layer/pages/mobile/mobile_portrait/home_page.dart';
import 'package:bank_app/features/auth/presentation_layer/pages/mobile/mobile_portrait/mobile_signup_portrait.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theme.dart';

class MobileLoginPortrait extends StatefulWidget {
  const MobileLoginPortrait({super.key});

  @override
  State<MobileLoginPortrait> createState() => _MobileLoginPortraitState();
}

class _MobileLoginPortraitState extends State<MobileLoginPortrait> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userLogin = BlocProvider.of<AuthUsers>(context);
    return BlocConsumer<AuthUsers, AuthUserState>(
      listener: (context, state) {
        if (state is AuthSignInSuccess) {
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (context) {
                return const HomePage();
              },
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sign In.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "Email",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [AppPalette.gradient1, AppPalette.gradient2],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      userLogin.loginWithEmailAndPasswordCubit(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                    },
                    style: ElevatedButton.styleFrom(),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) {
                              return const MobileSignupPortrait();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 18, color: AppPalette.gradient2),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
