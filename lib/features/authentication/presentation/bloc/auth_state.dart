part of 'auth_bloc.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthAuthenticated extends AuthState {
  final User user;

  AuthAuthenticated(this.user);
}

final class AuthUnauthenticated extends AuthState {}

final class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

final class ForgotPasswordLoading extends AuthState {}

final class ForgotPasswordSuccess extends AuthState {}

final class ForgotPasswordFailed extends AuthState {
  final String message;

  ForgotPasswordFailed(this.message);
}

final class ResetPasswordLoading extends AuthState {}

final class ResetPasswordSuccess extends AuthState {}

final class ResetPasswordFailed extends AuthState {
  final String message;

  ResetPasswordFailed(this.message);
}
