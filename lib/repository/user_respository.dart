import 'package:batch28_api_starter/api/user_api.dart';
import 'package:batch28_api_starter/model/user_model.dart';

class UserRepository{
  Future<bool> registerUser(User user) async {
    return await UserApi().registerUser(user);

  }
  Future<bool>login(String username, String password) async {
    return await UserApi().login(username, password);
  }
}