

import 'package:bank_app/features/auth/domain_layer/entity/user_uid.dart';
import 'package:bank_app/features/auth/domain_layer/usecases/abstractUsecase/abstract_signup.dart';

import '../../repository/auth_repository.dart';

class SignupUsesImpl implements SignupUses
{
  final AuthRepository authRepository;
  SignupUsesImpl({required this.authRepository});

  @override
  Future<UserUid> signUpWithDetailsUses({required Map<String, dynamic> data}) async {
     final userUid = await authRepository.signUpWithEmailAndPasswordDomain(user: data);

     return userUid;
  }

}