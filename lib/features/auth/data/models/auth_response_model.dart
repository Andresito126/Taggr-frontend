import '../../domain/entities/user.dart';

class AuthResponseModel {
  final User user;

  AuthResponseModel({required this.user});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      // Mapeamos el "user_id" de tu backend a la entidad inmaculada
      user: User(id: json['user_id']),
    );
  }
}