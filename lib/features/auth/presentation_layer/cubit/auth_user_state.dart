sealed class AuthUserState {}

final class AuthUserInitial extends AuthUserState {}

final class AuthLoading extends AuthUserState {}

final class AuthSignUpError extends AuthUserState {
  final String error;
  AuthSignUpError({required this.error});
}

final class AuthSignUpSuccess extends AuthUserState {
  final Map<String, dynamic> userUid;
  AuthSignUpSuccess({required this.userUid});
}

final class AuthSignInError extends AuthUserState {
  final String error;
  AuthSignInError({required this.error});
}

final class AuthSignInSuccess extends AuthUserState {
  final List<dynamic> user;
  AuthSignInSuccess({required this.user});
}
