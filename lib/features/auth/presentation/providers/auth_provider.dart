import 'package:flutter/material.dart';
import 'package:taggr/features/auth/domain/usecases/check_auth_use_case.dart';
import 'package:taggr/features/auth/domain/usecases/login_use_case.dart';
import 'package:taggr/features/auth/domain/usecases/logout_usecase.dart';
import 'package:taggr/features/auth/domain/usecases/register_use_case.dart';
import 'package:taggr/features/auth/presentation/providers/auth_ui_state.dart';

class AuthProvider extends ChangeNotifier {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final LogoutUseCase _logoutUseCase;
  final CheckAuthUseCase _checkAuthUseCase;

  AuthProvider({
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
    required LogoutUseCase logoutUseCase,
    required CheckAuthUseCase checkAuthUseCase,
  })  : _loginUseCase = loginUseCase,
        _registerUseCase = registerUseCase,
        _logoutUseCase = logoutUseCase,
        _checkAuthUseCase = checkAuthUseCase;

  AuthUiState _state = AuthInitial();
  AuthUiState get state => _state;

  bool get isLoggedIn => _checkAuthUseCase.call();

  Future<void> login(String email, String password) async {
    _emit(AuthLoading());
    try {
      final user = await _loginUseCase(email, password);
      _emit(AuthSuccess(user));
    } catch (e) {
      _emit(AuthError('Error al iniciar sesión: $e'));
    }
  }

  Future<void> register(String username, String email, String password) async {
    _emit(AuthLoading());
    try {
      final user = await _registerUseCase(username, email, password);
      _emit(AuthSuccess(user));
    } catch (e) {
      _emit(AuthError('Error al registrarse: $e'));
    }
  }

  Future<void> logout() async {
    await _logoutUseCase();
    _emit(AuthInitial());
  }

  void resetState() {
    _state = AuthInitial();
    notifyListeners();
  }

  void _emit(AuthUiState newState) {
    _state = newState;
    notifyListeners();
  }
}