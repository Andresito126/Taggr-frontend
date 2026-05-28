
import 'package:taggr/features/auth/domain/entities/user.dart';

abstract class AuthRepository{
  Future <User> login (String email, String password);
  Future <User> register (String username, String email, String password);
  Future<void> logout();
  bool get isLoggedIn;


}