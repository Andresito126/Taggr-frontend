import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:taggr/core/storage/user_storage.dart';

class ApiClient {
  static const String baseUrl = 'http://172.20.10.8:3000/api';

  final http.Client client;
  final UserStorage _userStorage; 

  ApiClient(this._userStorage) : client = http.Client();

  Map<String, String> headersWithAuth() {
    final userId = _userStorage.getUserId();
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      if (userId != null) 'x-user-id': userId, 
    };
  }

  Map<String, String> get headersPublic => {
    HttpHeaders.contentTypeHeader: 'application/json',
  };
}