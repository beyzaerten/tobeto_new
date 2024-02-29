import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class Initial extends AuthState {}

class NotAuthenticated extends AuthState {
  String? errorMessage;
  NotAuthenticated({
    this.errorMessage,
  });
}

class Authenticated extends AuthState {
  User? user;
  Authenticated({
    this.user,
  });
}

class AuthLoggedOut extends AuthState {}

class InformationState extends AuthState {
  final String userName;

  InformationState({required this.userName});
}

// class PasswordChangedSuccessfully extends AuthState {}

// class PasswordChangeFailed extends AuthState {
//   String errorMessage;

//   PasswordChangeFailed(this.errorMessage);
// }
