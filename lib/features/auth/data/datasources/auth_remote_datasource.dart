import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taggr/core/network/api_client.dart';
import 'package:taggr/features/auth/data/models/auth_response_model.dart';
import 'package:taggr/features/auth/data/models/login_request_model.dart';
import 'package:taggr/features/auth/data/models/register_request_model.dart';

class AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSource(this._apiClient);

  http.Client get _client => _apiClient.client;
  Uri _uri(String path) => Uri.parse('${ApiClient.baseUrl}$path');

  Future<AuthResponseModel> login(LoginRequestModel request) async {
    final response = await _client.post(
      _uri('/auth/login'),
      headers: _apiClient.headersPublic,
      body: jsonEncode(request.toJson()),
    );
    _checkStatus(response);
    return AuthResponseModel.fromJson(jsonDecode(response.body));
  }

  Future<AuthResponseModel> register(RegisterRequestModel request) async {
    final response = await _client.post(
      _uri('/auth/register'),
      headers: _apiClient.headersPublic,
      body: jsonEncode(request.toJson()),
    );
    _checkStatus(response);
    return AuthResponseModel.fromJson(jsonDecode(response.body));
  }

  void _checkStatus(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('HTTP ${response.statusCode}: ${response.body}');
    }
  }
}