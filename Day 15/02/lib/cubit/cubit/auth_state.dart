sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoginSuccess extends AuthState {}

final class AuthRegisterSuccess extends AuthState {}

final class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
