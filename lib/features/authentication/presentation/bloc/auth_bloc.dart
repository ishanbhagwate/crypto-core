import 'package:crypto_core/core/services/token_storage_service.dart';
import 'package:crypto_core/features/authentication/domain/entities/user.dart';
import 'package:crypto_core/features/authentication/domain/usecases/forgot_password_usecase.dart';
import 'package:crypto_core/features/authentication/domain/usecases/refresh_token_usecase.dart';
import 'package:crypto_core/features/authentication/domain/usecases/reset_password_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final SignupUsecase signupUsecase;
  final RefreshTokenUsecase refreshTokenUsecase;
  final ForgotPasswordUsecase forgotPasswordUsecase;
  final ResetPasswordUsecase resetPasswordUsecase;
  final LogoutUsecase logoutUsecase;
  final TokenStorageService tokenStorageService;

  AuthBloc({
    required this.loginUsecase,
    required this.signupUsecase,
    required this.refreshTokenUsecase,
    required this.logoutUsecase,
    required this.tokenStorageService,
    required this.forgotPasswordUsecase,
    required this.resetPasswordUsecase,
  }) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<SignupRequested>(_onSignupRequested);
    on<RefreshTokenRequested>(_onRefreshTokenRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<AppStarted>(_onAppStarted);
    on<ForgotPasswordRequested>(_onForgotPasswordRequested);
    on<ResetPasswordRequested>(_onResetPasswordRequested);
  }

  Future<void> _onLoginRequested(
      LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final failureOrUser = await loginUsecase.call(event.email, event.password);
    emit(_eitherSuccessOrFailure(failureOrUser));
  }

  Future<void> _onSignupRequested(
      SignupRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final failureOrUser = await signupUsecase.call(
      event.email,
      event.password,
      event.name,
      event.username,
    );
    emit(_eitherSuccessOrFailure(failureOrUser));
  }

  Future<void> _onForgotPasswordRequested(
      ForgotPasswordRequested event, Emitter<AuthState> emit) async {
    emit(ForgotPasswordLoading());
    // final failureOrUser = await signupUsecase.call(
    //   event.email,
    //   event.password,
    //   event.name,
    //   event.username,
    // );
    // emit(_eitherSuccessOrFailure(failureOrUser));
  }

  Future<void> _onResetPasswordRequested(
      ResetPasswordRequested event, Emitter<AuthState> emit) async {
    emit(ResetPasswordLoading());
    // final failureOrUser = await signupUsecase.call(
    //   event.email,
    //   event.password,
    //   event.name,
    //   event.username,
    // );
    // emit(_eitherSuccessOrFailure(failureOrUser));
  }

  Future<void> _onRefreshTokenRequested(
      RefreshTokenRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final failureOrUser = await refreshTokenUsecase.call(event.refreshToken);
    emit(_eitherSuccessOrFailure(failureOrUser));
  }

  Future<void> _onLogoutRequested(
      LogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await logoutUsecase.call();
    emit(AuthUnauthenticated());
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    // final token = await tokenStorageService.getAccessToken();
    // if (token != null) {
    //   final user = await tokenStorageService.getUser(); // Replace with actual logic
    //   emit(AuthAuthenticated(user));
    // } else {
    //   emit(AuthUnauthenticated());
    // }
  }

  AuthState _eitherSuccessOrFailure(Either<String, User> either) {
    return either.fold(
      (failure) => AuthError(failure),
      (user) => AuthAuthenticated(user),
    );
  }
}
