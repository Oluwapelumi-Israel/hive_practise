import 'package:bank_app/features/auth/data_layer/auth_remote_datasource.dart';
import 'package:bank_app/features/auth/data_layer/model/user_details_impl.dart';
import 'package:bank_app/features/auth/data_layer/model/user_uid_impl.dart';
import 'package:bank_app/features/auth/domain_layer/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository
{
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  
  @override
  Future<UserDetailsImpl> loginWithEmailAndPasswordDomain({required String email, required String password}) async{
     final user = await authRemoteDataSource.loginWithEmailAndPassword(email: email, password: password);

     return user;
  }

  @override
  Future<UserUidImpl> signUpWithEmailAndPasswordDomain({required Map<String, dynamic> user}) async {
    final userUid = await authRemoteDataSource.signUpWithUserDetails(userDetails: user);

    return userUid;
  }
  
}