class AuthErrorHandling implements Exception {
  final Map<String, dynamic> message;

  AuthErrorHandling({required this.message});
}