import 'package:crypto_core/core/services/token_storage_service.dart';
import 'package:crypto_core/features/authentication/domain/entities/user.dart';
import 'package:crypto_core/features/authentication/domain/usecases/refresh_token_usecase.dart';
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
  final LogoutUsecase logoutUsecase;
  final TokenStorageService tokenStorageService;

  AuthBloc({
    required this.loginUsecase,
    required this.signupUsecase,
    required this.refreshTokenUsecase,
    required this.logoutUsecase,
    required this.tokenStorageService,
  }) : super(AuthInitial());

  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginRequested) {
      yield AuthLoading();
      final failureOrUser = await loginUsecase.call(
        event.email,
        event.password,
      );
      yield* _eitherSuccessOrFailure(failureOrUser);
    } else if (event is SignupRequested) {
      yield AuthLoading();
      final failureOrUser = await signupUsecase.call(
        event.email,
        event.password,
        event.name,
        event.username,
      );
      yield* _eitherSuccessOrFailure(failureOrUser);
    } else if (event is RefreshTokenRequested) {
      yield AuthLoading();
      final failureOrUser = await refreshTokenUsecase.call(
        event.refreshToken,
      );
      yield* _eitherSuccessOrFailure(failureOrUser);
    } else if (event is LogoutRequested) {
      // Clear any saved tokens or session data
      yield AuthLoading();
      await logoutUsecase.call();
      yield AuthUnauthenticated();
    }else if(event is AppStarted){
      // final token = await tokenStorageService.getAccessToken();
      // if(token != null){
      //   yield AuthAuthenticated(user)
      // }
    }
  }

  Stream<AuthState> _eitherSuccessOrFailure(
      Either<String, User> either) async* {
    yield either.fold(
      (failure) => AuthError(failure),
      (user) => AuthAuthenticated(user),
    );
  }
}
