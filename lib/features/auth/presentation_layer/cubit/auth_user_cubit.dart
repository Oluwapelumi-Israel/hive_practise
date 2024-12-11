import 'package:bank_app/features/auth/domain_layer/usecases/abstractUsecase/abstract_login.dart';
import 'package:bank_app/features/auth/domain_layer/usecases/abstractUsecase/abstract_signup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_user_state.dart';

class AuthUsers extends Cubit<AuthUserState>
{
  final LoginUses loginUses;
  final SignupUses signupUses;
  AuthUsers({required this.loginUses, required this.signupUses}):super(AuthUserInitial());

  Future<void> signUpUsersWithDetails({required Map<String, dynamic> data}) async
  {
    emit(AuthLoading());
    final userUid = await signupUses.signUpWithDetailsUses(data: data);
    if(userUid.error == "")
      {
        emit(AuthSignUpSuccess(userUid: userUid.userUid));
      }
    else
      {
        emit(AuthSignUpError(error: userUid.error));
      }
  }

  Future<void> loginWithEmailAndPasswordCubit({required String email, required String password}) async
  {
    emit(AuthLoading());
    final user = await loginUses.loginWithEmailAndPasswordUses(email: email, password: password);
    if(user.error == "")
    {
      emit(AuthSignInSuccess(user: user.user));
    }
    else
    {
      emit(AuthSignInError(error: user.error));
    }
  }
}