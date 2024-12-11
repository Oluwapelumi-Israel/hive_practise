import 'package:bank_app/features/auth/domain_layer/entity/user_details.dart';
import 'package:bank_app/features/auth/domain_layer/entity/user_uid.dart';

abstract interface class AuthRepository
{
  Future<UserUid> signUpWithEmailAndPasswordDomain({required Map<String, dynamic> user});
  Future<UserDetails> loginWithEmailAndPasswordDomain({required String email, required String password});
}