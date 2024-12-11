import 'dart:convert';

import 'package:bank_app/core/ErrorHandling/auth_error_handling.dart';
import 'package:bank_app/features/auth/data_layer/model/user_details_impl.dart';
import 'package:bank_app/features/auth/data_layer/model/user_uid_impl.dart';
import 'package:http/http.dart' as http;

abstract interface class AuthRemoteDataSource {
  Future<UserUidImpl> signUpWithUserDetails(
      {required Map<String, dynamic> userDetails});

  Future<UserDetailsImpl> loginWithEmailAndPassword(
      {required String email, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserDetailsImpl> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/signin'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          {'email': email, 'password': password},
        ),
      );

      if (response.statusCode == 400) {
        throw AuthErrorHandling(message: jsonDecode(response.body));
      }
      List<dynamic> jsonUser = jsonDecode(response.body);
      UserDetailsImpl res = UserDetailsImpl.fromJson(error: "", json: jsonUser);
      return res;
    } on AuthErrorHandling catch (e) {
      return UserDetailsImpl(error:AuthErrorHandling(message: e.message).message['message'], user: []);
    }
  }



  @override
  Future<UserUidImpl> signUpWithUserDetails(
      {required Map<String, dynamic> userDetails}) async {
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          {
            'email': userDetails['email'],
            'password': userDetails['password'],
            'firstname': userDetails['firstname'],
            'lastname': userDetails['lastname']
          },
        ),
      );

      if (response.statusCode == 400) {
        throw AuthErrorHandling(message: jsonDecode(response.body));
      }
      UserUidImpl userUid = UserUidImpl.fromJson(error: "", json: jsonDecode(response.body));
      return userUid;
    } on AuthErrorHandling catch (e) {
      return UserUidImpl(error: AuthErrorHandling(message: e.message).message['message'], userUid: {});
    }
  }
}
