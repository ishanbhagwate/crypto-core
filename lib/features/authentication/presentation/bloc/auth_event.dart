part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AppStarted extends AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested(this.email, this.password);
}

class LogoutRequested extends AuthEvent {}

class SignupRequested extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String username;

  SignupRequested(this.email, this.password, this.name, this.username);
}

class RefreshTokenRequested extends AuthEvent {
  final String refreshToken;

  RefreshTokenRequested(this.refreshToken);
}

class ForgotPasswordRequested extends AuthEvent {
  final String email;

  ForgotPasswordRequested(
    this.email,
  );
}

class ResetPasswordRequested extends AuthEvent {
  final int otp;
  final String newPassword;

  ResetPasswordRequested(
    this.otp,
    this.newPassword,
  );
}
