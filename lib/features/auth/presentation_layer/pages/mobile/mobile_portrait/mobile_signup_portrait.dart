import 'package:bank_app/features/auth/presentation_layer/cubit/auth_user_cubit.dart';
import 'package:bank_app/features/auth/presentation_layer/cubit/auth_user_state.dart';
import 'package:bank_app/features/auth/presentation_layer/pages/mobile/mobile_portrait/mobile_login_portrait.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/theme.dart';

class MobileSignupPortrait extends StatefulWidget {
  const MobileSignupPortrait({super.key});

  @override
  State<MobileSignupPortrait> createState() => _MobileSignupPortraitState();
}

class _MobileSignupPortraitState extends State<MobileSignupPortrait> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose()
  {
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authUsers = BlocProvider.of<AuthUsers>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPalette.transparentColor,
      ),
      body: BlocConsumer<AuthUsers, AuthUserState>(
        listener: (context, state) {
          if(state is AuthSignUpSuccess)
            {
              return Navigator.pop(context);
            }
        },
        builder: (context, state) {
          if(state is AuthLoading)
            {
              return const Center(child: CircularProgressIndicator(),);
            }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sign Up.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: firstnameController,
                    decoration: const InputDecoration(
                      hintText: "First name",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: lastnameController,
                    decoration: const InputDecoration(
                      hintText: "Last name",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                        Map<String, dynamic> data = {
                            "firstname": firstnameController.text.trim(),
                            "lastname": lastnameController.text.trim(),
                            "email": emailController.text.trim(),
                            "password": passwordController.text.trim()
                        };
                        authUsers.signUpUsersWithDetails(data: data);
                      },
                      style: ElevatedButton.styleFrom(),
                      child: const Text(
                        "Sign Up",
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
                        "Already have an account?",
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
                                return const MobileLoginPortrait();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 18,
                              color: AppPalette.gradient2
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
