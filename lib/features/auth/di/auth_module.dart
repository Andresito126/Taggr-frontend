import 'package:taggr/core/di/app_container.dart';
import 'package:taggr/features/auth/domain/usecases/check_auth_use_case.dart';
import 'package:taggr/features/auth/domain/usecases/login_use_case.dart';
import 'package:taggr/features/auth/domain/usecases/logout_usecase.dart';
import 'package:taggr/features/auth/domain/usecases/register_use_case.dart';
import 'package:taggr/features/auth/presentation/providers/auth_provider.dart';

class AuthModule {
  final AppContainer _appContainer;

  AuthModule(this._appContainer);

  LoginUseCase _provideLoginUseCase() =>
      LoginUseCase(_appContainer.authRepository);

  RegisterUseCase _provideRegisterUseCase() =>
      RegisterUseCase(_appContainer.authRepository);

  LogoutUseCase _provideLogoutUseCase() =>
      LogoutUseCase(_appContainer.authRepository);

  CheckAuthUseCase _provideCheckAuthUseCase() =>
      CheckAuthUseCase(_appContainer.authRepository);

  AuthProvider provideAuthProvider() {
    return AuthProvider(
      loginUseCase: _provideLoginUseCase(),
      registerUseCase: _provideRegisterUseCase(),
      logoutUseCase: _provideLogoutUseCase(),
      checkAuthUseCase: _provideCheckAuthUseCase(),
    );
  }
}