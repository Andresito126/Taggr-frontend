import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taggr/core/network/api_client.dart';
import 'package:taggr/features/posts/data/models/post_response_model.dart';
import 'package:taggr/features/posts/data/models/create_post_request_model.dart';
import 'package:taggr/features/posts/data/models/update_post_request_model.dart';

class PostRemoteDataSource {
  final ApiClient _apiClient;

  PostRemoteDataSource(this._apiClient);

  http.Client get _client => _apiClient.client;
  Uri _uri(String path) => Uri.parse('${ApiClient.baseUrl}$path');

  Future<PostResponseModel> createPost(CreatePostRequestModel request) async {
    final response = await _client.post(
      _uri('/posts'),
      headers: _apiClient.headersWithAuth(),
      body: jsonEncode(request.toJson()),
    );
    _checkStatus(response);

    return PostResponseModel.fromJson(jsonDecode(response.body));
  }

Future<List<PostResponseModel>> getAllPosts() async {
    final response = await _client.get(
      _uri('/posts'),
      headers: _apiClient.headersWithAuth(),
    );
    _checkStatus(response);

    // decodifico el body que viene como una list
    final List<dynamic> jsonList = jsonDecode(response.body);

    // ya solo itero y se convierte cada son en un postResponseModel
    return jsonList.map((json) => PostResponseModel.fromJson(json)).toList();
  }

  
  Future<PostResponseModel> updatePost(String id, UpdatePostRequestModel request) async {

    final response = await _client.put(
      _uri('/posts/$id'),
      headers: _apiClient.headersWithAuth(),
      body: jsonEncode(request.toJson()),
    );
    _checkStatus(response);

    return PostResponseModel.fromJson(jsonDecode(response.body));

  }


  Future<void> deletePost(String id) async {
    final response = await _client.delete(
      _uri('/posts/$id'),
      headers: _apiClient.headersWithAuth(),
    );
    _checkStatus(response);
  }


  void _checkStatus(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('HTTP ${response.statusCode}: ${response.body}');
    }
  }
}
