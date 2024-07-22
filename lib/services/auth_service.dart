import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_starter/models/login_model.dart';
import 'package:riverpod_starter/utils/config.dart';
import 'package:riverpod_starter/utils/shared_preference.dart';

class AuthService {
  Future<LoginModel> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("${AppConfig.baseUrl}/login"),
      headers: {'Accept': 'application/json'},
      body: {
        'email': email,
        'password': password,
      },
    );

    final jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      SharedPreferencesHelper.instance
          .setString("token", jsonResponse['access_token']);
      SharedPreferencesHelper.instance.setBool("isLogin", true);
      return LoginModel.fromJson(jsonResponse);
    } else {
      throw Exception(jsonResponse['message']);
    }
  }

  Future<void> logout() async {
    SharedPreferencesHelper.instance.clear();
  }
}
