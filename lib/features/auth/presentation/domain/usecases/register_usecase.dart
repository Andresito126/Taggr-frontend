import 'package:taggr/features/auth/presentation/domain/entities/user.dart';
import 'package:taggr/features/auth/presentation/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _repository;
  RegisterUseCase(this._repository);

  Future<User> call(String username, String email, String password) =>
  
      _repository.register(username, email, password);
}