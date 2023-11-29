abstract class AuthEvent {
  const AuthEvent();
}

class AppLoadedEvent extends AuthEvent {}

class AppInitialEvent extends AuthEvent {}

class AuthLoginRequestedEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequestedEvent({required this.email, required this.password});
}

class AuthCheckCodeEvent extends AuthEvent {
  final String identfyed;
  final String code;

  AuthCheckCodeEvent({required this.identfyed, required this.code});
}

class UserLoggedOutEvent extends AuthEvent {}

class AuthCheckTokenEvent extends AuthEvent {}

class AuthResetCodeEventEvent extends AuthEvent {
  final String identfyed;
  final String phoneCode;

  AuthResetCodeEventEvent({required this.phoneCode, required this.identfyed});
}
