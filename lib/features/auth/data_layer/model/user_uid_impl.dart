import '../../domain_layer/entity/user_uid.dart';

class UserUidImpl extends UserUid {
  UserUidImpl({required super.error, required super.userUid});

  factory UserUidImpl.fromJson(
      {required String error, required Map<String, dynamic> json}) {
    return UserUidImpl(error: error, userUid: json);
  }
}
