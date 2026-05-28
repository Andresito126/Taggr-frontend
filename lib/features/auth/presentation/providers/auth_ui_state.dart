import 'package:taggr/features/auth/domain/entities/user.dart';

sealed class AuthUiState {}

class AuthInitial extends AuthUiState {}

class AuthLoading extends AuthUiState {}

class AuthSuccess extends AuthUiState {
  final User user;
  AuthSuccess(this.user);
}

class AuthError extends AuthUiState {
  final String message;
  AuthError(this.message);
}