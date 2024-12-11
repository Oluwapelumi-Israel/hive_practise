import 'package:bank_app/features/auth/domain_layer/entity/user_uid.dart';

abstract interface class SignupUses {
  Future<UserUid> signUpWithDetailsUses({required Map<String, dynamic> data});
}