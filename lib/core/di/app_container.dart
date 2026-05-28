import 'package:shared_preferences/shared_preferences.dart';
import 'package:taggr/core/network/api_client.dart';
import 'package:taggr/core/storage/user_storage.dart';

import 'package:taggr/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:taggr/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:taggr/features/auth/domain/repositories/auth_repository.dart';




class AppContainer {
  // instnacias del core pa
  late final UserStorage userStorage;
  late final ApiClient apiClient;
  late final AuthRepository authRepository;

  AppContainer._();

  // metodo fabrica
  static Future<AppContainer> create() async {
    final container = AppContainer._();
    await container._init();
    return container;
  }

  Future<void> _init() async {
    // se incia los paquetes externos asincronos primero
    final prefs = await SharedPreferences.getInstance();

    // se inyecta de abjo haci arriba
    userStorage = UserStorage(prefs);
    apiClient = ApiClient(userStorage);

    final authDataSource = AuthRemoteDataSource(apiClient);
    authRepository = AuthRepositoryImpl(authDataSource, userStorage);

    
  }
}