import 'package:bank_app/features/auth/domain_layer/entity/user_details.dart';


abstract interface class LoginUses {
  Future<UserDetails> loginWithEmailAndPasswordUses({required String email, required String password});
}