import 'package:bank_app/features/auth/domain_layer/entity/user_details.dart';
import '../../repository/auth_repository.dart';
import '../abstractUsecase/abstract_login.dart';

class LoginUsesImpl implements LoginUses
{
  final AuthRepository authRepository;
  LoginUsesImpl({required this.authRepository});

  @override
  Future<UserDetails> loginWithEmailAndPasswordUses({required String email, required String password}) async {
    final userDetails = await authRepository.loginWithEmailAndPasswordDomain(email: email, password: password);

    return userDetails;
  }


}