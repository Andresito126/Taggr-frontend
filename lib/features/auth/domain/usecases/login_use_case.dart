import 'package:taggr/features/auth/domain/entities/user.dart';
import 'package:taggr/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<User> call(String email, String password) => 
      _repository.login(email, password);
}