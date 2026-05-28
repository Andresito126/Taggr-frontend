
import 'package:taggr/features/auth/domain/entities/user.dart';
import 'package:taggr/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository _repository;

  LoginUsecase (this._repository);

  Future <User> call( String email, String password) async {

    if (email.trim().isEmpty || !email.contains('@')) {
      throw Exception('Formato de correo inválido.');
    }
    if (password.trim().isEmpty) {
      throw Exception('La contraseña no puede estar vacía.');
    }
    return _repository.login(email, password);
  }
    
} 