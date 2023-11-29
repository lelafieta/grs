abstract class AuthState {}

class AuthInitial extends AuthState {}

class AppStartState extends AuthState {}

class AuthLoading extends AuthState {}

class AuthCheckVersion extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthSuccessToken extends AuthState {
  final String token;

  AuthSuccessToken(this.token);
}

class AuthFailure extends AuthState {
  final String error;
  final int code;

  AuthFailure(this.error, this.code);
}

class AuthLogout extends AuthState {}

class AuthNotLoggedState extends AuthState {}

class AuthResetCode extends AuthState {
  final String identfyed;

  AuthResetCode({required this.identfyed});
}
