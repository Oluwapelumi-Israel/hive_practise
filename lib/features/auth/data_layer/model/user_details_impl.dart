import 'package:bank_app/features/auth/domain_layer/entity/user_details.dart';

class UserDetailsImpl extends UserDetails {
  UserDetailsImpl({required super.user, required super.error});

  factory UserDetailsImpl.fromJson(
      {required String error, required List<dynamic> json}) {
    return UserDetailsImpl(error: error, user: json);
  }
}
