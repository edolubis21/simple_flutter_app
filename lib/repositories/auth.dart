import 'package:simple_flutter_app/models/auth.dart';

class AuthRepositories {
  static Future<Auth> authLogin({String email, String password}) async {
    return Auth(token: "$email $password");
  }
}
