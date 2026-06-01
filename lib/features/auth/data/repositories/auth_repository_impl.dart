import 'package:taggr/core/storage/user_storage.dart';
import 'package:taggr/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:taggr/features/auth/data/models/login_request_model.dart';
import 'package:taggr/features/auth/data/models/register_request_model.dart';
import 'package:taggr/features/auth/domain/entities/user.dart';
import 'package:taggr/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _dataSource;
  final UserStorage _userStorage;

  AuthRepositoryImpl(this._dataSource, this._userStorage);

  @override
  Future<User> login(String email, String password) async {
    final request = LoginRequestModel(email: email, password: password);
    final response = await _dataSource.login(request);
    
    // se guarda el id en shared preferences o sea el local
    await _userStorage.saveUserId(response.user.id);
    return response.user;
  }

  @override
  Future<User> register(String username, String email, String password) async {
    final request = RegisterRequestModel(username: username, email: email, password: password);
    final response = await _dataSource.register(request);
    
    await _userStorage.saveUserId(response.user.id);
    return response.user;
  }

  @override
  Future<void> logout() async {
    await _userStorage.clearSession();
  }

  bool get isLoggedIn {
    return _userStorage.hasSession; 
  }
}