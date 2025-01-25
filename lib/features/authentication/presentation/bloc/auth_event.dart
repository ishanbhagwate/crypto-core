part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AppStarted extends AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String? password;
  final bool isSocial;
  final String? provider;
  final String? providerId;
  final String? deviceInfo;
  final String? ipAddress;

  LoginRequested({
    required this.email,
    this.password,
    required this.isSocial,
    this.deviceInfo,
    this.ipAddress,
    this.provider,
    this.providerId,
  });
}

class LogoutRequested extends AuthEvent {}

class SignupRequested extends AuthEvent {
  final String email;
  final String name;
  final String? password;
  final bool isSocial;
  final String? provider;
  final String? providerId;
  final String? deviceInfo;
  final String? ipAddress;

  SignupRequested({
    required this.email,
    required this.name,
    this.password,
    required this.isSocial,
    this.deviceInfo,
    this.ipAddress,
    this.provider,
    this.providerId,
  });
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
  final String email;
  final int otp;
  final String newPassword;

  ResetPasswordRequested(
    this.email,
    this.otp,
    this.newPassword,
  );
}
