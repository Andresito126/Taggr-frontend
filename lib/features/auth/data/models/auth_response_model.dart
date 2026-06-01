import '../../domain/entities/user.dart';

class AuthResponseModel {
  final User user;

  AuthResponseModel({required this.user});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      user: User(id: json['user_id']),
    );
  }
}