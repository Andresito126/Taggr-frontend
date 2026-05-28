import 'package:shared_preferences/shared_preferences.dart';
import 'package:taggr/core/network/api_client.dart';
import 'package:taggr/core/storage/user_storage.dart';



class AppContainer {
  // Las instancias de tu Core
  late final UserStorage userStorage;
  late final ApiClient apiClient;

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

    
  }
}