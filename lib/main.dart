import 'package:bank_app/core/theme.dart';
import 'package:bank_app/features/auth/presentation_layer/pages/tablet/tablet_landscape/tablet_login_landscape.dart';
import 'package:bank_app/features/auth/presentation_layer/pages/tablet/tablet_portrait/tablet_login_portrait.dart';
import 'package:bank_app/layout_requirement/orientation_type.dart';
import 'package:bank_app/layout_requirement/screen_type.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/data_layer/auth_remote_datasource.dart';
import 'features/auth/data_layer/auth_repository_implementation.dart';
import 'features/auth/domain_layer/usecases/abstractUsecaseImpl/abstract_login_impl.dart';
import 'features/auth/domain_layer/usecases/abstractUsecaseImpl/abstract_signup_impl.dart';
import 'features/auth/presentation_layer/cubit/auth_user_cubit.dart';
import 'features/auth/presentation_layer/pages/mobile/mobile_landscape/mobile_login_landscape.dart';
import 'features/auth/presentation_layer/pages/mobile/mobile_portrait/mobile_login_portrait.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (BuildContext context) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return AuthUsers(
          loginUses: LoginUsesImpl(
            authRepository: AuthRepositoryImpl(
              authRemoteDataSource: AuthRemoteDataSourceImpl(),
            ),
          ),
          signupUses: SignupUsesImpl(
            authRepository: AuthRepositoryImpl(
              authRemoteDataSource: AuthRemoteDataSourceImpl(),
            ),
          ),
        );
      },
      child: MaterialApp(
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: AppPalette.backgroundColor,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppPalette.transparentColor,
                shadowColor: AppPalette.transparentColor,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.all(20.0),
            hintStyle: const TextStyle(
              color: AppPalette.borderColor,
              fontSize: 18,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppPalette.gradient2,
                width: 2.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppPalette.borderColor,
                width: 2.5,
              ),
            ),
          ),
        ),
        home: const ScreenType(
          mobile: OrientationType(
            landscape: MobileLoginLandscape(),
            portrait: MobileLoginPortrait(),
          ),
          tablet: OrientationType(
            landscape: TabletLoginLandscape(),
            portrait: TabletLoginPortrait(),
          ),
        ),
      ),
    );
  }
}
